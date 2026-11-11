// feature/profile/presentation/screens/screens/profile_screen.dart

import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/admin/presentation/screens/admin_screens.dart';
import 'package:ecommerce_app/feature/adresses/presentation/screens/addresses_list_screen.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/logout.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
import 'package:ecommerce_app/feature/profile/data/models/profile_item_model.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/icon_box.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/lustre_app_bar.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/profile_menu_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../auth/reset_password/presentation/screens/change_password.dart';
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
  final List<ProfileItemModel> _orders = const [
    ProfileItemModel(
      title: 'My Orders',
      icon: Icons.shopping_bag_outlined,
      destination: OrderScreen(),
    ),
    ProfileItemModel(
      title: 'Addresses',
      icon: Icons.location_on_outlined,
      destination: AddressesListScreen(),
    ),
  ];

  final List<ProfileItemModel> _account = const [
    ProfileItemModel(
      title: 'Notifications',
      icon: Icons.notifications_none_rounded,
      destination: NotificationsScreen(),
    ),
    ProfileItemModel(
      title: 'Change Password',
      icon: Icons.lock_reset_rounded,
      destination: ChangePassword(),
    ),
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
      destination: AdminScreens(),
    ),
  ];

  final List<ProfileItemModel> _logout = const [
    ProfileItemModel(
      title: 'Logout',
      icon: Icons.logout_rounded,
      isDanger: true,
      destination: Logout(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.darkBackground,
      appBar: const LUSTREAppBar(title: 'Profile'),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 8.h),
            _buildAvatar(context),
            SizedBox(height: 16.h),
            Text(
              'Alexander Kane',
              style: AppStyle.text24Semibold.copyWith(
                color: context.appColors.darkTextPrimary,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'alexander.kane@example.com',
              style: AppStyle.text14Regular.copyWith(
                color: context.appColors.darkTextSecondary,
              ),
            ),
            SizedBox(height: 24.h),
            _buildDarkModeCard(context),
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

  Widget _buildAvatar(BuildContext context) {
    return Container(
      width: 80.w,
      height: 80.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.appColors.darkGold,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Text(
        'AK',
        style: AppStyle.text20Semibold.copyWith(
          color: context.appColors.darkOnGold,
        ),
      ),
    );
  }

  Widget _buildDarkModeCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.appColors.darkCard,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Row(
        children: [
          const IconBox(icon: Icons.nightlight_outlined),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              'Dark Mode',
              style: AppStyle.text16Medium.copyWith(
                color: context.appColors.darkTextPrimary,
              ),
            ),
          ),
          Switch(
            value: context.watch<ThemeCubit>().state == ThemeMode.dark,
            onChanged: context.read<ThemeCubit>().setDarkMode,
            activeThumbColor: context.appColors.darkGold,
            activeTrackColor: context.appColors.darkIconBox,
            inactiveThumbColor: context.appColors.darkTextSecondary,
            inactiveTrackColor: context.appColors.darkIconBox,
            trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
          ),
        ],
      ),
    );
  }
}
