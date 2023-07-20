// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'custom_form.widget.dart';

class InputTextField extends StatefulWidget implements ValidatableInputField {
  final List<Validate>? validations;
  final List<Validate> Function()? dynamicValidations;
  final bool validateAll;
  final String title;
  final String hint;
  final FontWeight? fontWeight;
  final Color? colorText;
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String)? onChange;
  final int maxLines;
  final String? init;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final TextStyle? style;
  final int? maxInputLength;

  /// it's mean hide keyboard after submit
  final bool hideKeyboard;
  final TextStyle? titleStyle;
  final OutlineInputBorder? border;
  final Color? filledColor;
  final Color? borderColor;
  final bool enable;
  final CustomFormatter? formatter;
  final VoidCallback? onSubmit;
  final Widget titleSpace;
  @override
  late FocusNode focusNode;

  @override
  late GlobalKey<FormFieldState> validationKey;

  InputTextField({
    super.key,
    this.validations,
    this.validateAll = false,
    this.title = '',
    this.hint = '',
    this.fontWeight,
    this.colorText,
    this.controller,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.maxLines = 1,
    this.init,
    this.maxInputLength,
    this.border,
    this.isDense = true,
    this.contentPadding,
    this.filledColor,
    this.suffix,
    this.onSubmit,
    this.enable = true,
    this.style,
    this.dynamicValidations,
    this.hideKeyboard = false,
    this.titleStyle,
    this.borderColor,
    this.suffixIcon,
    this.formatter,
    this.titleSpace = space8,
  });

  @override
  State<InputTextField> createState() => InputTextFieldState();
}

class InputTextFieldState extends State<InputTextField> {
  final key = GlobalKey<FormFieldState>();
  final node = FocusNode();
  @override
  void initState() {
    widget
      ..validationKey = key
      ..focusNode = node;
    _FormCubit.instance(context)?.register(widget);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant InputTextField oldWidget) {
    widget
      ..validationKey = key
      ..focusNode = node;
    super.didUpdateWidget(oldWidget);
  }

  /// this field will be used to control what is state of password (visible and invisible)
  late bool _hideContent = widget.keyboardType == TextInputType.visiblePassword;

  late final _controller = (widget.controller ?? TextEditingController())
    ..text = widget.init ?? '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Txt.t(
              widget.title,
              style: widget.titleStyle ??
                  TextStyle(
                    fontWeight: FontWeight.w500,
                    color: hintColor,
                  ),
            ),
          ),
          widget.titleSpace,
        ],
        TextFormField(
          key: widget.validationKey,
          focusNode: widget.focusNode,
          minLines: 1,
          cursorHeight: 22.0,
          enabled: widget.enable,
          controller: _controller,
          onChanged: widget.onChange,
          maxLines: widget.maxLines,
          maxLength: widget.maxInputLength,
          validator: (value) {
            if (!widget.enable) return null;
            if (widget.keyboardType == TextInputType.visiblePassword) {
              context.read<PasswordStrengthMeasuringCubit>().clear();
            }
            final errors = StringBuffer();
            for (final v in widget.validations ?? <Validate>[]) {
              if (!v.head(value)) {
                errors.writeln('✘ ${v.tail}');
                if (!widget.validateAll) return errors.toString();
              }
            }
            for (final v in widget.dynamicValidations?.call() ?? <Validate>[]) {
              if (!v.head(value)) {
                errors.writeln('✘ ${v.tail}');
                if (!widget.validateAll) return errors.toString();
              }
            }
            if (errors.isEmpty) return null;
            return errors.toString();
          },
          onEditingComplete: () => widget.hideKeyboard
              ? hideKeyboard()
              : FocusScope.of(context).nextFocus(),
          onFieldSubmitted: (_) => widget.onSubmit?.call(),
          keyboardType: widget.keyboardType,
          obscureText: _hideContent,
          style: widget.style ??
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
          inputFormatters: widget.formatter != null
              ? [
                  FilteringTextInputFormatter.allow(
                    RegExp(widget.formatter!.allow),
                  ),
                  FilteringTextInputFormatter.deny(
                    RegExp(widget.formatter!.deny),
                  ),
                  widget.formatter!,
                ]
              : null,
          decoration: InputDecoration(
            isDense: widget.isDense,
            prefixIcon: widget.prefixIcon,
            suffix: widget.suffix,
            contentPadding: widget.contentPadding,
            hintText: widget.hint.isNotEmpty ? tr(widget.hint) : null,
            hintStyle: TextStyle(color: hintColor),
            border: _border(color: widget.borderColor ?? fillInputColor),
            disabledBorder:
                _border(color: widget.borderColor ?? fillInputColor),
            enabledBorder: _border(color: widget.borderColor ?? fillInputColor),
            focusedBorder: _border(color: widget.borderColor ?? primaryColor),
            errorBorder: _border(color: const Color(0xffFF3F3F)),
            fillColor: widget.filledColor ?? fillInputColor,
            filled: true,
            suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                ? ExcludeFocus(
                    child: IconButton(
                      onPressed: () =>
                          setState(() => _hideContent = !_hideContent),
                      splashRadius: 0.1,
                      icon: _hideContent
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                  )
                : widget.suffixIcon,
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border({required Color color}) {
    return widget.border == null
        ? OutlineInputBorder(
            borderRadius: circular24,
            borderSide: BorderSide(color: color, width: 0),
          )
        : widget.border!.copyWith(borderSide: BorderSide(color: color));
  }
}
