// ignore_for_file: curly_braces_in_flow_control_structures
import 'package:flutter/cupertino.dart';
import 'package:movies_app/core/dartz/dartz.core.dart';


/// simple type that will be return from any validation function
typedef Validate = Tuple<bool Function(String?), String>;

// ----------------------- default validators -------------------------

/// this is default rule to validate password across application
final passwordValidators = [
  require,
  minLen(8),
  maxLen(20),
  atLeast(3, [
    containsLower,
    containsUpper,
    containsDigit,
    containsSpecialSymbols,
  ]),
];

// ------------------------  required validations ------------------------

/// will return true if [value] not null and not empty
final require = Tuple(
  (String? value) => value != null && value.isNotEmpty,
  '',
);

// ----------------------- length validations -------------------------

/// validate that [value as String] length more than or equal to [n]
Validate minLen(int n) {
  return Tuple(
    (String? v) => (v == null || v.isEmpty) || (v.length >= n),
   '',
  );
}

/// validate that [value] length less than or equal to [n]
Validate maxLen(int n) {
  return Tuple(
    (String? v) => (v == null || v.isEmpty) || (v.length <= n),
    '',
  );
}

/// validate that [value] length is equal to [n]
Validate length(int n) {
  return Tuple(
    (String? v) => (v == null || v.isEmpty) || (v.length == n),
    '',
  );
}

// ------------------------ number value validations ------------------------

/// validate that [value as numbers] length more than or equal to [n]
Validate min(num n) {
  return Tuple(
    (String? v) {
      if (v == null || v.isEmpty) return true;
      return (num.tryParse(v) ?? -1) >= n;
    },
    '',
  );
}

/// validate that [value] length less than or equal to [n]
Validate max(num n) {
  return Tuple(
    (String? v) {
      if (v == null || v.isEmpty) return true;
      return (num.tryParse(v) ?? 1000000) <= n;
    },
   '',
  );
}

// -------------------- type validations ----------------------------

/// will return true if all [value] is characters or space
final onlyCharacters = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '^[a-zA-Z \\u0621-\\u064A]+\$';
    return RegExp(rgx).hasMatch(v.trim());
  },
 '',
);

/// will return true if all [value] is digits
final onlyDigits = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '^[0-9\\.-]+\$';
    return RegExp(rgx).hasMatch(v.trim());
  },
  '',
);

// ------------------- contains validation -----------------------------

/// will return true if all [value] contains al least one digit
final containsDigit = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '[0-9]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  '',
);

/// will return true if [value] contains at least one lower char
final containsLower = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '[a-z]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  '',
);

/// will return true if [value] contains at least one upper char
final containsUpper = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = '[A-Z]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  '',
);

/// will return true if [value] contains at least one
/// special symbols `$&+,:;=?@#|<>.^*()%!-`
final containsSpecialSymbols = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx = r'[$&+,:;=?@#|<>.^*()%!-]';
    return RegExp(rgx).hasMatch(v.trim());
  },
  '',
);

// -------------------- merged validations ----------------------------

/// will return true if at least [number] of [validations] is true
Validate atLeast(int number, List<Validate> validations) {
  final msg = StringBuffer(
    '',
  );
  for (final v in validations) msg.writeln('  - ${v.tail}');
  return Tuple(
    (v) {
      int passed = 0;
      for (final validate in validations) if (validate.head(v)) passed++;
      return passed >= number;
    },
    msg.toString(),
  );
}

/// will return true if only [number] of [validations] is true
/// not more or less than [number]
Validate only(int number, List<Validate> validations) {
  final msg = StringBuffer(
    '',
  );
  for (final v in validations) msg.writeln('  - ${v.tail}');
  return Tuple(
    (v) {
      int passed = 0;
      for (final validate in validations) if (validate.head(v)) passed++;
      return passed == number;
    },
    msg.toString(),
  );
}

// -------------------- phone & email validation ----------------------------

/// validate that [value] is a phone number
final phone = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return false;
    const phoneRegex =
        r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';
    return RegExp(phoneRegex).hasMatch(v);
  },
  '',
);

/// validate that [value] is a email
final email = Tuple(
  (String? v) {
    if (v == null || v.isEmpty) return true;
    const rgx =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(rgx).hasMatch(v);
  },
  '',
);

// ----------------------- content validations -------------------------

/// validate that [value] and [secondValue] is same and not null
Validate isSame(TextEditingController secondValue) {
  return Tuple(
      (String? v) => secondValue.text == v, '');
}
