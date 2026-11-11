import 'package:ecommerce_app/core/utils/app_style.dart';
import 'package:ecommerce_app/feature/auth/presentation/cubits/auth_cubit.dart';
import 'package:ecommerce_app/feature/auth/presentation/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/colors_manger.dart';
import '../../../auth/reset_password/presentation/widgets/filled_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final List<OnboardingItem> pages = const [
    OnboardingItem(
      image: 'assets/images/onboarding.png',
      title: 'Discover',
      description: 'Watches, rings, wallets and more',
    ),
    OnboardingItem(
      image: 'assets/images/chronograph_watch (1).png',
      title: 'Exclusive Offers',
      description: 'Grab daily deals and discounts',
    ),
    OnboardingItem(
      image: 'assets/images/onboarding3.png',
      title: 'Fast Delivery',
      description: 'Order easily and track your orders',
    ),
  ];
  late final PageController pageController;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (currentPage < pages.length - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.decelerate,
      );
    } else {
      goToLogin();
    }
  }

  void skipOnboarding() {
    pageController.animateToPage(
      pages.length - 1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.decelerate,
    );
  }

  void goToLogin() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BlocProvider(create: (context) => AuthCubit(), child: Login()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;

    return Scaffold(
      backgroundColor: appColors.backgroundColor,

      body: PageView.builder(
        controller: pageController,
        itemCount: pages.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },

        itemBuilder: (context, index) {
          final page = pages[index];

          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(page.image, fit: BoxFit.cover),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withValues(alpha: 0.45),
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.85),
                    ],
                    stops: const [0.0, 0.35, 1.0],
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            '. LUSTRE',
                            style: AppStyle.text18Semibold.copyWith(
                              letterSpacing: 2,
                              color: appColors.primaryColor,
                            ),
                          ),

                          Spacer(),

                          if (currentPage != pages.length - 1)
                            TextButton(
                              onPressed: skipOnboarding,
                              child: Text(
                                'Skip',
                                style: AppStyle.text14Medium.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),

                      Spacer(),
                      Text(
                        page.title,
                        style: AppStyle.text22Medium.copyWith(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        page.description,
                        style: AppStyle.text14Regular.copyWith(
                          color: Colors.white70,
                        ),
                      ),

                      SizedBox(height: 40),
                      SizedBox(
                        width: double.infinity,
                        child: CustomFilledButton(
                          text: currentPage == pages.length - 1
                              ? 'GET STARTED'
                              : 'NEXT',
                          onPressed: nextPage,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}
