// feature/profile/presentation/screens/screens/profile_screen.dart

import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:ecommerce_app/core/utils/app_theme.dart';
import 'package:ecommerce_app/feature/profile/models/profile_item_model.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/icon_box.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/luxe_app_bar.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/luxe_bottom_nav.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/widgets/profile_menu_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'about_us_screen.dart';
import 'contact_us_screen.dart';
import 'notifications_screen.dart';
import 'privacy_policy_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _navIndex = 3;

  final List<ProfileItemModel> _orders = const [
    ProfileItemModel(title: 'My Orders', icon: Icons.shopping_bag_outlined),
    ProfileItemModel(title: 'Addresses', icon: Icons.location_on_outlined),
  ];

  final List<ProfileItemModel> _account = const [
    ProfileItemModel(
      title: 'Notifications',
      icon: Icons.notifications_none_rounded,
      destination: NotificationsScreen(),
    ),
    ProfileItemModel(
        title: 'Change Password', icon: Icons.lock_reset_rounded),
  ];

  final List<ProfileItemModel> _info = const [
    ProfileItemModel(
      title: 'Privacy Policy',
      icon: Icons.shield_outlined,
      destination: PrivacyPolicyScreen(),
    ),
    ProfileItemModel(
      title: 'About Us',
      icon: Icons.info_outline_rounded,
      destination: AboutUsScreen(),
    ),
    ProfileItemModel(
      title: 'Contact Us',
      icon: Icons.mail_outline_rounded,
      destination: ContactUsScreen(),
    ),
  ];

  final List<ProfileItemModel> _admin = const [
    ProfileItemModel(
      title: 'Admin Dashboard',
      icon: Icons.dashboard_customize_outlined,
      badge: 'ADMIN',
    ),
  ];

  final List<ProfileItemModel> _logout = const [
    ProfileItemModel(
      title: 'Logout',
      icon: Icons.logout_rounded,
      isDanger: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuxeAppBar(title: 'Profile'),
      bottomNavigationBar: LuxeBottomNav(
        currentIndex: _navIndex,
        cartCount: 2,
        onTap: (i) => setState(() => _navIndex = i),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            _buildAvatar(),
            SizedBox(height: 16.h),
            Text('Alexander Kane', style: AppTheme.heading(size: 24.sp)),
            SizedBox(height: 4.h),
            Text(
              'alexander.kane@example.com',
              style: AppTheme.body(
                size: 14.sp,
                color: context.colors.textSecondary,
              ),
            ),
            SizedBox(height: 24.h),
            _buildDarkModeCard(),
            ProfileMenuGroup(items: _orders),
            ProfileMenuGroup(items: _account),
            ProfileMenuGroup(items: _info),
            ProfileMenuGroup(items: _admin),
            ProfileMenuGroup(items: _logout),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 80.w,
      height: 80.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colors.gold,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Text(
        'AK',
        style: AppTheme.heading(size: 20.sp, color: context.colors.onGold),
      ),
    );
  }

  Widget _buildDarkModeCard() {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.colors.card,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          const IconBox(icon: Icons.nightlight_outlined),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              'Dark Mode',
              style: AppTheme.body(size: 16.sp, weight: FontWeight.w500),
            ),
          ),
          Switch(
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (isDark) => themeNotifier.value =
                isDark ? ThemeMode.dark : ThemeMode.dark,
            activeThumbColor: context.colors.gold,
            activeTrackColor: context.colors.iconBox,
            inactiveThumbColor: context.colors.textSecondary,
            inactiveTrackColor: context.colors.iconBox,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }
}