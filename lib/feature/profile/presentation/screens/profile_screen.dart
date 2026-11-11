import 'dart:io';

import 'package:ecommerce_app/core/theme/theme_cubit.dart';
import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/core/utils/colors_manger.dart';
import 'package:ecommerce_app/feature/admin/presentation/screens/admin_screens.dart';
import 'package:ecommerce_app/feature/adresses/presentation/screens/addresses_list_screen.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/logout.dart';
import 'package:ecommerce_app/feature/order/presentation/screens/order_screen.dart';
import 'package:ecommerce_app/feature/profile/data/data_source/profile_remote_data_source.dart';
import 'package:ecommerce_app/feature/profile/data/models/profile_item_model.dart';
import 'package:ecommerce_app/feature/profile/data/models/user_model.dart';
import 'package:ecommerce_app/feature/profile/data/profile_image_storage.dart';
import 'package:ecommerce_app/feature/profile/presentation/cubits/profile_cubit.dart';
import 'package:ecommerce_app/feature/profile/presentation/cubits/profile_state.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/icon_box.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/lustre_app_bar.dart';
import 'package:ecommerce_app/feature/profile/presentation/widgets/profile_menu_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker _imagePicker = ImagePicker();
  final ProfileImageStorage _imageStorage = ProfileImageStorage();
  String? _localImagePath;
  String? _currentAccountId;

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

  final List<ProfileItemModel> _logout = const [
    ProfileItemModel(
      title: 'Logout',
      icon: Icons.logout_rounded,
      isDanger: true,
      destination: Logout(),
    ),
  ];

  List<ProfileItemModel> _adminItems(String userEmail) {
    return [
      ProfileItemModel(
        title: 'Admin Dashboard',
        icon: Icons.dashboard_customize_outlined,
        badge: 'ADMIN',
        destination: AdminScreens(userEmail: userEmail),
      ),
    ];
  }

  Future<void> _loadImageForUser(UserModel user) async {
    final String accountId = user.email;
    if (_currentAccountId == accountId) return;
    if (!mounted) return;
    setState(() {
      _currentAccountId = accountId;
      _localImagePath = null;
    });
    try {
      final String? path = await _imageStorage.loadImagePath(accountId);
      if (!mounted) return;
      setState(() {
        _localImagePath = path;
      });
    } catch (_) {
      return;
    }
  }

  Future<void> _pickLocalImage() async {
    if (_currentAccountId == null) return;
    final String accountId = _currentAccountId!;
    try {
      final XFile? picked = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        requestFullMetadata: false,
      );
      if (picked == null) return;
      final String path = await _imageStorage.saveImage(picked.path, accountId);
      if (!mounted) return;
      setState(() {
        _localImagePath = path;
      });
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not load the image')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appColors.darkBackground,
      appBar: const LUSTREAppBar(title: 'Profile'),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: BlocProvider(
          create: (_) =>
              ProfileCubit(ProfileRemoteDataSource())..loadProfile(),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              BlocConsumer<ProfileCubit, ProfileState>(
                listener: (context, state) {
                  if (state is ProfileFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  } else if (state is ProfileSuccess) {
                    _loadImageForUser(state.user);
                  }
                },
                builder: (context, state) {
                  final user = state is ProfileSuccess ? state.user : null;
                  return Column(
                    children: [
                      _buildAvatar(context, user?.initials ?? ''),
                      SizedBox(height: 16.h),
                      Text(
                        user?.fullName ?? '',
                        style: AppStyle.text24Semibold.copyWith(
                          color: context.appColors.darkTextPrimary,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        user?.email ?? '',
                        style: AppStyle.text14Regular.copyWith(
                          color: context.appColors.darkTextSecondary,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 24.h),
              _buildDarkModeCard(context),
              ProfileMenuGroup(items: _orders),
              ProfileMenuGroup(items: _account),
              ProfileMenuGroup(items: _info),
              BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  final user = state is ProfileSuccess ? state.user : null;
                  if (user == null ||
                      user.email != AdminScreens.demoAdminEmail) {
                    return const SizedBox.shrink();
                  }
                  return ProfileMenuGroup(items: _adminItems(user.email));
                },
              ),
              ProfileMenuGroup(items: _logout),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context, String initials) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: context.appColors.darkGold,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: _localImagePath == null
              ? Text(
                  initials,
                  style: AppStyle.text20Semibold.copyWith(
                    color: context.appColors.darkOnGold,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(50.r),
                  child: Image.file(
                    File(_localImagePath!),
                    width: 80.w,
                    height: 80.w,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Text(
                      initials,
                      style: AppStyle.text20Semibold.copyWith(
                        color: context.appColors.darkOnGold,
                      ),
                    ),
                  ),
                ),
        ),
        // Added profile image
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: _pickLocalImage,
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: context.appColors.darkGold,
                shape: BoxShape.circle,
                border: Border.all(
                  color: context.appColors.darkBackground,
                  width: 1.5,
                ),
              ),
              child: Icon(
                Icons.camera_alt_rounded,
                size: 16.sp,
                color: context.appColors.darkOnGold,
              ),
            ),
          ),
        ),
      ],
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
