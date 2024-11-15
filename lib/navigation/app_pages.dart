import 'package:get/get.dart';
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
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => SignInView(),
      binding: SingInBinding(),
    ),
    GetPage(
        name: AppRoutes.signUp,
        page: () => SignUpView(),
        bindings: [SignUpBinding(), SingInBinding()]),
    GetPage(
      name: AppRoutes.profilePicture,
      page: () => ProfilePictureView(),
      binding: ProfilePictureBinding(),
    ),
  ];
}
