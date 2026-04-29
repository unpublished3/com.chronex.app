import 'dart:async';
// import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';
import 'package:chronex/model/pace.dart';
import 'package:chronex/model/run_session.dart';
import 'package:chronex/model/run_state.dart';
import 'package:chronex/model/sensor_data.dart';
import 'package:chronex/storage/profile_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RunStateNotifier extends Notifier<RunState> {
  RunSession? _session;
  StreamSubscription? _motionSub;
  StreamSubscription? _heartRateSub;
  Timer? _timer;
  double userWeight = 70; // fallback value, used for calories calc
  @override
  RunState build() {
    // cleanup when provider is disposed
    ref.onDispose(() {
      _motionSub?.cancel();
      _heartRateSub?.cancel();
      _timer?.cancel();
    });

    return RunState(
      time: const Duration(hours: 0, minutes: 0, seconds: 0),
      distance: 0,
      pace: Pace(secondsPerKilometer: 0),
      cadence: 0,
      calories: 0,
      heartrate: 0,
      temp: 0,
      isRunning: true,
      isPaused: false,
    );
  }

  void startRun({
    required Stream<List<int>> motionStream,
    required Stream<List<int>> heartRateStream,
  }) async {
    final profile = await ProfileManager().getProfile();
    if (profile != null) {
      userWeight = profile.weight;
    }

    _session = RunSession();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final session = _session;
      if (session == null) return;
      state = state.copyWith(time: session.elapsed);
    });

    _motionSub = motionStream.listen((bytes) {
      if (bytes.length < 8) return;
      final session = _session;
      if (session == null) return;
      final motion = MotionData.fromBytes(bytes);
      session.updateMotion(motion);
      state = state.copyWith(
        distance: session.distanceKm,
        pace: session.pace,
        cadence: session.cadence,
        calories: _calculateCalories(session),
      );
    });

    _heartRateSub = heartRateStream.listen((bytes) {
      if (bytes.length < 2) return;
      final hr = HeartRateData.fromBytes(bytes);
      _session?.updateHeartRate(hr);
      state = state.copyWith(heartrate: hr.bpm);
    });
    state = state.copyWith(isRunning: true);
  }

  int _calculateCalories(RunSession session) {
    const double met = 8.0;
    final hours = session.elapsed.inSeconds / 3600;
    return (met * userWeight * hours).round();
  }
}

final runStateProvider = NotifierProvider<RunStateNotifier, RunState>(() {
  return RunStateNotifier();
});
