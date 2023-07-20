import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/core/color.dart';
import 'package:movies_app/presentation/widgets/txt.widget.dart';

class DownTimer extends StatefulWidget {
  final void Function()? onTimeOut;
  final int seconds;
  final TextStyle? style;
  final String Function(String remainingTime)? display;

  /// this is percent that will added to [seconds] every time that user use restart method
  /// example if seconds is 100 and expand is 25 this when user click restart new timer will start at 125 second
  final int expand;

  const DownTimer({
    Key? key,
    this.onTimeOut,
    required this.seconds,
    this.display,
    this.expand = 0,
    this.style,
  }) : super(key: key);

  @override
  State<DownTimer> createState() => DownTimerState();
}

class DownTimerState extends State<DownTimer> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      start();
    });
    super.initState();
  }

  Timer? _timer;

  /// this to track last start timer value
  late int _lastTurnSeconds = widget.seconds;

  /// that is remaining seconds
  late int _remainingSeconds = widget.seconds;

  /// this method will restart timer
  /// note that every time timer will restart i will expand amount of starting second
  void restart() {
    if (_timer?.isActive == true) return;
    _lastTurnSeconds *= (1 + (widget.expand ~/ 100));
    _remainingSeconds = _lastTurnSeconds;
    start();
  }

  /// just starting timer
  void start() {
    if (_timer?.isActive == true || _remainingSeconds <= 0) return;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _remainingSeconds--;
        if (_remainingSeconds <= 0) {
          _timer?.cancel();
          widget.onTimeOut?.call();
        }
      });
    });
  }

  /// if it's return true this mean that timer is still running
  bool isRunning() => _timer?.isActive == true;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_remainingSeconds <= 0) return const SizedBox.shrink();
    String time;
    if (widget.seconds < 3600) {
      time = '${(_remainingSeconds ~/ 60).toString().padLeft(2, '0')}'
          ':'
          '${(_remainingSeconds % 60).toString().padLeft(2, '0')}';
    } else {
      time = '${(_remainingSeconds ~/ (60 * 60)).toString().padLeft(2, '0')}'
          ':'
          '${((_remainingSeconds % (60 * 60)) ~/ 60).toString().padLeft(2, '0')}'
          ':'
          '${(_remainingSeconds % 60).toString().padLeft(2, '0')}';
    }
    return Txt(
      widget.display?.call(time) ?? time,
      style: widget.style ??
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: primaryColor,
          ),
    );
  }
}
