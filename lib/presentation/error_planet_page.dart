import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/core/home/boton_ver_planetas_appbar.dart';
import 'package:tres_astronautas/presentation/home_page.dart';

/* 
  Página de error genérica.
  Se muestra cuando ocurre una navegación inválida o no se encuentra el planeta solicitado.
*/
class ErrorPage extends StatelessWidget {
  static const String name = 'errorPage';
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 
              Mensaje informativo para el usuario.
              Indica que la ruta no es válida o que no se encontraron datos.
            */
            const Text('Ruta no válida o planeta no encontrado'),

            /* 
              Botón que redirige al usuario al listado de planetas.
              Se utiliza `goNamed` para reemplazar la ruta actual en el stack.
            */
             SizedBox(height: 5.h,),
             BotonVerPlanetsAppbar(
                  title: 'Volver al listado',
                  colorText: const Color(0xffffffff),
                  size: 16.sp,
                  onPressed: () {
                    context.pushNamed(HomePage.name);
                  },  
                ),
           
          ],
        ),
      ),
    );
  }
}