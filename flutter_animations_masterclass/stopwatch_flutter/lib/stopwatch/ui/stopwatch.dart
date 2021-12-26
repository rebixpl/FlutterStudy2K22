import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/laps/laps_bloc.dart';
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
    return BlocProvider<LapsBloc>(
      create: (context) => LapsBloc(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final radius = constraints.maxWidth / 2;
          return Column(
            children: [
              SizedBox(
                height: 400.0,
                width: double.infinity,
                child: Stack(
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
                        create: (context) =>
                            StopwatchBloc(ticker: const Ticker()),
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
              ),
              const SizedBox(height: 20.0),
              const Expanded(child: LapsWidget()),
            ],
          );
        },
      ),
    );
  }
}

class LapsWidget extends StatelessWidget {
  const LapsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LapsBloc, LapsState>(
      // buildWhen: (prev, current) => prev.runtimeType != current.runtimeType,
      builder: (BuildContext context, LapsState state) {
        if (state is LapsInitial) {
          return const SizedBox();
        } else if (state is LapsRunInProgress) {
          return Column(
            children: [
              Row(
                children: [
                  const Text("Total Time: "),
                  ElapsedTimeText(
                    isLapList: true,
                    elapsed: Duration(milliseconds: state.totalTime),
                  ),
                ],
              ),
              Expanded(
                flex: 6,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.grey, height: 1.0),
                  itemCount: state.laps.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: false,
                      title: Text("Lap ${state.laps.length - index}"),
                      subtitle: ElapsedTimeText(
                        isLapList: true,
                        elapsed: Duration(
                            milliseconds: state.laps.reversed.toList()[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
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
                  onPressed: () {
                    context.read<StopwatchBloc>().add(const StopwatchPaused());
                    context.read<LapsBloc>().add(
                          LapAdded(
                            lapDuration:
                                context.read<StopwatchBloc>().state.duration,
                          ),
                        );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: ResetButton(
                  onPressed: () {
                    context.read<StopwatchBloc>().add(const StopwatchReset());
                    context.read<LapsBloc>().add(const LapsReset());
                  },
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
                  onPressed: () {
                    context.read<StopwatchBloc>().add(const StopwatchReset());
                    context.read<LapsBloc>().add(const LapsReset());
                  },
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
