import 'package:chronex/model/pace.dart';

class RunStats {
  final int totalRuns;
  final double totalDistance;
  final Pace avgPace;
  final Duration totalTime;
  RunStats({
    required this.totalRuns,
    required this.totalDistance,
    required this.avgPace,
    required this.totalTime,
  });
}
