import 'package:flutter/material.dart';
import 'package:graduation/ui/shared/colors.dart';
import 'dart:ui' as ui;

class TopFrame extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

 Paint paint_fill_0 = Paint()
      ..color = AppColors.mainColor1
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*1.0004667,size.height*0.0008600);
    path_0.quadraticBezierTo(size.width*1.0004667,size.height*0.1503600,size.width*1.0004667,size.height*0.1748600);
    path_0.cubicTo(size.width*0.5511667,size.height*0.0951400,size.width*0.2232667,size.height*0.2137200,size.width*0.0006667,size.height*0.4160000);
    path_0.quadraticBezierTo(size.width*-0.0001667,size.height*0.3409400,0,size.height*-0.0002800);
    path_0.lineTo(size.width*1.0004667,size.height*0.0008600);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  

  // Layer 1
  
  Paint paint_stroke_0 = Paint()
      ..color = AppColors.blackColor
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
