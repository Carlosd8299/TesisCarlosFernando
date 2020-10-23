import 'package:get/get.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_binding.dart';
import 'package:itsuit/modules/cupones/create_cupon/create_cupon_screen.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_binding.dart';
import 'package:itsuit/modules/cupones/detail_cupon/detail_cupon_screen.dart';
import 'package:itsuit/modules/cupones/list_cupon/list_cupon_binding.dart';
import 'package:itsuit/modules/cupones/list_cupon/list_cupon_screen.dart';
import 'package:itsuit/modules/home/home_binding.dart';
import 'package:itsuit/modules/home/home_screen.dart';
import 'package:itsuit/modules/login/login_binding.dart';
import 'package:itsuit/modules/on_boarding/on_boarding_binding.dart';
import 'package:itsuit/modules/own_profile/own_profile_binding.dart';
import 'package:itsuit/modules/profile/profile_binding.dart';
import 'package:itsuit/modules/profile/profile_screen.dart';
import 'package:itsuit/modules/screens.dart';
import 'package:itsuit/modules/sign_up/sign_up_binding.dart';
import 'package:itsuit/modules/splash/splash_binding.dart';
import 'package:itsuit/routes/my_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => OnBoarding(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: AppRoutes.SIGNUOP,
      page: () => SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.OWNPROFILE,
      page: () => OwnProfileScreen(),
      binding: OwnProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.OWNPROFILE,
      page: () => OwnProfileScreen(),
      binding: OwnProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.OWNPROFILE,
      page: () => OwnProfileScreen(),
      binding: OwnProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.CREATECUPON,
      page: () => CreateCuponScreen(),
      binding: CreateCuponBinding(),
    ),
    GetPage(
      name: AppRoutes.LISTCUPON,
      page: () => ListCuponScreen(),
      binding: ListCuponBinding(),
    ),
    GetPage(
      name: AppRoutes.DETAILCUPON,
      page: () => DetailsCuponScreen(),
      binding: DetailsCuponBinding(),
    ),
  ];
}
