import 'package:flutter/material.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'dart:ui' as ui;

class BottomFrame extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

       Paint paint_fill_0 = Paint()
      ..color = AppColors.mainColor1
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0026333,size.height*1.0034600);
    path_0.quadraticBezierTo(size.width*-0.0035667,size.height*0.8107800,size.width*-0.0037667,size.height*0.7862800);
    path_0.cubicTo(size.width*0.4461333,size.height*0.8647400,size.width*0.7820333,size.height*0.7384400,size.width*1.0030333,size.height*0.5355400);
    path_0.quadraticBezierTo(size.width*1.0044667,size.height*0.6106000,size.width*1.0016000,size.height*1.0018000);
    path_0.lineTo(size.width*-0.0026333,size.height*1.0034600);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = AppColors.blackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.03
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.miter;
       paint_stroke_0.shader = ui.Gradient.linear(Offset(size.width*-0.00,size.height*0.70),Offset(size.width*1.00,size.height*0.70),[AppColors.mainColor1,AppColors.mainColor3],[0.00,1.00]);
     
         
    
    canvas.drawPath(path_0, paint_stroke_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
