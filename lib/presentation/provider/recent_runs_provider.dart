import 'package:chronex/model/recent_runs.dart';
import 'package:chronex/storage/recent_runs_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecentRunsNotifier extends Notifier<List<RecentRuns>> {
  @override
  List<RecentRuns> build() {
    return [];
  }

  final RecentRunsManager _manager = RecentRunsManager();

  Future<void> getRecentRuns() async {
    state = await _manager.getRecentRuns();
  }

  Future<void> getAllRuns() async {
    state = await _manager.getAllRuns();
  }
}

final recentRunsProvider =
    NotifierProvider<RecentRunsNotifier, List<RecentRuns>>(() {
      return RecentRunsNotifier();
    });
