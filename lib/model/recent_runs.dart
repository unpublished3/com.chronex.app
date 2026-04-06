import 'package:chronex/model/pace.dart';
import 'package:chronex/model/run.dart';

class RecentRuns {
  final DateTime? completionDate;
  final Duration? duration;
  final double? distance;
  final Pace? pace;
  final int? heartRate;
  RecentRuns({this.completionDate, this.duration, this.distance, this.pace, this.heartRate});
  factory RecentRuns.fromRun(Run run) {
    return RecentRuns(
      completionDate: run.completedAt,
      duration: Duration(seconds: run.timeSec ?? 0),
      distance: run.distance,
      pace: Pace(secondsPerKilometer: run.avgSecondsPerKm ?? 0),
      heartRate: run.heartRate,
    );
  }
}
