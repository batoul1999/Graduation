import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graduation/app/core/services/base_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationController extends BaseController {
  StreamController<ErrorAnimationType> errorAnimationController =
      StreamController();
  TextEditingController pinController = TextEditingController();

 
}
