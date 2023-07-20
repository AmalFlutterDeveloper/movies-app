
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/core/config.core.dart';
import 'package:movies_app/core/constant/padding.core.dart';
import 'package:movies_app/core/constant/radius.core.dart';
import 'package:movies_app/core/constant/space.core.dart';
import 'package:movies_app/core/country_codes.core.dart';
import 'package:movies_app/core/cubit/password_strength_measuring_cubit.dart';
import 'package:movies_app/core/dartz/dartz.core.dart';
import 'package:movies_app/core/extensions/number.core.dart';
import 'package:movies_app/core/navigation.core.dart';
import 'package:movies_app/core/extensions/string.core.dart';
import 'package:movies_app/core/validation.dart';
import 'package:movies_app/presentation/widgets/text_field/custom_formatter.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';
part 'input_field.dart';
part 'input_phone_number.dart';

class CustomForm extends StatefulWidget {
  final Widget child;
  final bool autoScrollToError;
  const CustomForm({
    Key? key,
    required this.child,
    this.autoScrollToError = true,
  }) : super(key: key);

  @override
  State<CustomForm> createState() => CustomFormState();
}

class CustomFormState extends State<CustomForm> {
  final _cubit = _FormCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Builder(
        builder: (context) => widget.child,
      ),
    );
  }

  ValidatableInputField? error;

  bool validate() {
    error = null;
    for (var k in _cubit._fields) {
      if (k.validationKey.currentState?.validate() == false) error ??= k;
    }
    if (widget.autoScrollToError) error?.focusNode.requestFocus();
    return error == null;
  }
}

abstract class ValidatableInputField {
  final FocusNode focusNode;
  final GlobalKey<FormFieldState> validationKey;

  const ValidatableInputField(this.focusNode, this.validationKey);
}

class _FormCubit extends Cubit<List> {
  _FormCubit() : super([]);

  static _FormCubit? instance(BuildContext? context) {
    try {
      return context?.read<_FormCubit>();
    } catch (e) {
      return null;
    }
  }

  final _fields = <ValidatableInputField>[];
  void register(ValidatableInputField widget) => _fields.add(widget);
  void remove(ValidatableInputField key) => _fields.remove(key);
}
