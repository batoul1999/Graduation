import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:graduation/app/core/data/models/apis/get_all_docs_model/get_all_docs_model.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/app/modules/document_details/controller/document_details_controller.dart';
import 'package:graduation/app/modules/main_views/controllers/documents_controller.dart';
import 'package:graduation/app/routes/app_pages.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class DocumentsView extends GetView<DocumentsController> {
  DocumentsView({super.key});
  @override
  DocumentsController controller = Get.put(DocumentsController());
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await controller.loadDocuments();
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.gradientBlue,
                    AppColors.gradientBlue.withOpacity(1),
                    AppColors.whiteColor
                  ]),
            ),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
                child: ListView(children: [
                  0.02.sh.ph,
                  CustomTextForm(
                    fieldWidth: 0.9.sw,
                    maxLines: 1,
                    hint: 'بحث',
                    onChanged: (value) {
                      value!.isEmpty
                          ? controller.filteredList.clear()
                          : controller.filterDocuments(value);
                    },
                  ),
                  0.02.sh.ph,
                  Obx(() => controller.isAllDocumentsLoading
                      ? shimmerLoading()
                      : SizedBox(
                          height: 0.75.sh,
                          child: AnimationLimiter(
                            child: GridView.count(
                              shrinkWrap: true,
                              primary: true,
                              padding: EdgeInsets.all(0.01.sw),
                              crossAxisCount: 2,
                              childAspectRatio: 1.5.w,
                              mainAxisSpacing: 0.05.sw,
                              crossAxisSpacing: 5.w,
                              children: List.generate(
                                controller.filteredList.isNotEmpty
                                    ? controller.filteredList.length
                                    : controller.documentsList.length,
                                (int index) {
                                  Documents document =
                                      controller.documentsList[index];
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(seconds: 1),
                                    columnCount: 3,
                                    child: ScaleAnimation(
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(
                                          child: InkWell(
                                        onTap: () {
                                          if (Get.isRegistered<
                                              DocumentDetailsController>()) {
                                            Get.delete<
                                                DocumentDetailsController>();
                                          }
                                          Get.toNamed(Routes.DOCUMENTDETAILS,
                                              arguments: {
                                                'document': document
                                              });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors.mainBlue,
                                              border: Border.all(
                                                  color: AppColors.blackColor),
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w,
                                                vertical: 3.h),
                                            child: Center(
                                              child: Text(
                                                document.name!,
                                                style: TextStyle(
                                                  // Replace with your custom style
                                                  fontSize: 18.sp,
                                                  color: AppColors.whiteColor,
                                                  fontWeight: FontWeight
                                                      .w600, // Example style
                                                ),
                                                overflow: TextOverflow.fade,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ))
                ])),
          ),
        ),
      ),
    );
  }

  Widget shimmerLoading() {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        baseColor: AppColors.secondBlue,
        highlightColor: AppColors.greyColor.withOpacity(0.2),
        child: SizedBox(
          height: 0.75.sh,
          child: AnimationLimiter(
            child: GridView.count(
              shrinkWrap: true,
              primary: true,
              padding: EdgeInsets.all(0.01.sw),
              crossAxisCount: 2,
              childAspectRatio: 1.6.w,
              mainAxisSpacing: 0.01.sw,
              crossAxisSpacing: 5.w,
              children: List.generate(
                12,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(seconds: 1),
                    columnCount: 3,
                    child: ScaleAnimation(
                      duration: const Duration(seconds: 2),
                      curve: Curves.fastLinearToSlowEaseIn,
                      child: FadeInAnimation(
                          child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(10.r)),
                      )),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
