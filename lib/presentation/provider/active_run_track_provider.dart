import 'package:chronex/model/pace.dart';
import 'package:chronex/model/run_state.dart';
import 'package:chronex/model/sensor_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RunStateNotifier extends Notifier<RunState> {
  @override
  RunState build() {
    return RunState(
      time: const Duration(hours: 0, minutes: 0, seconds: 0),
      distance: 0,
      pace: Pace(secondsPerKilometer: 0),
      cadence: 0,
      calories: 0,
      heartrate: 0,
      temp: 0,
      isRunning: true,
    );
  }

  // not implemented fully
  void updateFromSensor(Sensordata data) async {
    state = state.copyWith(heartrate: data.heartrate, temp: data.temperature);
  }
}

final runStateProvider = NotifierProvider<RunStateNotifier, RunState>(() {
  return RunStateNotifier();
});
