import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:graduation/core/data/repositories/users_repository.dart';
import 'package:graduation/core/data/services/base_controller.dart';
import 'package:graduation/ui/user_management/user_management_view.dart';


class EmployeeDetailsController extends BaseController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
       void createUser(){
      UsersRepository().createUser(userName: fullNameController.text, department: departmentController.text, phoneNumber: phoneNumberController.text,).then((value){
        
      if(value.$1!= null ){
        print(value.$1);
      }else if(value.$2!= null){
        print(value.$2!.message);
        
      }
      Get.offAll(UserManagementView());
      fullNameController.clear();
      departmentController.clear();
      phoneNumberController.clear();
    });
     }


}
