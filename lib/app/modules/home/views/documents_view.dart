import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/global/custom_widgets/custom_text_form.dart';
import 'package:graduation/global/shared/app_colors.dart';

class DocumentsView extends StatefulWidget {
  const DocumentsView({super.key});

  @override
  _DocumentsViewState createState() => _DocumentsViewState();
}

class _DocumentsViewState extends State<DocumentsView> {
  @override
  Widget build(BuildContext c) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.03.sw),
          child: Column(children: [
            0.02.sh.ph,
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              CustomTextForm(
                fieldWidth: 0.70.sw,
                maxLines: 1,
              ),
              const Icon(
                Icons.search,
                size: 35,
              ),
            ]),
           SizedBox(
            height: 0.75.sh,
             child: AnimationLimiter(
              child: GridView.count(
                shrinkWrap: true,
                primary: true,
                padding: EdgeInsets.all(0.01.sw),
                crossAxisCount: 2,
                childAspectRatio: 1.w,
                mainAxisSpacing: 0.01.sw,
                crossAxisSpacing: 5.w,
                children: List.generate(
                  50,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(seconds: 1),
                      columnCount: 3,
                      child: ScaleAnimation(
                        duration: const Duration(seconds: 2),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: FadeInAnimation(
                            child: Container(color: AppColors.blackColor,)),
                      ),
                    );
                  },
                ),
              ),
                       ),
           )
          ])),
    );
  }
}
