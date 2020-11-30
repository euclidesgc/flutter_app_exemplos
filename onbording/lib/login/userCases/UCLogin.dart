import 'package:get/get.dart';
import 'package:models/resource.dart';
import 'package:onbording/login/repository/IRepositoryLogin.dart';
import 'package:onbording/login/repository/RepositoryLogin.dart';
import 'package:onbording/login/userCases/IUCLogin.dart';

class UCLogin implements IUCLogin{

  final IRepositoryLogin repositoryLogin = Get.put(RepositoryLogin());

  @override
  Future<Resource> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Resource> resetarSenha(String usuario) {
    // TODO: implement resetarSenha
    throw UnimplementedError();
  }

  @override
  Future<Resource> basicLogin({String user, String password}) async{
    final resource =  await repositoryLogin.basicLogin(user: user, password: password);
   return resource;
  }

}