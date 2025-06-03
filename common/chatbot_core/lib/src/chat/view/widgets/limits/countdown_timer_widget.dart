import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meezy_ui/meezy_ui.dart';

class CountdownTimer extends StatefulWidget {
  final DateTime renewTime;
  final VoidCallback onTimerEnd;

  const CountdownTimer({
    super.key,
    required this.renewTime,
    required this.onTimerEnd,
  });

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Timer? _timer;
  Duration _remainingTime = Duration.zero;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  void _startTimer() {
    _updateRemainingTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _updateRemainingTime());
  }

  void _updateRemainingTime() {
    setState(() {
      final now = DateTime.now(); // Local time
      final renewLocal = widget.renewTime.toLocal();

      _remainingTime = renewLocal.difference(now);
      if (_remainingTime.isNegative) {
        _remainingTime = Duration.zero;

        _timer?.cancel();
        widget.onTimerEnd.call();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.abs().toString().padLeft(2, '0');
    final String twoDigitHours = twoDigits(duration.inHours);
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formatDuration(_remainingTime),
      style: context.textStyles.bodyMedium,
    );
  }
}
