import 'package:hive/hive.dart';
part 'run.g.dart';

@HiveType(typeId: 1)
class Run extends HiveObject {
  @HiveField(0)
  late int timeSec; // storing time in seconds

  @HiveField(1)
  late double distance;

  @HiveField(2)
  late int avgSecondsPerKm;

  @HiveField(3)
  late int avgCadence;

  @HiveField(4)
  late int calories;

  @HiveField(5)
  late int heartRate;

  @HiveField(6)
  late int temp;

  // Hive-friendly default constructor
  Run();

  // Optional named constructor for convenience
  Run.create({
    required Duration time,
    required this.distance,
    required this.avgSecondsPerKm,
    required this.avgCadence,
    required this.calories,
    required this.heartRate,
    required this.temp,
  }) : timeSec = time.inSeconds;

  Duration get runTime => Duration(seconds: timeSec);
  set runTime(Duration d) => timeSec = d.inSeconds;
}
