
import 'package:components/util/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_exemplo/routes.dart';
import 'package:get/get.dart';
import 'package:models/login/UserModel.dart';
import 'package:onbording/login/ui/loginPage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeUtil.getThemeData(),
      initialRoute: "/",
      getPages: routes,

    );
  }
}



