import 'package:chronex/model/pace.dart';
import 'package:chronex/model/run.dart';

class RecentRuns {
  final DateTime completionDate;
  final Duration duration;
  final double distance;
  final Pace pace;
  final int heartRate;
  RecentRuns({
    required this.completionDate,
    required this.duration,
    required this.distance,
    required this.pace,
    required this.heartRate,
  });
  factory RecentRuns.fromRun(Run run) {
    return RecentRuns(
      completionDate: run.completedAt,
      duration: Duration(seconds: run.timeSec),
      distance: run.distance,
      pace: Pace(secondsPerKilometer: run.avgSecondsPerKm),
      heartRate: run.heartRate,
    );
  }
}
