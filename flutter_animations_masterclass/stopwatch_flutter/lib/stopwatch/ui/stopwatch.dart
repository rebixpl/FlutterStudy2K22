import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/stopwatch_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/ui/reset_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/start_stop_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/stopwatch_renderer.dart';
import 'package:stopwatch_flutter/stopwatch/ui/stopwatch_ticker_ui.dart';
import 'package:stopwatch_flutter/ticker.dart';

class Stopwatch extends StatelessWidget {
  const Stopwatch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StopwatchView();
  }
}

class StopwatchView extends StatelessWidget {
  const StopwatchView({Key? key}) : super(key: key);

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
            BlocProvider<StopwatchBloc>(
              create: (context) => StopwatchBloc(ticker: const Ticker()),
              child: Builder(
                builder: (context) {
                  return Stack(
                    children: [
                      StopwatchTickerUI(
                        elapsed: Duration(
                          milliseconds: context.select(
                              (StopwatchBloc bloc) => bloc.state.duration),
                        ),
                        radius: radius,
                      ),
                      Text(context.select((StopwatchBloc bloc) =>
                          bloc.state.duration.toString())),
                      const Actions(),
                    ],
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StopwatchBloc, StopwatchState>(
      buildWhen: (prev, current) => prev.runtimeType != current.runtimeType,
      builder: (BuildContext context, StopwatchState state) {
        return Stack(
          children: [
            if (state is StopwatchInitial) ...[
              Align(
                alignment: Alignment.bottomRight,
                child: StartPauseButton(
                  onPressed: () => context
                      .read<StopwatchBloc>()
                      .add(const StopwatchStarted()),
                  isRunning: false, // Start Button
                ),
              ),
            ],
            if (state is StopwatchRunInProgress) ...[
              Align(
                alignment: Alignment.bottomRight,
                child: StartPauseButton(
                  onPressed: () => context
                      .read<StopwatchBloc>()
                      .add(const StopwatchPaused()),
                  isRunning: true, // Pause Button
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ResetButton(
                  onPressed: () =>
                      context.read<StopwatchBloc>().add(const StopwatchReset()),
                ),
              ),
            ],
            if (state is StopwatchRunPause) ...[
              Align(
                alignment: Alignment.bottomRight,
                child: StartPauseButton(
                  onPressed: () => context
                      .read<StopwatchBloc>()
                      .add(const StopwatchResumed()),
                  isRunning: false, // Start Button (resume)
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ResetButton(
                  onPressed: () =>
                      context.read<StopwatchBloc>().add(const StopwatchReset()),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
