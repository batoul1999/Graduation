import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation/ui/employee_details_view/employee_details.dart';
import 'package:graduation/ui/shared/colors.dart';

// ignore: must_be_immutable
class EmployeeDetails extends StatelessWidget {
  EmployeeDetails({super.key});
  
   EmployeeDetailsController createUserController = Get.put(EmployeeDetailsController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 218, 236, 236),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      //logo
     

        Padding(
            padding: const EdgeInsets.only(left: 10, top: 90),
            child: Text(
              'Employee details',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 10, 10, 10)),
            )),
        Padding(
            padding: const EdgeInsets.only(left: 20, top: 55),
            child: Text(
              'Add details',
              style: TextStyle(
                fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            )),

        Padding(
            padding: const EdgeInsets.only(left: 13, top: 30),

            //child: ElevatedButton(onPressed:null,
            //style:ElevatedButton.styleFrom(fixedSize: Size(300, 50),),
            // child: Padding(padding: const EdgeInsets.only(right: 150) ,
            //child: Text('Your Email',),
            child: SizedBox(
              width: 375,
              child: TextFormField(
                maxLength: 30,
                controller: createUserController.fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(40.0),
                   borderSide: BorderSide(
                     color: AppColors.blueColor,
                     width: 10,
                     )
                  ),
                  
                        
                ),
              ),
            ) //)
            ),
        //),

      

             Padding(
            padding: const EdgeInsets.only(left: 13, top: 20),

            /* child: ElevatedButton(onPressed:null,
       style:ElevatedButton.styleFrom(fixedSize: Size(300, 50),),
      child: Padding(padding: const EdgeInsets.only(right: 150) ,
       child: Text('Password',),)
     ),*/

            child: SizedBox(
              width: 375,
              child: TextFormField(
                maxLength: 10,
                controller: createUserController.departmentController,
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            )),

       
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 20),

            /* child: ElevatedButton(onPressed:null,
       style:ElevatedButton.styleFrom(fixedSize: Size(300, 50),),
      child: Padding(padding: const EdgeInsets.only(right: 150) ,
       child: Text('Password',),)
     ),*/

            child: SizedBox(
              width: 375,
              child: TextFormField(
                maxLength: 10,
                controller: createUserController.phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'phone number',
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            )),

      

      

        Padding(
            padding: const EdgeInsets.only(left: 25, top: 70),
            child: ElevatedButton(
                onPressed: (){
                  createUserController.createUser();
                  
                },
                //style:ElevatedButton.styleFrom(fixedSize: Size(300, 50),),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.blueColor),
                  fixedSize: MaterialStateProperty.all(Size(250, 50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 0),
                  child: Text(
                    'Save details',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ))),
      ]),
    );
  }
}
