import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tsh_soft/features/splash/splash_injection.dart';

import 'config/locale/app_localizations_setup.dart';
import 'config/routes/app_routes.dart';
import 'config/routes/navigator_observer.dart';
import 'config/themes/app_theme.dart';
import 'config/themes/provider/app_theme_provider.dart';
import 'core/utils/app_strings.dart';
import 'features/language/language_injection.dart';
import 'features/language/presentation/cubit/locale_cubit/locale_cubit.dart';

class TSHSoftApp extends ConsumerWidget {
  const TSHSoftApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLight = ref.watch(appThemeProvider);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            isLight ? const Color(0xFFF5F5F5) : const Color(0xFF1E1E1E),
        systemNavigationBarIconBrightness:
            isLight ? Brightness.dark : Brightness.light,
        statusBarColor:
            isLight ? const Color(0xFFF5F5F5) : const Color(0xFF1E1E1E),
        statusBarIconBrightness: isLight ? Brightness.dark : Brightness.light,
        statusBarBrightness: isLight ? Brightness.light : Brightness.dark,
      ),
    );

    return MultiBlocProvider(
      providers: [
        ...languageBlocs,
        ...splashBlocs,
      ],
      child: BlocBuilder<LocaleCubit, LocaleState>(
        buildWhen: (previous, current) {
          return previous.locale.languageCode != current.locale.languageCode;
        },
        builder: (context, state) {
          log('LocaleCubit state: ${state.locale.languageCode}');
          return ScreenUtilInit(
            designSize: const Size(
              AppStrings.screenWidth,
              AppStrings.screenHeight,
            ),
            minTextAdapt: true,
            //splitScreenMode: true,
            builder: (context, child) {
              return MaterialApp(
                title: AppStrings.appName,
                locale: state.locale,
                debugShowCheckedModeBanner: false,
                theme: getAppTheme(context, ref.watch(appThemeProvider)),
                onGenerateRoute: AppRoutes.onGenerateRoute,
                supportedLocales: AppLocalizationsSetup.supportedLocales,
                localeResolutionCallback:
                    AppLocalizationsSetup.localeResolutionCallback,
                localizationsDelegates:
                    AppLocalizationsSetup.localizationsDelegates,
                navigatorObservers: <NavigatorObserver>[AppNavigatorObserver()],
              );
            },
          );
        },
      ),
    );
  }
}
