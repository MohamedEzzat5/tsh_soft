import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/config/locale/app_localizations.dart';
import 'package:tsh_soft/config/routes/app_routes.dart';
import 'package:tsh_soft/core/utils/enums.dart';
import 'package:tsh_soft/core/utils/image_manager.dart';
import 'package:tsh_soft/core/utils/values/text_styles.dart';
import 'package:tsh_soft/features/splash/presentation/cubit/auto_login/auto_login_cubit.dart';
import 'package:tsh_soft/features/splash/presentation/widgets/on_boarding_button.dart';
import 'package:tsh_soft/features/splash/presentation/widgets/page_indicator.dart';
import 'package:tsh_soft/injection_container.dart';

import '../widgets/onboarding_page.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = const [
    OnboardingPage(
      title: 'onBoarding_first_title',
      description: 'onBoarding_first_description',
      imageAsset: ImgAssets.onboardingImage,
      subDescription: 'onBoarding_first_subDescription',
    ),
    OnboardingPage(
      title: 'onBoarding_second_title',
      description: 'onBoarding_second_description',
      imageAsset: ImgAssets.onboardingImage1,
      subDescription: '',
    ),
    OnboardingPage(
      title: 'onBoarding_third_title',
      description: 'onBoarding_third_description',
      imageAsset: ImgAssets.onboardingImage2,
      subDescription: 'onBoarding_third_subDescription',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginScreenRoute);
      BlocProvider.of<AutoLoginCubit>(context)
          .saveUserType(type: UserType.login);
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, Routes.loginScreenRoute);
    BlocProvider.of<AutoLoginCubit>(context).saveUserType(type: UserType.login);
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            physics: const BouncingScrollPhysics(),
            children: _pages,
          ),
          Positioned(
            bottom: 1.sh - 0.95.sh,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _currentPage > 0
                    ? GestureDetector(
                        onTap: _previousPage,
                        child: Text(
                          "back".tr(context),
                          style: TextStyles.semiBold16(
                              color: context.colors.textColor),
                        ),
                      )
                    : SizedBox(width: 26.w),
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => PageIndicator(isActive: index == _currentPage),
                  ),
                ),
                GestureDetector(
                  onTap: _skip,
                  child: Text(
                    "skip".tr(context),
                    style: TextStyles.semiBold16(
                      color: context.colors.textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1.sh - 0.82.sh,
            left: 0,
            right: 0,
            child: OnboardingButton(onPressed: _nextPage),
          ),
        ],
      ),
    );
  }
}
