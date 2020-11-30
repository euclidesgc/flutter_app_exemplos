
import 'package:flutter/material.dart';
import 'package:models/resource.dart';

abstract class IUCLogin {

  Future<Resource> basicLogin({@required String user,@required String password});
  Future<Resource> getUser();
  Future<Resource> resetarSenha(String usuario);

}