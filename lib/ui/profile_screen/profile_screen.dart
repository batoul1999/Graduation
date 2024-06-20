import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/core/util.dart';
import 'package:graduation/ui/shared/custom_widgets/custom_button.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      left: true,
      child: Scaffold(
         appBar:AppBar(
           title: Text(
             'Profile', 
            style: const TextStyle(fontSize: 20.0), 
  ),

),
body: Padding(
  padding: const EdgeInsets.only(top: 50),
  child: Column(
    children:[ Row(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
         Padding(
           padding: const EdgeInsets.only(left: 30),
           child: CircleAvatar( 
            radius: 50.0,
            backgroundImage: AssetImage('assets/profile_picture.png'), 
               ),
         ),
         SizedBox(width:20.0,),
        Padding(
          padding: const EdgeInsets.only(top:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style:  TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
               0.007.sh.ph,
              Text(
                '@email',
                style:  TextStyle(color: Colors.grey),
              ),
    
            ],
          ),
        ),
      ],
    ),
                 0.15.sh.ph,
      Row(
       children: [
        SizedBox(width:30.0,),
        Icon(Icons.email),
         SizedBox(width:20.0,),
        Text('Email'),
         SizedBox(width:200.0,),
        Text('Email'),
        SizedBox(width:20.0,),
        Icon(Icons.arrow_right_outlined,size: 35,)
             ], 
            ),
             0.05.sh.ph,
              Row(
       children: [
        SizedBox(width:30.0,),
        Icon(Icons.phone),
         SizedBox(width:20.0,),
        Text('Phone Number '),
         SizedBox(width:120.0,),
        Text('Number'),
        SizedBox(width:20.0,),
        Icon(Icons.arrow_right_outlined,size: 35,)
             ], 
            ),
             0.05.sh.ph,
              Row(
       children: [
        SizedBox(width:30.0,),
        Icon(Icons.lock),
         SizedBox(width:20.0,),
        Text('Change Password'),
         SizedBox(width:155.0,),
        Text(''),
        SizedBox(width:20.0,),
        Icon(Icons.arrow_right_outlined,size: 35,)
             ], 
            ),
              0.15.sh.ph,
              CustomButton(onPressed: (){},buttonText: 'Save',)

    ]
    
  ),
  
),

      ),
    );
  }

  
}