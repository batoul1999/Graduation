import 'package:flutter/material.dart';
import 'package:graduation/app/core/services/base_controller.dart';

class ForgetPasswordController extends BaseController{
     final TextEditingController emailController =
      TextEditingController(text: 'emilys'); 
      GlobalKey<FormState> globalKey = GlobalKey();
}