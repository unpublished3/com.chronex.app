import 'package:chronex/model/recent_runs.dart';
import 'package:chronex/model/run.dart';
import 'package:chronex/storage/hive_manager.dart';

class RecentRunsManager {
  RecentRunsManager._();
  static final RecentRunsManager _instance = RecentRunsManager._();
  factory RecentRunsManager() => _instance;
  final HiveManager _hiveManager = HiveManager('runBox');

  Future<List<RecentRuns>> _getSortedRuns() async {
    final List<RecentRuns> runs = (await _hiveManager.readAll()).whereType<Run>().map(RecentRuns.fromRun).toList();
    final sortedRuns = [...runs]..sort((a, b) => b.completionDate?.compareTo(a.completionDate ?? DateTime.now()) ?? 0);
    return sortedRuns;
  }

  Future<List<RecentRuns>> getRecentRuns({int limit = 5}) async {
    final runs = await _getSortedRuns();
    return runs.take(limit).toList();
  }

  Future<List<RecentRuns>> getAllRuns() async {
    return _getSortedRuns();
  }
}
