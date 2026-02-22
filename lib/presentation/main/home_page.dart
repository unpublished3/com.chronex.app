import 'package:chronex/base/extensions/sizedbox_extension.dart';
import 'package:chronex/base/theme/s_text_theme.dart';
import 'package:chronex/presentation/widgets/app_button.dart';
import 'package:chronex/presentation/widgets/recent_run_stats.dart';
import 'package:flutter/material.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

ValueNotifier<int> myIndex = ValueNotifier<int>(0); // use riverpod later

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final widgetlist = [
      const Home(name: 'Pratik'),
      const History(),
      const Profile(),
    ];

    return ValueListenableBuilder<int>(
      valueListenable: myIndex,
      builder: (context, value, child) {
        return Scaffold(
          body: IndexedStack(index: value, children: widgetlist),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: value,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.black,
            onTap: (index) => myIndex.value = index,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}

class Home extends StatefulWidget {
  final String name;
  const Home({super.key, required this.name});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int numberofruns = 1;
  double distance = 14.5;
  Duration time = const Duration(hours: 1, minutes: 30);
  Duration pace = const Duration(minutes: 5, seconds: 25);
  DateTime now = DateTime.now();
  String monthname = DateFormat('MMM').format(DateTime.now());
  double recentdistance = 14.5;
  Duration recenttime = const Duration(hours: 1, minutes: 30);
  Duration recentpace = const Duration(minutes: 5, seconds: 25);
  int recentheartbeat = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          child: Text(
            'Chronex',
            style: STextTheme.text26.copyWith(color: AppColor.white),
          ),
        ),
        backgroundColor: AppColor.primary,
        toolbarHeight: 60.h,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade100),
        child: Column(
          children: [
            Container(
              width: 360.w,
              height: 180.h,
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsetsGeometry.fromLTRB(
                        12.sp,
                        12.sp,
                        0.0,
                        4.sp,
                      ),
                      child: Text(
                        'Welcome Back, ${widget.name}!',
                        style: STextTheme.text26.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(12.sp, 0.0, 0.0, 12.sp),
                      child: Text(
                        'Ready for your next Run?',
                        style: STextTheme.text18.copyWith(
                          color: AppColor.white,
                        ),
                      ),
                    ),
                  ),
                  AppButton(
                    onPressed: () {
                      // route to active run track play
                    },
                    title: 'Start New Run',
                    fontSize: 20.0,
                    leadingIcon: const Icon(
                      Icons.play_arrow,
                      color: AppColor.primary,
                      size: 25.0,
                    ),
                    color: Colors.grey.shade100,
                    titleColor: AppColor.primary,
                    width: 320.w,
                    height: 75.h,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(12.h),
                child: Text('Your Stats', style: STextTheme.text24),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomePageStats(
                  icon: Icons.directions_run,
                  title: 'Total Runs',
                  value: numberofruns.toString(),
                ),
                HomePageStats(
                  icon: Icons.location_on,
                  title: 'Distance',
                  value: distance.toStringAsFixed(2),
                  unit: 'km',
                ),
              ],
            ),
            25.sBHh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomePageStats(
                  icon: Icons.timer,
                  title: 'Total Time',
                  value:
                      '${time.inHours.toString().padLeft(2, '0')}:${time.inMinutes.remainder(60).toString().padLeft(2, '0')}',
                  unit: 'm',
                ),
                HomePageStats(
                  icon: Icons.bolt,
                  title: 'Avg Pace',
                  value:
                      '${pace.inMinutes.remainder(60).toString().padLeft(2, '0')}:${pace.inSeconds.remainder(60).toString().padLeft(2, '0')}',
                  unit: 'm/km',
                ),
              ],
            ),
            25.sBHh,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text('Recent activity', style: STextTheme.text24),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      myIndex.value = 1;
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10.0),
                      child: Text(
                        'View all',
                        style: STextTheme.text24.copyWith(
                          color: AppColor.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            RecentRunStats(
              monthname: monthname,
              day: now.day,
              year: now.year,
              recentdistance: recentdistance,
              recenttime:
                  '${recenttime.inHours.toString().padLeft(2, '0')}:${recenttime.inMinutes.remainder(60).toString().padLeft(2, '0')}',
              recentpace:
                  '${recentpace.inMinutes.remainder(60).toString().padLeft(2, '0')}:${recentpace.inSeconds.remainder(60).toString().padLeft(2, '0')}',
              recentheartbeat: recentheartbeat,
            ),
          ],
        ),
      ),
    );
  }
}

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int totalruns = 1;
  DateTime now = DateTime.now();
  String monthname = DateFormat('MMM').format(DateTime.now());
  double recentdistance = 14.5;
  Duration recenttime = const Duration(hours: 1, minutes: 30);
  Duration recentpace = const Duration(minutes: 5, seconds: 25);
  int recentheartbeat = 144;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
          child: Text(
            'Chronex',
            style: STextTheme.text26.copyWith(color: AppColor.white),
          ),
        ),
        backgroundColor: AppColor.primary,
        toolbarHeight: 60.h,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(25.0),
              height: 120.h,
              width: 370.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color.fromARGB(255, 197, 254, 198),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.h),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.directions_run,
                          color: AppColor.primary,
                          size: 25.0,
                        ),
                        5.sBHw,
                        Text(
                          'Total Runs: $totalruns',
                          style: STextTheme.text24.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Text(
                      'Keep up the great work! Every run counts.',
                      style: STextTheme.text18.copyWith(
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RecentRunStats(
              monthname: monthname,
              day: now.day,
              year: now.year,
              recentdistance: recentdistance,
              recenttime:
                  '${recenttime.inHours.toString().padLeft(2, '0')}:${recenttime.inMinutes.remainder(60).toString().padLeft(2, '0')}',
              recentpace:
                  '${recentpace.inMinutes.remainder(60).toString().padLeft(2, '0')}:${recentpace.inSeconds.remainder(60).toString().padLeft(2, '0')}',
              recentheartbeat: recentheartbeat,
            ),
          ],
        ),
      ),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profile page'));
  }
}

class HomePageStats extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final String? unit;
  const HomePageStats({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    this.unit,
  });

  @override
  State<HomePageStats> createState() => _HomePageStatsState();
}

class _HomePageStatsState extends State<HomePageStats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      width: 165.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.white,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 8.0),
            child: Row(
              children: [
                Icon(widget.icon, color: AppColor.primary, size: 25.0),
                Text(widget.title, style: STextTheme.text20),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0, 5.0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.value, style: STextTheme.text24),
                ),
              ),
              if (widget.unit != null)
                Text(widget.unit ?? '', style: STextTheme.text24),
            ],
          ),
        ],
      ),
    );
  }
}
