// ignore_for_file: sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class HeaderDobleCurvaMejorada extends StatelessWidget {
  const HeaderDobleCurvaMejorada({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDobleCurvaMejorada(),
      ),
    );
  }
}




/* 
  CustomPainter que dibuja un encabezado con doble curva y capas superpuestas.
  Utiliza gradientes y tres trazos para generar profundidad visual.
*/
class _HeaderDobleCurvaMejorada extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    /* Área base para aplicar el gradiente */
    final Rect rect = Rect.fromCircle(
      center: Offset(0.0, 185.0),
      radius: 180,
    );

    /* Gradiente vertical en tonos oscuros con opacidades progresivas */
    final Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff000000),
        Color(0xff000000).withOpacity(0.9),
        Color(0xff000000).withOpacity(0.5),
        Color(0xff000000).withOpacity(0.3),
        Color(0xff000000).withOpacity(0.1),
      ],
    );

    /* Pinceles para cada capa */
    final lapiz = Paint()..shader = gradiente.createShader(rect);
    final lapiz2 = Paint();
    final lapiz3 = Paint();

    /* Configuración de estilos y colores */
    lapiz.color = Color(0xff077cbf);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 10;

    lapiz2.color = Color(0xffFFF95E);
    lapiz2.style = PaintingStyle.fill;
    lapiz2.strokeWidth = 10;

    lapiz3.color = Color(0xffBA2DA3);
    lapiz3.style = PaintingStyle.fill;
    lapiz3.strokeWidth = 3;

    /* Primer curva base */
    final path = Path();
    path.lineTo(0, size.height * 0.6);
    path.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.7 : size.height * 0.65,
      size.width * 0.5,
      size.height * 0.6,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.5 : size.height * 0.55,
      size.width,
      size.height * 0.6,
    );
    path.lineTo(size.width, 0);

    /* Segunda curva intermedia */
    final path2 = Path();
    path2.moveTo(0, size.height * 0.6);
    path2.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.7 : size.height * 0.65,
      size.width * 0.5,
      size.height * 0.6,
    );
    path2.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.5 : size.height * 0.55,
      size.width,
      size.height * 0.6,
    );
    path2.lineTo(size.width, size.height * 0.63);
    path2.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.53 : size.height * 0.56,
      size.width * 0.5,
      size.height * 0.6,
    );
    path2.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.7 : size.height * 0.65,
      0,
      size.height * 0.6,
    );

    /* Tercera curva superior */
    final path3 = Path();
    path3.moveTo(0, size.height * 0.6);
    path3.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.7 : size.height * 0.65,
      size.width * 0.5,
      size.height * 0.6,
    );
    path3.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.53 : size.height * 0.55,
      size.width,
      size.height * 0.63,
    );
    path3.lineTo(size.width, size.height * 0.66);
    path3.quadraticBezierTo(
      size.width * 0.75,
      kIsWeb ? size.height * 0.56 : size.height * 0.56,
      size.width * 0.5,
      size.height * 0.6,
    );
    path3.quadraticBezierTo(
      size.width * 0.25,
      kIsWeb ? size.height * 0.7 : size.height * 0.65,
      0,
      size.height * 0.6,
    );

    /* Renderizado de las tres capas en orden */
    canvas.drawPath(path, lapiz);
    canvas.drawPath(path2, lapiz2);
    canvas.drawPath(path3, lapiz3);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
