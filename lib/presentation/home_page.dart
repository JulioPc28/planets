import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:tres_astronautas/presentation/home/home_web.dart';
import 'package:tres_astronautas/presentation/home/home_mobile.dart';  

class HomePage extends StatelessWidget {
  static const String name = '/';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Detectar si es web
    if (kIsWeb) {
      return buildWebLayout(context);
    } 
    // Detectar si es Android 
    else if (Theme.of(context).platform == TargetPlatform.android) {
      return buildMobileLayout(context);
    } 
     else if (Theme.of(context).platform == TargetPlatform.iOS) {
      return buildMobileLayout(context);
    } 
    // Otras plataformas (iOS, Windows, etc.)
    else {
      return _buildOtherLayout(context);
    }
  }





  Widget _buildOtherLayout(BuildContext context) {
    // Aquí puedes definir un layout para otras plataformas, si lo deseas
    return const Scaffold(
      body: Center(
        child: Text('Plataforma no soportada'),
      ),
    );
  }
}