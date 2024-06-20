import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/ui/cam_view/cam_view.dart';
import 'package:graduation/ui/employee_details_view/employee_details_view.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_button.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_text.dart';
import 'package:graduation/ui/user_management/user_management_controller.dart';

// ignore: must_be_immutable
class UserManagementView extends GetView<UserManagementController> {
  UserManagementView({super.key});
  UserManagementController controller = Get.put(UserManagementController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 0.05.sw),
          child: Column(
            children: [
              CustomText(
                text: 'All users',
                fontSize: screenWidth(15),
              ),
              Stack(
                children: [
                  Obx(() => SizedBox(
                        height: screenHeight(1.125),
                        child: ListView.builder(
                            shrinkWrap: true,
                            primary: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.usersList.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(top: screenWidth(40)),
                                child: Container(
                                  width: screenWidth(1.2),
                                  height: screenHeight(10),
                                  decoration: BoxDecoration(
                                      color: AppColors.lightBlue,
                                      borderRadius: BorderRadius.circular(
                                          screenWidth(20)),
                                      border: Border.all(
                                          color: Color.fromARGB(255, 31, 32, 94)
                                              .withOpacity(0.999))),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth(30)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(controller
                                                    .usersList[index].name ??
                                                'no data'),
                                            Spacer(),
                                            InkWell(
                                                onTap: () {
                                                  controller.deleteUser(
                                                      userId: controller
                                                          .usersList[index]
                                                          .id!);
                                                },
                                                child: Icon(Icons.delete,
                                                    color: AppColors.redColor))
                                          ],
                                        ),
                                        Text(controller
                                                .usersList[index].position ??
                                            'no data'),
                                        Text(controller
                                                .usersList[index].createdAt ??
                                            'no data'),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenHeight(1.35), start: screenWidth(1.5)),
                    child: CustomButton(
                      onPressed: () {
                        controller.getAllUsers();
                        //Get.defaultDialog(
                        //title: 'Create User',
                        //content: Container(
                        //   width: screenWidth(1.2),
                        // height: screenHeight(1.6),
                        //child: Column(children: [TextFormField()]),
                        //  ));
                        Get.offAll(() => EmployeeDetails());
                      },
                      child: Text.new(
                        '+',
                        style: TextStyle(color: Colors.black, fontSize: 60),
                      ),
                      shape: CircleBorder(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                        top: screenHeight(1.55), start: screenWidth(1.38)),
                    child: FloatingActionButton(
                      backgroundColor: AppColors.blueColor,
                      onPressed: () {
                        Get.offAll(() => CamView());
                      },
                      shape: CircleBorder(),
                      child: Icon(Icons.add_photo_alternate,
                          color: AppColors.blackColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
