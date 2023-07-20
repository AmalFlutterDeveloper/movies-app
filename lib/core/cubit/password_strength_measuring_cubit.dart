import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/dartz/dartz.core.dart';
import 'package:movies_app/core/validation.dart';

class PasswordStrengthMeasuringCubit extends Cubit<Tuple<String, Color>> {
  PasswordStrengthMeasuringCubit() : super(const Tuple('', Colors.transparent));

  /// The password is weak if it contains less than 8 characters
  /// or contains only one set of characters.
  final weak = const Tuple('Weak Password', Color(0xffF2C94C));

  /// The password is medium  if it contains more than 8 characters
  /// and  contains only two sets of characters.
  final medium = const Tuple('Medium Password', Color(0xff209FF0));

  /// The password is strong if it contains more than 8 characters
  /// and contains more than two sets of characters.
  final strong = const Tuple('Strong Password', Color(0xff27AE60));

  /// empty state
  final empty = const Tuple('', Colors.transparent);

  final _sets = [
    containsDigit,
    containsLower,
    containsSpecialSymbols,
    containsUpper,
  ];

  void calculate(String password) {
    final isStrong = _validate(password, [
      require,
      minLen(8),
      atLeast(3, _sets),
    ]);
    if (isStrong) return emit(strong);
    final isMedium = _validate(password, [
      require,
      minLen(8),
      only(2, _sets),
    ]);
    if (isMedium) return emit(medium);
    final isWeek = _validate(password, [
      require,
      maxLen(7),
      atLeast(1, _sets),
    ]);
    if (isWeek) return emit(weak);
    emit(empty);
  }

  bool _validate(String value, List<Validate> validations) {
    for (final v in validations) {
      if (!v.head(value)) return false;
    }
    return true;
  }

  void clear() {
    emit(const Tuple('', Colors.transparent));
  }
}
