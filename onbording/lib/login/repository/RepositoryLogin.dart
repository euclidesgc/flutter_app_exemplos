import 'package:models/resource.dart';
import 'package:onbording/login/repository/IRepositoryLogin.dart';


class RepositoryLogin implements IRepositoryLogin{
  @override
  Future<Resource> basicLogin({String user, String password}) async{



    await Future.delayed(Duration(seconds: 3));

    Resource resource = Resource();
    resource.stateEnum = ResourceStateEnum.SUCCESS;

    return resource;



  }

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

}