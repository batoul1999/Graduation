import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation/core/data/enum/file_type_enum.dart';
import 'package:graduation/core/data/services/base_controller.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/ui/image_capture/image_selection_screen_controller.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'package:graduation/ui/shared/custom_widgets/selected_date.dart';

class ImageSelectionScreen extends StatelessWidget {
ImageSelectionController controller= Get.put(ImageSelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Selection'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Obx(()=> Container(
              height: MediaQuery.of(context).size.height / 2,
              color: AppColors.mainColor3,
              child:
              controller.selectedImage.value==''?
                Center(
                  child: IconButton(
                      icon: Icon(Icons.add_a_photo),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Choose Image'),
                            actions: [
                              TextButton(
                                onPressed: () async {
                               await  controller.pickFile(FileTypeEnum.GALLERY ).then((value){
                                controller.selectedImage.value=value.path[0];
                               });
                                },
                                child: Text('Gallery'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  await  controller.pickFile(FileTypeEnum.CAMERA ).then((value){
                                controller.selectedImage.value=value.path[0];
                               });
                                },
                                child: Text('Camera'),
                              ),
                            ],
                          );
                        },
                      ),
                    )
                     ,
                ):Image.file(File(controller.selectedImage.value)),
            ),),
                           
            0.001.sh.ph,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller.imageUrlController,
                decoration: InputDecoration(
                  labelText: 'Image caption:',
                ),
              ),
            ),
            0.03.sh.ph,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Destination:'),
                  Spacer(),
                  // Implement your logic to display and choose the person here (e.g., Dropdown list)
                ],
              ),
            ),
             0.03.sh.ph,
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Text('Date:'),
            //       Spacer(),
            //       Obx(
            //         () => Text(
            //           selectedDateController.date.value?.toIso8601String() ??
            //               'No Date Selected',
            //         ),
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.calendar_today),
            //         onPressed: selectedDateController.pickDate,
            //       ),
            //     ],
            //   ),
            // ),
             0.03.sh.ph,
            ElevatedButton(
              onPressed: () {
                // Implement your API call logic here using controller.selectedFile.path, imageSelectionController.imageUrlController.text, etc.
                Get.snackbar('Submitted', 'Data sent to API');
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}