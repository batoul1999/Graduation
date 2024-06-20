import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/core/data/repositories/auth_repository.dart';
import 'package:graduation/core/data/services/base_controller.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/ui/home_page/home_page.dart';

class LoginController extends BaseController {
  TextEditingController emailController = TextEditingController(text: 'evan@gmail.com');
  TextEditingController passwordController = TextEditingController(text: '123456789');
  void login (){
    AuthRepository().login(email: emailController.text
    , password: passwordController.text).then((value){
      if(value.$1!= null){
        errorMessage.value=value.$1!;
      }else if(value.$2!= null){
      localStorage.setTokenInfo(value.$2!.token!);
      Get.to(()=> HomePage());
      }
    });
  }
}
