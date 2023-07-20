// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

part of 'custom_form.widget.dart';

class InputPhoneNumber extends StatefulWidget implements ValidatableInputField {
  final void Function(String)? onChange;
  final List<String>? exclude;
  final List<String>? filter;
  final String title;
  final Color? fillColor;
  final bool enable;
  final TextStyle? titleStyle;
  final String hint;
  final String defaultCountry;
  final String? initialValue;
  final _codes = <Tuple<String, int>>[];
  final bool isDense;
  final TextEditingController? controller;
  final OutlineInputBorder? border;
  final Color? borderColor;

  @override
  late FocusNode focusNode;

  @override
  late GlobalKey<FormFieldState> validationKey;

  InputPhoneNumber({
    super.key,
    List<String>? exclude,
    List<String>? filter,
    this.onChange,
    this.title = '',
    this.fillColor = const Color(0xffF9FAFB),
    this.enable = true,
    this.titleStyle,
    this.hint = '',
    this.defaultCountry = 'EG',
    this.initialValue,
    this.isDense = true,
    this.controller,
    this.border,
    this.borderColor,
  })  : exclude = exclude?.map((e) => e.toUpperCase()).toList(),
        filter = filter?.map((e) => e.toUpperCase()).toList() {
    if (this.filter != null) {
      _codes.addAll(countryCodes.where((e) => this.filter!.contains(e.head)));
    } else {
      _codes.addAll(countryCodes);
    }
    if (this.exclude != null) {
      _codes.removeWhere((e) => this.exclude!.contains(e.head));
    }
    assert(
      _codes.isNotEmpty,
      'You Can\'t Write Phone Number Without Country Codes',
    );
  }

  @override
  State<InputPhoneNumber> createState() => InputPhoneNumberState();
}

class InputPhoneNumberState extends State<InputPhoneNumber> {
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
  void didUpdateWidget(covariant InputPhoneNumber oldWidget) {
    widget
      ..validationKey = key
      ..focusNode = node;
    super.didUpdateWidget(oldWidget);
  }

  late final _controller = (widget.controller ?? TextEditingController())
    ..text = (widget.initialValue ?? '').replaceAll(
        RegExp("(${countryCodes.map((e) => '\\+${e.tail}').join('|')})"), '');

  /// this field will be used to track which country is selected
  /// at first time that user open widget the selected country will be [widget.defaultCountry]
  /// if [widget.defaultCountry] not exists then it will be first country in the list
  late Tuple<String, int> _country = widget._codes.firstWhere(
    (e) => e.head == widget.defaultCountry,
    orElse: () => widget._codes.first,
  );

  /// this field will be used to show countries and search in it without
  /// any modification on main list [widget._codes]
  late final _countries = [...widget._codes];

  /// if this field empty then don't show it
  /// else show it as an error message and hide it again if user write anything
  /// in text field
  String _errorMsg = '';

  /// this function will be used to append error message bellow this widget
  void setErrorMsg(String msg) {
    if (msg == _errorMsg) return;
    setState(() => _errorMsg = msg);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title.isNotEmpty) ...[
          Txt.t(
            widget.title,
            style: widget.titleStyle ??
                const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
          ),
          space8
        ],
        TextFormField(
          key: widget.validationKey,
          focusNode: widget.focusNode,
          controller: _controller,
          enabled: widget.enable,
          onChanged: (value) {
            setErrorMsg('');
            widget.onChange?.call('+${_country.tail}$value');
          },
          validator: (value) => phone.head(value) ? null : '✘ ${phone.tail}',
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          keyboardType: TextInputType.phone,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            isDense: widget.isDense,
            hintText: widget.hint.isNotEmpty ? tr(widget.hint) : null,
            hintStyle: const TextStyle(color: darkGrey, fontSize: 14),
            border: _border(color: widget.borderColor ?? white),
            disabledBorder: _border(color: widget.borderColor ?? white),
            enabledBorder: _border(color: widget.borderColor ?? white),
            focusedBorder: _border(color: primaryColor),
            errorBorder: _border(color: const Color(0xffFF3F3F)),
            fillColor: widget.fillColor,
            filled: true,
            prefixIcon: _buildPrefixIcon,
            suffixIcon: ExcludeFocus(
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(maxHeight: 70.h),
                    isDismissible: true,
                    barrierColor: const Color(0xff101817).withOpacity(0.4),
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    builder: _buildCountryCodesList,
                  );
                },
                splashRadius: 0.1,
                icon: widget.enable
                    ? const Icon(Icons.keyboard_arrow_down_rounded)
                    : empty,
              ),
            ),
          ),
        ),
        Visibility(
          visible: _errorMsg.isNotEmpty,
          child: Column(
            children: [
              space4,
              Txt.t(_errorMsg, style: const TextStyle(color: Colors.red))
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCountryCodesList(_) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(12),
      ),
      child: StatefulBuilder(builder: (context, state) {
        return Padding(
          padding: edgeH24,
          child: Column(
            children: [
              space32,
              ClipRRect(
                borderRadius: circular12,
                child: TextField(
                  onChanged: (value) {
                    _countries.clear();
                    if (value.isEmpty) {
                      state(() {
                        _countries.addAll(widget._codes);
                      });
                      return;
                    }
                    state(() {
                      for (final c in widget._codes) {
                        if (c.head.startsWith(value.toUpperCase()) ||
                            tr('countries.${c.head}')
                                .toLowerCase()
                                .startsWith(value.toLowerCase())) {
                          _countries.add(c);
                        }
                      }
                    });
                  },
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, size: 20),
                    hintText: 'search',
                    fillColor: const Color(0xffF2F4F7),
                    filled: true,
                    hintStyle: const TextStyle(color: darkGrey),
                    border: InputBorder.none,
                  ),
                ),
              ),
              space24,
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, i) {
                    final c = _countries[i];
                    return _buildCountryTile(c);
                  },
                  itemCount: _countries.length,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  /// this is widget that will be show in list of country
  /// if user tap on any of this tiles it will close the list and update selected country
  /// finally it will call [widget.onChange] function
  Widget _buildCountryTile(Tuple<String, int> c) {
    return GestureDetector(
      onTap: () {
        _country = c;
        pop(version: 1);
        widget.onChange?.call('+${_country.tail}${_controller.text}');
        _countries.clear();
        _countries.addAll(widget._codes);
        setState(() {});
      },
      child: Column(
        children: [
          Row(
            children: [
              Txt.t(c.head.toFlag, style: const TextStyle(fontSize: 24)),
              space16,
              ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 45),
                child: Txt.t(
                  '+${c.tail}',
                  style: const TextStyle(fontSize: 16, color: darkGrey),
                ),
              ),
              space16,
              Expanded(
                child: Txt.t(
                  'countries.${c.head}',
                  size: 16,
                  color: primaryColor,
                  weight: 400,
                ),
              ),
            ],
          ),
          space32,
        ],
      ),
    );
  }

  /// it just widget to showing flag and country code of selected country
  Column get _buildPrefixIcon {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: edgeH8,
          child: Text.rich(
            TextSpan(
              style: const TextStyle(fontSize: 16),
              children: [
                TextSpan(text: _country.head.toFlag),
                TextSpan(
                  text: ' (+${_country.tail}) ',
                  style:const TextStyle(color: primaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// default border that will apply on input field
  OutlineInputBorder _border({required Color color}) {
    return widget.border == null
        ? OutlineInputBorder(
            borderRadius: circular12,
            borderSide: BorderSide(color: color),
          )
        : widget.border!.copyWith(borderSide: BorderSide(color: color));
  }
}
