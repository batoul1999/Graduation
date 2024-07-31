import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/app/modules/home/controllers/arabic_editor_controller.dart';
import 'package:graduation/global/shared/app_colors.dart';

// ignore: must_be_immutable
class ArabicEditorView extends GetView<ArabicEditorController> {
  @override
  ArabicEditorController controller = Get.put(ArabicEditorController());
  ArabicEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondBlue.withOpacity(0.1),
      body: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 0.22.sh,
                child: QuillToolbar.simple(
                  configurations: QuillSimpleToolbarConfigurations(
                    showDirection: true,
                    controller: controller.arabicQuillController,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('ar'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0.02.sh),
                child: QuillEditor(
                  configurations: QuillEditorConfigurations(
                      padding: EdgeInsetsDirectional.only(end: 0.02.sw),
                      maxHeight: 1.sh,
                      minHeight: 1.sh,
                      controller: controller.arabicQuillController,
                      autoFocus: true,
                      checkBoxReadOnly: true,
                      sharedConfigurations: const QuillSharedConfigurations(
                        locale: Locale('ar'),
                      ),
                      builder: (context, quillEditor) {
                        return Container(
                          decoration: BoxDecoration(
                              color: AppColors.secondBlue,
                              border: Border.all(color: AppColors.mainBlue)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.05.sw, vertical: 0.02.sh),
                          // Your background color
                          child: SingleChildScrollView(
                              child:
                                  quillEditor), // Render the Quill editor within the container
                        );
                      }),
                  focusNode: FocusNode(),
                  scrollController: controller.arabicScrollController,
                ),
              ),
            ],
          ),
          Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0.04.sw, vertical: 0.02.sh),
                child: FloatingActionButton(
                    backgroundColor: AppColors.mainBlue.withOpacity(0.8),
                    onPressed: () {
                      controller.fakeSending();
                    },
                    child: Icon(
                      Icons.send,
                      color: AppColors.whiteColor,
                    )),
              ))
        ],
      ),
    );
  }
}
