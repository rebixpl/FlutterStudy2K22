import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/stopwatch/stopwatch_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/ui/add_lap_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/elapsed_time_text.dart';
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
        return Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 400.0,
                  width: double.infinity,
                  child: StopwatchRenderer(
                    radius: radius,
                  ),
                ),
                SizedBox(
                  height: 400.0,
                  width: double.infinity,
                  child: BlocProvider<StopwatchBloc>(
                    create: (context) => StopwatchBloc(ticker: const Ticker()),
                    child: Builder(
                      builder: (context) {
                        return Stack(
                          children: [
                            StopwatchTickerUI(
                              elapsed: Duration(
                                milliseconds: context.select(
                                    (StopwatchBloc bloc) =>
                                        bloc.state.duration),
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
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Builder(
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            const Text("Total Time: "),
                            ElapsedTimeText(
                              isLapList: true,
                              elapsed: Duration(milliseconds: 21360),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const Divider(color: Colors.grey, height: 1.0),
                          itemCount: 13,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              dense: true,
                              title: Text("Lap ${index + 1}"),
                              subtitle: const ElapsedTimeText(
                                isLapList: true,
                                elapsed: Duration(milliseconds: 6360),
                              ),
                            );
                          },
                        ),
                      ),
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
                alignment: Alignment.bottomCenter,
                child: AddLapButton(
                  onPressed: () => context
                      .read<StopwatchBloc>()
                      .add(const StopwatchPaused()),
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
