import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsh_soft/core/params/reset_password_params.dart';
import 'package:tsh_soft/features/auth/presentation/screens/confirm_code_screen.dart';
import 'package:tsh_soft/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:tsh_soft/features/auth/presentation/screens/login_screen.dart';
import 'package:tsh_soft/features/auth/presentation/screens/register_screen.dart';
import 'package:tsh_soft/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:tsh_soft/features/cart/presentation/screens/bill_screen.dart';
import 'package:tsh_soft/features/cart/presentation/screens/cart_screen.dart';
import 'package:tsh_soft/features/home/presentation/screens/all_category_screen.dart';
import 'package:tsh_soft/features/home/presentation/screens/home_screen.dart';
import 'package:tsh_soft/features/home/presentation/screens/notifications_screen.dart';
import 'package:tsh_soft/features/products/domain/entities/product_entity_model.dart';
import 'package:tsh_soft/features/products/presentation/cubit/select_product_filter/select_filter_cubit.dart';
import 'package:tsh_soft/features/products/presentation/screens/product_details_screen.dart';
import 'package:tsh_soft/features/products/presentation/screens/products_screen.dart';
import 'package:tsh_soft/features/profile/domain/entities/profile_entity.dart';
import 'package:tsh_soft/features/profile/presentation/screens/favorites_screen.dart';
import 'package:tsh_soft/features/splash/presentation/screens/on_boarding_screen.dart';
import 'package:tsh_soft/features/splash/presentation/screens/splash_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/my_orders/presentation/screens/order_details_screen.dart';
import '../../features/my_orders/presentation/screens/orders_screen.dart';
import '../../features/profile/presentation/screens/about_us.dart';
import '../../features/profile/presentation/screens/contact_us_screen.dart';
import '../../features/profile/presentation/screens/edit_profile_screen.dart';
import '../../features/profile/presentation/screens/faq_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
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
  static const String profileScreenRoute = '/ProfileScreenRoute';
  static const String editProfileScreenRoute = '/EditProfileScreenRoute';
  static const String contactUsScreenRoute = '/ContactUsScreenRoute';
  static const String aboutUsScreenRoute = '/AboutUsScreenRoute';
  static const String faqScreenRoute = '/FaqScreenRoute';
  static const String favoritesScreenRoute = '/favoritesScreenRoute';
  static const String ordersScreenRoute = '/OrdersScreenRoute';
  static const String orderDetailsScreenRoute = '/OrderDetailsRoute';
  static const String cartScreenRoute = '/CartsRoute';
  static const String notificationScreenRoute = '/NotificationRoute';
  static const String billScreenRoute = '/BillRoute';
  static const String forgetPasswordScreenRoute = '/ForgetPasswordRoute';
  static const String confirmCodeScreenRoute = '/ConfirmCodeRoute';
  static const String resetPasswordRoute = '/ResetPasswordScreen';
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
        final ProductEntity product = routeSettings.arguments as ProductEntity;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => ProductDetailsScreen(
            product: product,
          ),
        );

      case Routes.profileScreenRoute:
        final ProfileEntity profileData =
            routeSettings.arguments as ProfileEntity;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => ProfileScreen(
            profileData: profileData,
          ),
        );

      case Routes.editProfileScreenRoute:
        final ProfileEntity profileData =
            routeSettings.arguments as ProfileEntity;

        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => EditProfileScreen(
            profileData: profileData,
          ),
        );

      case Routes.contactUsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ContactUsScreen(),
        );

      case Routes.aboutUsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const AboutUsScreen(),
        );

      case Routes.faqScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const FaqScreen(),
        );

      case Routes.favoritesScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const FavoritesScreen(),
        );

      case Routes.ordersScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OrdersScreen(),
        );

      case Routes.orderDetailsScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const OrderDetailsScreen(),
        );

      case Routes.cartScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const CartScreen(),
        );

      case Routes.notificationScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const NotificationsScreen(),
        );

      case Routes.billScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const BillScreen(),
        );

      case Routes.forgetPasswordScreenRoute:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => const ForgetPasswordScreen(),
        );

      case Routes.confirmCodeScreenRoute:
        String email = routeSettings.arguments as String;

        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => ConfirmCodeScreen(
            email: email,
          ),
        );

      case Routes.resetPasswordRoute:
        final ResetPasswordParams resetCodeParams =
            routeSettings.arguments as ResetPasswordParams;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (BuildContext context) => ResetPasswordScreen(
            resetCodeParams: resetCodeParams,
          ),
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
