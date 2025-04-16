import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/features/auth/presentation/screens/login_screen.dart';
import 'package:tsh_soft/features/auth/presentation/screens/register_screen.dart';
import 'package:tsh_soft/features/home/presentation/screens/all_category_screen.dart';
import 'package:tsh_soft/features/home/presentation/screens/home_screen.dart';
import 'package:tsh_soft/features/products/presentation/cubit/select_product_filter/select_filter_cubit.dart';
import 'package:tsh_soft/features/products/presentation/screens/product_details_screen.dart';
import 'package:tsh_soft/features/products/presentation/screens/products_screen.dart';
import 'package:tsh_soft/features/splash/presentation/screens/on_boarding_screen.dart';
import 'package:tsh_soft/features/splash/presentation/screens/splash_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../injection_container.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/OnBoardingScreen';
  static const String loginScreenRoute = '/LoginScreenRoute';
  static const String registerScreenRoute = '/RegisterScreenRoute';
  static const String homeScreenRoute = '/HomeScreenRoute';
  static const String allCatregoryScreenRoute = '/AllCatregoryScreenRoute';
  static const String productsScreenRoute = '/ProductsScreenRoute';
  static const String productDetailsScreenRoute = '/ProductsDetailsScreenRoute';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) {
            return const SplashScreen();
          },
        );

      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OnBoardingScreen(),
        );

      case Routes.loginScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const LoginScreen(),
        );

      case Routes.registerScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const RegisterScreen(),
        );

      case Routes.homeScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const HomeScreen(),
        );

      case Routes.allCatregoryScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const AllCategoriesScreen(),
        );

      case Routes.productsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => BlocProvider(
            create: (context) => SelectProductFilterCubit(),
            child: const ProductsScreen(),
          ),
        );

      case Routes.productDetailsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ProductDetailsScreen(),
        );

      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }

  static String get currentRoute => routesStack.last;

  static void pushRouteToRoutesStack(String route) {
    routesStack.add(route);
    ServiceLocator.injectRoutesStackSingleton(routesStack);
  }

  static void popRouteFromRoutesStack() {
    routesStack.removeLast();
    ServiceLocator.injectRoutesStackSingleton(routesStack);
  }
}
