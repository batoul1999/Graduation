import 'dart:io';
import 'package:flutter/material.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'package:image_picker/image_picker.dart';




class CamView extends StatefulWidget {
  @override
  _CamViewState createState() => _CamViewState();
}

class _CamViewState extends State<CamView> {
  XFile? imageFile;
  _showOption(BuildContext context){
    return showDialog(
      context: context,
       builder: (context)=> AlertDialog(
        title: Text("Make a choice"),
        content: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Gallery"),
                onTap:()=> _imageFromGallery(context),
              ),
               ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap:()=> _imageFromCamera(context),
              ),
            ],
            ),
        ),
        )
        );
  }
  Future _imageFromGallery(BuildContext context) async{
    var image = await ImagePicker().pickImage(source:ImageSource.gallery);
    setState(() {
      imageFile = image;
    });
    Navigator.pop(context);
  }
   Future _imageFromCamera(BuildContext context) async{
     var image = await ImagePicker().pickImage(source:ImageSource.camera);
    setState(() {
      imageFile = image;
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        title: Text('Upload an image'),
      ),
     body: Center(
      child: imageFile != null? 
      Image.file(File(imageFile!.path),
      width: 400,
      height: 500,
      fit: BoxFit.cover,
      )
      :Text('There is no image'),
     ),
     
     floatingActionButton: Padding(
      
       padding: const EdgeInsets.all(70.0),
       child: FloatingActionButton(
        backgroundColor: AppColors.mainColor1,
        onPressed: ()=>_showOption(context),
       child: Icon(Icons.add_photo_alternate,color: AppColors.whiteColor,),
       shape: CircleBorder(),),
     ),
     
    );
  }
}