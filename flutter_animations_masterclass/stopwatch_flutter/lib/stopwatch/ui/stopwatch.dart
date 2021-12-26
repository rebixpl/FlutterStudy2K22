import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/laps/laps_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/stopwatch/stopwatch_bloc.dart';

import 'package:stopwatch_flutter/stopwatch/ui/laps.dart';
import 'package:stopwatch_flutter/stopwatch/ui/stopwatch/stopwatch_actions.dart';
import 'package:stopwatch_flutter/stopwatch/ui/stopwatch/stopwatch_renderer.dart';
import 'package:stopwatch_flutter/stopwatch/ui/stopwatch/stopwatch_ticker_ui.dart';
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
                                // Text(context.select((StopwatchBloc bloc) =>
                                //     bloc.state.duration.toString())),
                                const StopwatchActions(),
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
