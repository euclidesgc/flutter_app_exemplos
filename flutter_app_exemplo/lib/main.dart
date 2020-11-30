
import 'package:components/util/theme_util.dart';
import 'package:flutter/material.dart';
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
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeUtil.getThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
    body: _body(),);
  }

  _body() {
    return Stack(children: [
      LoginPage(),

    ],);

  }
}

