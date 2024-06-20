import 'package:flutter/material.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'dart:ui' as ui;

class SignUpFrame extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    
  Paint paint_fill_0 = Paint()
      ..color = AppColors.mainColor1
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*1.0026333,size.height*1.0034600);
    path_0.quadraticBezierTo(size.width*1.0024667,size.height*0.6799600,size.width*1.0026667,size.height*0.6554600);
    path_0.cubicTo(size.width*0.5527667,size.height*0.7339200,size.width*0.2202000,size.height*0.5993000,size.width*-0.0008000,size.height*0.3964000);
    path_0.quadraticBezierTo(size.width*-0.0022333,size.height*0.4714600,size.width*-0.0016000,size.height*1.0018000);
    path_0.lineTo(size.width*1.0026333,size.height*1.0034600);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = AppColors.redColor2
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.03
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;
    paint_stroke_0.shader = ui.Gradient.linear(Offset(size.width*-0.00,size.height*0.70),Offset(size.width*1.00,size.height*0.70),[AppColors.mainColor3,AppColors.mainColor1],[0.00,1.00]); 
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}