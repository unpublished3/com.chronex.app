class Sensordata {
  final int heartrate;
  final int temperature;
  final Accelerometer acc;
  Sensordata({
    required this.heartrate,
    required this.temperature,
    required this.acc,
  });
}

class Accelerometer {
  final double x;
  final double y;
  final double z;
  Accelerometer({required this.x, required this.y, required this.z});
}
