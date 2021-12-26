import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/laps/laps_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/stopwatch/stopwatch_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/ui/widgets/buttons/add_lap_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/widgets/buttons/reset_button.dart';
import 'package:stopwatch_flutter/stopwatch/ui/widgets/buttons/start_stop_button.dart';

class StopwatchActions extends StatelessWidget {
  const StopwatchActions({Key? key}) : super(key: key);

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
