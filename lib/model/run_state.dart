import 'package:chronex/model/pace.dart';

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
