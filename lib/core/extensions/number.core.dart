


import 'package:flutter/material.dart';

import 'package:movies_app/service/navigation.service.dart';

extension NumberExtension on num {

  /// will used to convert number to date time and make local date time
  DateTime get toLocalDateTime =>
      DateTime.fromMillisecondsSinceEpoch(toInt()).toLocal();

  /// getting percent of total width
  double get w {
    return MediaQuery.of(NavigationService.context!).size.width *
        _getPercent(this);
  }

  /// getting percent of total height
  double get h {
    return MediaQuery.of(NavigationService.context!).size.height *
        _getPercent(this);
  }

  SizedBox get sh => SizedBox(height: toDouble());
  SizedBox get sw => SizedBox(width: toDouble());
}

double _getPercent(num percent) {
  var p = percent < 0 ? 0 : percent;
  p = percent > 100 ? 100 : percent;

  return p / 100;
}
