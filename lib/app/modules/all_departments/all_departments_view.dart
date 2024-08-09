import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/all_departments/all_department_controller.dart';
import 'package:graduation/global/custom_widgets/custom_app_bar.dart';
import 'package:graduation/global/custom_widgets/custom_gradient_container.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class AllDepartmintsView extends GetView<AllDepartmentController>{
  AllDepartmintsView({super.key});
  @override
  AllDepartmentController controller = Get.put(AllDepartmentController());
  @override
  Widget build(BuildContext context) {
  
   return  SafeArea(
    child: Scaffold(
      body: CustomGradientContainer(
        child: Stack(
          children: [
               CustomAppBar(
              text: "جميع الأقسام",
              onPressed: controller.test,
              isBool:true.obs,
            ),
            0.1.sw.pw,
                       Padding(
                padding: EdgeInsets.only(top: 0.1.sh),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(  
                    height: 0.1.sh,
                    width: 1.sw,
                    padding: EdgeInsets.symmetric(horizontal: 0.05.sw),
                    margin: EdgeInsets.symmetric(vertical: 0.005.sh, horizontal: 0.03.sw),
                    decoration: BoxDecoration(
                   border: Border.all(color: AppColors.secondDark, width: 2),
                   borderRadius: BorderRadius.circular(15.r),
                   color: AppColors.mainBlue.withOpacity(0.3)),
                      child: Center(
                        child: Text(
                          'Container $index',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: AppColors.secondDark,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      )
 
   ));
  }
}
