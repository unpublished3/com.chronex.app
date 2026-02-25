class Pace {
  final int secondsPerKilometer;
  Pace({required this.secondsPerKilometer});
  int get minutes => (secondsPerKilometer ~/ 60);
  int get seconds => (secondsPerKilometer % 60);
  @override
  String toString() {
    final s = seconds.toString().padLeft(2, '0');
    return '$minutes:$s';
  }
}
