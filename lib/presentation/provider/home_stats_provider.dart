import 'package:chronex/model/pace.dart';
import 'package:chronex/model/run_stats.dart';
import 'package:chronex/storage/home_page_stats_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeStatsNotifier extends Notifier<RunStats> {
  @override
  RunStats build() {
    return RunStats(
      totalRuns: 0,
      totalDistance: 0,
      avgPace: Pace(secondsPerKilometer: 0),
      totalTime: const Duration(hours: 0, minutes: 0, seconds: 0),
    );
  }

  final HomePageStatsManager _manager = HomePageStatsManager();

  Future<void> loadStats() async {
    state = await _manager.calculateStats();
  }
}

final homePageStatsProvider = NotifierProvider<HomeStatsNotifier, RunStats>(() {
  return HomeStatsNotifier();
});
