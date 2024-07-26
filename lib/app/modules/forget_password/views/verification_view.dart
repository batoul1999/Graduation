import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/app/core/utils/general_utils.dart';
import 'package:graduation/global/custom_widgets/custom_button.dart';
import 'package:graduation/global/custom_widgets/custom_text.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           const CustomText(
              text: 'Enter code',
              textType:TextStyleType.bodyBig ,
            ),
             0.09.sh.ph,
            const CustomText(
              textType: TextStyleType.small,
               text: 'We have sent the code to your email, check it',
            
            ),
             0.1.sh.ph,
            // Code input area (replace with your preferred input method)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               SizedBox(
                height: 0.2.sh,
                width: 0.08.sh,
                child: TextFormField(
                  onChanged: (value){
                    if(value.length ==1){
                    FocusScope.of(context).nextFocus();
                    }
                  },
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
               ),
                SizedBox(
                height: 0.2.sh,
                width: 0.08.sh,
                child: TextFormField(
                  onChanged: (value){
                    if(value.length ==1){
                    FocusScope.of(context).nextFocus();
                    }
                  },
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
               ),
                SizedBox(
               height: 0.2.sh,
                width: 0.08.sh,
                child: TextFormField(
                   onChanged: (value){
                    if(value.length ==1){
                    FocusScope.of(context).nextFocus();
                    }
                  },
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
               ),
                SizedBox(
                height: 0.2.sh,
                width: 0.08.sh,
                child: TextFormField(
                  style: Theme.of(context).textTheme.headlineSmall,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
               ),
              ],
            ),
            0.03.sh.ph,
          CustomButton(
            text: 'ee',
            onPressed:(){}
            )
          ],
        ),
      ),
    );
  }
}
