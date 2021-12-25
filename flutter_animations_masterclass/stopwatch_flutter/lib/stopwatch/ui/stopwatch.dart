import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/ui/reset_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/ticker.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StopwatchBloc>(
      create: (context) => StopwatchBloc(ticker: const Ticker()),
      child: const StopwatchView(),
    );
  }
}

class StopwatchView extends StatelessWidget {
  const StopwatchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StopwatchBloc _bloc = context.select((StopwatchBloc bloc) => bloc);

    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = constraints.maxWidth / 2;
        return Stack(
          children: [
            // StopwatchRenderer(
            //   radius: radius,
            // ),
            // StopwatchTickerUI(
            //   elapsed: _elapsed,
            //   radius: radius,
            // ),
            Text(_bloc.state.duration.toString()),
            Text(_bloc.state.duration.toString()),
            Text(_bloc.state.duration.toString()),
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: SizedBox(
            //     width: 80.0,
            //     height: 80.0,
            //     child: ResetButton(
            //       onPressed: _reset,
            //     ),
            //   ),
            // ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: SizedBox(
            //     width: 80.0,
            //     height: 80.0,
            //     child: StartStopButton(
            //       onPressed: _toggleRunning,
            //       isRunning: _isRunning,
            //     ),
            //   ),
            // ),
          ],
        );
      },
    );
  }
}
