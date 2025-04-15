import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/core/utils/image_manager.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/enums.dart';
import '../../../../injection_container.dart';
import '../cubit/auto_login/auto_login_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _stage = 1;
  double _opacity = 0.0;
  double _bgOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    context.read<AutoLoginCubit>().getUserType();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => _opacity = 1.0);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() => _stage = 2);
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {
          _stage = 3;
          _bgOpacity = 1.0;
        });
      });
    });
  }

  void injectLocalizationAndColors() {
    try {
      colors;
    } catch (e) {
      ServiceLocator.injectAppColors(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    injectLocalizationAndColors();
    log('Localizations: ${appLocalizations.locale?.languageCode}');
    return BlocListener<AutoLoginCubit, AutoLoginState>(
      listener: (context, state) {
        log('UserType: ${state.userType}');
        Future.delayed(const Duration(milliseconds: 800), () {
          _goNext(state.userType);
        });
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: colors.upBackGround,
          body: Stack(
            children: [
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: _bgOpacity,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colors.main, colors.secondaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedAlign(
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  alignment:
                      _stage == 1 ? Alignment.bottomCenter : Alignment.center,
                  child: AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _opacity,
                    child: AnimatedContainer(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      duration: const Duration(milliseconds: 300),
                      width: _stage == 3 ? 250 : 100,
                      height: _stage == 3 ? 250 : 100,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        ImgAssets.logo,
                        width: _stage == 3 ? 180 : 80,
                        height: _stage == 3 ? 180 : 80,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goNext(UserType userType) {
    if (userType == UserType.firstOpen) {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    } else if (userType == UserType.login) {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    } else if (userType == UserType.approved) {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    } else if (userType == UserType.pending) {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
    }
  }
}
