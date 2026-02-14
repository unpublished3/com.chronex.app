import 'package:chronex/base/resources/sapp_assets.dart';
import 'package:chronex/base/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatefulWidget {
  final StatefulNavigationShell child;
  const MainPage({super.key, required this.child});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  void _switchTab(int index) {
    widget.child.goBranch(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: widget.child,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.neutral100)),
        ),
        child: BottomNavigationBar(
          key: const ValueKey("bottomNavBar"),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          currentIndex: widget.child.currentIndex,
          onTap: (index) => _switchTab(index),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(icon: _buildSvg(SAppAssets.svgHome), activeIcon: _buildSvg(SAppAssets.svgHome, colored: true), label: "Home"),
            BottomNavigationBarItem(
              icon: _buildSvg(SAppAssets.svgConnection),
              activeIcon: _buildSvg(SAppAssets.svgConnection, colored: true),
              label: "Connection",
            ),
            BottomNavigationBarItem(icon: _buildSvg(SAppAssets.svgProfile), activeIcon: _buildSvg(SAppAssets.svgProfile, colored: true), label: "Profile"),
          ],
        ),
      ),
    );
  }

  Widget _buildSvg(String assetsPath, {bool colored = false}) {
    return SvgPicture.asset(
      alignment: Alignment.center,
      height: 24.h,
      width: 24.w,
      assetsPath,
      colorFilter: colored ? const ColorFilter.mode(AppColor.primary, BlendMode.srcIn) : null,
    );
  }
}
