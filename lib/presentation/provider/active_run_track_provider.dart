import 'package:chronex/model/pace.dart';
import 'package:chronex/model/sensor_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RunState {
  final Duration time;
  final double distance;
  final Pace pace;
  final int cadence;
  final int calories;
  final int heartrate;
  final int temp;
  bool isRunning;
  RunState({
    required this.time,
    required this.distance,
    required this.pace,
    required this.cadence,
    required this.calories,
    required this.heartrate,
    required this.temp,
    required this.isRunning,
  });
  RunState copyWith({
    double? distance,
    int? calories,
    Pace? pace,
    Duration? time,
    int? heartrate,
    int? cadence,
    int? temp,
    bool? isRunning,
  }) {
    return RunState(
      distance: distance ?? this.distance,
      calories: calories ?? this.calories,
      pace: pace ?? this.pace,
      time: time ?? this.time,
      heartrate: heartrate ?? this.heartrate,
      cadence: cadence ?? this.cadence,
      temp: temp ?? this.temp,
      isRunning: isRunning ?? this.isRunning,
    );
  }
}

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

  void updateFromSensor(Sensordata data) async {
    state = state.copyWith();
  }
}

final runStateProvider = NotifierProvider<RunStateNotifier, RunState>(() {
  return RunStateNotifier();
});
