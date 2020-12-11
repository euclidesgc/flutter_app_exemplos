import 'package:get/get.dart';
import 'package:onbording/dash/DashController.dart';
import 'package:onbording/dash/DashPage.dart';
import 'package:onbording/login/ui/LoginController.dart';
import 'package:onbording/login/ui/loginPage.dart';

List<GetPage> routes = [
  GetPage(
    name: "/",
    page: () => LoginPage(),
    binding: BindingsBuilder(() => {
      Get.lazyPut<LoginController>(() => LoginController()),
    }),
  ),
  GetPage(
    name: "/dash",
    page: () => DashPage(),
    binding: BindingsBuilder(() => {
      Get.lazyPut<DashController>(() => DashController()),
    }),
  ),
];