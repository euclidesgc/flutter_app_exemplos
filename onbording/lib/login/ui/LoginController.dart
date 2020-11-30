import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/login/UserModel.dart';
import 'package:onbording/login/userCases/IUCLogin.dart';
import 'package:onbording/login/userCases/UCLogin.dart';


import 'package:models/resource.dart';


class LoginController extends GetxController {
  final isLoading = false.obs;
  final obscure = true.obs;
  final isLogin = true.obs;
  RxBool emailIsValid;

  RxBool passwordIsValid;

  RxBool nameIsValid;

  IUCLogin userCase = Get.put(UCLogin());

  final emailError = "".obs;
  final passwordError = "".obs;
  final nameError = "".obs;

  String email = "";
  String password = "";
  String name = "";
  double maxWidth = Get.width;

  AnimationController animatedController;
  Animation<double> animation;

  changeObscure() => obscure.value = !obscure.value;

  @override
  void onInit() {
    nameIsValid = false.obs;
    emailIsValid = false.obs;
    passwordIsValid = false.obs;

  }

  init(TickerProvider tickerProvider) {
    animatedController = AnimationController(
        vsync: tickerProvider, duration: Duration(milliseconds: 300));

    animation =
        Tween<double>(begin: maxWidth, end: 60).animate(animatedController);
  }

  setEmail(String e) {
    email = e;
    if (GetUtils.isEmail(e)) {
      emailIsValid.value = true;
      emailError.value = "";
    } else {
      emailIsValid.value = false;
      emailError.value = "E-mail inválido";
    }
  }

  setPassword(String e) {
    password = e;
    if (e.trim().length < 6) {
      passwordIsValid.value = false;
      passwordError.value = "Senha muito fraca";
    } else {
      passwordIsValid.value = true;
      passwordError.value = "";
    }
  }

  setName(String e) {
    name = e;
    if (e.trim().length < 6) {
      nameIsValid.value = false;
      nameError.value = "Nome muito curto";
    } else {
      nameIsValid.value = true;
      nameError.value = "";
    }
  }

  resetPassword() {

  }



    get submitIsValid => (emailIsValid.value == true &&
      passwordIsValid.value == true &&
      (isLogin.value == true ? true : nameIsValid.value == true))
      ? buttonPressed
      : null;

  buttonPressed() async{

    animatedController.forward();
    Resource resource = await  userCase.basicLogin(user: email, password: password);

    switch(resource.stateEnum){

      case ResourceStateEnum.SUCCESS:
        animatedController.reverse();
        Get.put(UserModel("teste da silva", 1), permanent: true);

        break;
      case ResourceStateEnum.ERROR:
        // TODO: Handle this case.
        break;
      case ResourceStateEnum.NONE:
        // TODO: Handle this case.
        break;
    }


  }
}
