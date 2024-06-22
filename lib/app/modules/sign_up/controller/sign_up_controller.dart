import 'package:flutter/material.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class SignUpController extends BaseController{
    final TextEditingController nameController =
      TextEditingController(text: 'emilys');
  final TextEditingController passwordController =
      TextEditingController(text: 'emilyspass');
  GlobalKey<FormState> globalKey = GlobalKey();
  void signup(){
    
  }
}