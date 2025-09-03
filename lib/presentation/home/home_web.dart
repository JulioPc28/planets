import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tres_astronautas/core/appbar.dart';
import 'package:tres_astronautas/core/home/boton_ver_planets.dart';
import 'package:tres_astronautas/core/home/container_decoracion.dart';
import 'package:tres_astronautas/core/home/footer_colores.dart';
import 'package:tres_astronautas/core/home/header_colores.dart';
import 'package:tres_astronautas/core/home/image_planet.dart';


Widget buildWebLayout(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: appBarHomeWeb(context, 'Bienvenido a Planets', 'Home'),
    body: SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        containerColorStar(context),                        
                        HeaderDobleCurvaMejorada(),
                        FadeIn(
                           duration: const Duration(seconds: 1),
                           child: imageAndTitle(context, 25, 20),
                         ),
                     
                        FooterDobleCurvaMejorada()
                      ],
                    ),

                    /* 
                      Botón que se muestra solo en pantallas menores a 600px.
                      Se ubica al final de la página sin dejar espacio adicional debajo.
                    */
                    MediaQuery.of(context).size.width < 600
                        ? BotonVerPlanets()
                        : const SizedBox(),
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