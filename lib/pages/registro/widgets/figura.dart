
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Dibujar el triángulo del barco
    Paint paint = Paint()
      ..color = const Color(0xff82BFE0) // Color del barco
      ..strokeWidth = 5.0; // Grosor de la línea

    Path path = Path();
    path.lineTo(0, size.height/3);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height/3);
    path.lineTo(size.width, 0);
    path.moveTo(0, 0);
    path.close(); // Cerrar el camino

    canvas.drawPath(path, paint);
    
/* 
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    final center = Offset(size.width/2, 0);
    final radius = size.width / 2;
    final startAngle = pi/2; // Start angle in radians
    final sweepAngle = 3*pi /4; // Sweep angle in radians
canvas.
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0,
      pi,
      false, // Whether to draw the arc clockwise
      paint,
    ); */
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
