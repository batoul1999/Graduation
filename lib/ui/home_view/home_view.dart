import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:graduation/ui/cam_view/cam_view.dart';
import 'package:graduation/ui/shared/colors.dart';



class HomeView extends StatefulWidget {   
  @override
  HomeViewState createState() => HomeViewState();
}


class HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: AppColors.mainColor1,
        backgroundColor: Colors.white,
        height: 70,
        animationDuration: Duration(
          milliseconds: 200,
        ),
          items: [
           CurvedNavigationBarItem(
            child: Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
              )
            ),
             CurvedNavigationBarItem(
            child: Icon(
              Icons.camera,
              size: 30,
              color: Colors.white,
              )
            ),
             CurvedNavigationBarItem(
            child: Icon(
              Icons.notification_add,
              size: 30,
              color: Colors.white,
              )
            ),
             CurvedNavigationBarItem(
            child: Icon(
              Icons.person,
              size: 30,
              color: Colors.white ,
              )
            ),
          
         ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          switch(index){
            case 0:
               break; 
            
            case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=> CamView())
              );
          }
        },
       
       
        ),
    );
}


}