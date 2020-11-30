import 'package:components/components.dart';
import 'package:components/util/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'LoginController.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  LoginController controller;


  @override
  void initState() {
    controller = Get.put(LoginController());
    controller.init(this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        actions: [
          Obx(
                () => GestureDetector(
              onTap: () {
                controller.isLogin.value = false;
              },
              child: Row(
                children: [
                  Text(
                    "CADASTRAR",
                    style: TextStyle(
                        color: controller.isLogin.value == false
                            ? Colors.white
                            : ThemeUtil.getAccentColor()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Obx(
                () => GestureDetector(
              onTap: () {
                controller.isLogin.value = true;
              },
              child: Row(
                children: [
                  Text(
                    "ENTRAR",
                    style: TextStyle(
                        color: controller.isLogin.value == true
                            ? Colors.white
                            : ThemeUtil.getAccentColor()),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back_bubble.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nome Empresa",
                style: ThemeUtil.getHeadline1()
                    .copyWith(color: ThemeUtil.getPrimaryColor()),
                textAlign: TextAlign.center,
              ),
              Obx(
                    () {
                  return AnimatedCrossFade(
                    duration: const Duration(milliseconds: 500),
                    firstChild: Container(),
                    secondChild: CircularTextFormField(
                      onChange: (txt) {
                        controller.setName(txt);
                      },
                      hintText: "Nome",
                      prefixIcon: Icon(
                        Icons.perm_identity,
                        color: Colors.pinkAccent,
                      ),
                      sufixIcon: Icon(
                        Icons.mail,
                        color: Colors.transparent,
                      ),
                    ),
                    crossFadeState: controller.isLogin.value
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                  );
                },
              ),
              Obx(() {
                // ignore: null_aware_in_condition
                if (controller.nameError.value.isEmpty ||
                    controller.isLogin.value)
                  return Container();
                else
                  return Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      controller.nameError.value,
                      textAlign: TextAlign.right,
                      style: ThemeUtil.getHeadline4(),
                    ),
                  );
              }),
              SizedBox(
                height: 24,
              ),
              CircularTextFormField(
                onChange: (txt) {
                  controller.setEmail(txt);
                },
                hintText: "E-mail",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.pinkAccent,
                ),
                sufixIcon: Icon(
                  Icons.mail,
                  color: Colors.transparent,
                ),
              ),
              Obx(() {
                // ignore: null_aware_in_condition
                if (controller.emailError.value.isEmpty)
                  return Container();
                else
                  return Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      controller.emailError.value,
                      textAlign: TextAlign.right,
                      style: ThemeUtil.getHeadline4(),
                    ),
                  );
              }),
              SizedBox(
                height: 24,
              ),
              Obx(() => CircularTextFormField(
                onChange: controller.setPassword,
                hintText: "Senha",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.pinkAccent,
                ),
                obscure: controller.obscure.value,
                sufixIcon: GestureDetector(
                  child: Icon(
                    controller.obscure.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.pinkAccent,
                  ),
                  onTap: () {
                    controller.changeObscure();
                  },
                ),
              )),
              Obx(() {
                if (controller.passwordError.value.isEmpty)
                  return Container();
                else
                  return Container(
                    width: Get.width,
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      controller.passwordError.value,
                      textAlign: TextAlign.right,
                      style: ThemeUtil.getHeadline4(),
                    ),
                  );
              }),
              SizedBox(
                height: 24,
              ),
              FlatButton(
                color: Colors.transparent,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      // retorna um objeto do tipo Dialog
                      return AlertDialog(
                        title: new Text("Alert Dialog titulo"),
                        content: new Text("Alert Dialog body"),
                        actions: <Widget>[
                          // define os botões na base do dialogo
                          new FlatButton(
                            child: new Text("Fechar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Esqueci a senha", style: ThemeUtil.getHeadline5().copyWith(color: ThemeUtil.getAccentColor()),),
              ),
              SizedBox(
                height: 24,
              ),
              Obx(
                    () => BotaoPadraoAnimado(
                  isLoading: controller.isLoading.value,
                  animation: controller.animation,
                  onPressed: controller.submitIsValid,
                  textButton: "OK",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
