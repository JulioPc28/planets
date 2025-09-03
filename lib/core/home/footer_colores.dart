// ignore_for_file: deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FooterDobleCurvaMejorada extends StatelessWidget {
  const FooterDobleCurvaMejorada({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: double.infinity,
      child: CustomPaint(
        painter: _FooterDobleCurvaMejorada(),
      ),
    );
  }
}

class _FooterDobleCurvaMejorada extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(
      center: Offset(0.0, size.height - 185.0),
      radius: 180,
    );

    final Gradient gradiente = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: <Color>[
        Color(0xff000000),
        Color(0xff000000).withOpacity(0.9),
        Color(0xff000000).withOpacity(0.5),
        Color(0xff000000).withOpacity(0.3),
        Color(0xff000000).withOpacity(0.1),
      ],
    );

    final lapiz = Paint()..shader = gradiente.createShader(rect);
    final lapiz2 = Paint();
    final lapiz3 = Paint();

    lapiz.color = const Color(0xff077cbf);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    lapiz2.color = const Color(0xffFFF95E);
    lapiz2.style = PaintingStyle.fill;
    lapiz2.strokeWidth = 10;

    lapiz3.color = const Color(0xffBA2DA3);
    lapiz3.style = PaintingStyle.fill;
    lapiz3.strokeWidth = 3;

    // Curva base (centrada)
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.4);
    path.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.3 : size.height * 0.35,
      size.width * 0.5,
      size.height * 0.4,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.5 : size.height * 0.45,
      size.width,
      size.height * 0.4,
    );
    path.lineTo(size.width, size.height);

    // Segunda curva (desde la mitad hacia la izquierda)
    final path2 = Path();
    path2.moveTo(size.width, size.height * 0.4);
    path2.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.5 : size.height * 0.55,
      size.width * 0.5,
      size.height * 0.4,
    );
    path2.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.3 : size.height * 0.35,
      0,
      size.height * 0.4,
    );
    path2.lineTo(0, size.height * 0.43);
    path2.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.33 : size.height * 0.36,
      size.width * 0.5,
      size.height * 0.4,
    );
    path2.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.5 : size.height * 0.55,
      size.width,
      size.height * 0.4,
    );

    // Tercera curva (desde la mitad hacia la izquierda)
    final path3 = Path();
    path3.moveTo(size.width, size.height * 0.4);
    path3.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.53 : size.height * 0.55,
      size.width * 0.5,
      size.height * 0.4,
    );
    path3.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.3 : size.height * 0.35,
      0,
      size.height * 0.43,
    );
    path3.lineTo(0, size.height * 0.46);
    path3.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.33 : size.height * 0.36,
      size.width * 0.5,
      size.height * 0.4,
    );
    path3.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.53 : size.height * 0.55,
      size.width,
      size.height * 0.4,
    );

    canvas.drawPath(path, lapiz);
    canvas.drawPath(path2, lapiz2);
    canvas.drawPath(path3, lapiz3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}