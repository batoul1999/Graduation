import 'package:flutter/material.dart';
import 'package:graduation/ui/employee_details_view/employee_details_view.dart';

class LandingView extends StatelessWidget{
  LandingView({super.key});
  
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(body: Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: size.width*0.1),
      child: Column(
        children: [
        Padding(
          padding: EdgeInsetsDirectional.only(top: size.height*0.15,),
          child: Text('Office Automation', style: TextStyle(fontSize: size.width*0.08,fontWeight: FontWeight.w300,color: Colors.black),),
        ),
      
        Padding(
           padding: EdgeInsetsDirectional.only(top: size.height*0.3,),
          child: ElevatedButton(onPressed:(){
            Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetails()),);
          } , child: Text('Studens',style: TextStyle(color: Colors.white,fontSize: size.width*0.07),),
          style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,fixedSize: Size(size.width*0.8, size.height*0.07)),),
        ),
         Padding(
           padding: EdgeInsetsDirectional.only(top: size.height*0.02,),
          child: ElevatedButton(onPressed:(){
           // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()),);
          } , child: Text('Employee',style: TextStyle(color: Colors.white,fontSize: size.width*0.07),),
          style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,fixedSize: Size(size.width*0.8, size.height*0.07)),),
        )
      ]),
    ),);
  
  }
  
  
  }