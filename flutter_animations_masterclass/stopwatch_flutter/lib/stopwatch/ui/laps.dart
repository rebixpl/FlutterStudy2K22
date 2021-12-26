import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/bloc/laps/laps_bloc.dart';
import 'package:stopwatch_flutter/stopwatch/ui/widgets/text/elapsed_time_text.dart';

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
