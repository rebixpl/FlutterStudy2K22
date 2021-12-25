import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stopwatch_flutter/stopwatch/ui/reset_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/stopwatch_renderer.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  _StopwatchState createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch>
    with SingleTickerProviderStateMixin {
  late final Ticker _ticker;
  Duration _previouslyElapsed = Duration.zero;
  Duration _currentlyElapsed = Duration.zero;
  // _elapsed is computed variable and it can't be assigned
  Duration get _elapsed => _previouslyElapsed + _currentlyElapsed;

  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _ticker = createTicker(
      (elapsed) {
        setState(() {
          _currentlyElapsed = elapsed;
        });
      },
    );
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  void _toggleRunning() {
    setState(() {
      _isRunning = !_isRunning;

      if (_isRunning) {
        _ticker.start();
      } else {
        _ticker.stop();
        _previouslyElapsed += _currentlyElapsed;
        _currentlyElapsed = Duration.zero;
      }
    });
  }

  void _reset() {
    _ticker.stop();
    setState(() {
      _isRunning = false;
      _previouslyElapsed = Duration.zero;
      _currentlyElapsed = Duration.zero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            StopwatchRenderer(
              radius: radius,
            ),
            // StopwatchTickerUI(
            //   elapsed: _elapsed,
            //   radius: radius,
            // ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: ResetButton(
                  onPressed: _reset,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 80.0,
                height: 80.0,
                child: StartStopButton(
                  onPressed: _toggleRunning,
                  isRunning: _isRunning,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
