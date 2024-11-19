import 'package:get/get.dart';
import 'package:nova_demo/dashboard/dashboard_binding.dart';
import 'package:nova_demo/dashboard/dashboard_view.dart';
import 'package:nova_demo/dashboard/download/download_binding.dart';
import 'package:nova_demo/dashboard/download/download_view.dart';
import 'package:nova_demo/dashboard/favorite/favorite_binding.dart';
import 'package:nova_demo/dashboard/home/home_binding.dart';
import 'package:nova_demo/dashboard/home/home_controller.dart';
import 'package:nova_demo/dashboard/home/home_view.dart';
import 'package:nova_demo/dashboard/settings/settings_binding.dart';
import 'package:nova_demo/dashboard/settings/settings_view.dart';
import 'package:nova_demo/navigation/app_routes.dart';
import 'package:nova_demo/profile_picture/ProfilePictureBinding.dart';
import 'package:nova_demo/profile_picture/profile_picture_view.dart';
import 'package:nova_demo/sign_in/sign_in_binding.dart';
import 'package:nova_demo/sign_in/sign_in_view.dart';
import 'package:nova_demo/sign_up/sign_up_binding.dart';
import 'package:nova_demo/sign_up/sign_up_view.dart';
import 'package:nova_demo/splash/splash_binding.dart';
import 'package:nova_demo/splash/splash_view.dart';

class AppPages {
  static final routes = [
    /// Route for the splash screen.
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),

    /// Route for the sign-in screen.
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInView(),
      binding: SingInBinding(),
    ),

    /// Route for the sign-up screen.
    GetPage(
      name: AppRoutes.signUp,
      page: () => SignUpView(),
      bindings: [SignUpBinding(), SingInBinding()],
    ),

    /// Route for the profile picture upload screen.
    GetPage(
      name: AppRoutes.profilePicture,
      page: () => ProfilePictureView(),
      binding: ProfilePictureBinding(),
    ),

    /// Route for the home screen.
    GetPage(
      name: AppRoutes.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardView(),
      bindings: [
        DashboardBinding(),
        HomeBinding(),
        SingInBinding(),
        FavoriteBinding(),
        DownloadBinding(),
      ],
    ),
    GetPage(
      name: AppRoutes.download,
      page: () => const DownloadView(),
      binding: DownloadBinding(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
