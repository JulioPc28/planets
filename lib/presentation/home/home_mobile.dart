import 'package:flutter/material.dart';
import 'package:tres_astronautas/core/appbar.dart';
import 'package:tres_astronautas/core/home/boton_ver_planets.dart';
import 'package:tres_astronautas/core/home/container_decoracion.dart';
import 'package:tres_astronautas/core/home/footer_colores.dart';
import 'package:tres_astronautas/core/home/header_colores.dart';
import 'package:tres_astronautas/core/home/image_planet.dart';


Widget buildMobileLayout(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: appBarHomeMobile(context, 'Bienvenido a Planets', 'Home',),
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        containerColorStar(context),
                        HeaderDobleCurvaMejorada(),
                        imageAndTitle(context, 20, 20),
                        FooterDobleCurvaMejorada()
                      ],
                    ),

                    /* 
                      Botón ubicado al final de la pantalla.
                      No deja espacio adicional debajo y se adapta al alto disponible.
                    */
                    
                    BotonVerPlanets(tipeView: 'list'),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}