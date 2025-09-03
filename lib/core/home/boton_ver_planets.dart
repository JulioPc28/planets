// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/core/home/container_decoracion.dart';
import 'package:tres_astronautas/presentation/planet_list_page.dart';

/* 
  Botón animado que redirige al listado de planetas.
  Aplica efectos visuales en hover y pulsación, y se adapta según el tipo de vista.
*/
class BotonVerPlanets extends StatefulWidget {
  final String tipeView;

  const BotonVerPlanets({
    super.key,
    this.tipeView = 'home',
  });

  @override
  State<BotonVerPlanets> createState() => _BotonVerPlanetsState();
}

class _BotonVerPlanetsState extends State<BotonVerPlanets>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  bool _isPressed = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();

    /* 
      Controlador de animación para el efecto de pulso.
      Se repite de forma reversible para simular respiración visual.
    */
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(seconds: 2),
      child: Column(
        children: [
          containerColorEnd(context),
          Container(
            width: double.infinity,
            color: _isHovered ? Colors.white : const Color(0xff000000),
            padding: EdgeInsets.symmetric(
              horizontal: widget.tipeView == 'lateral' ? 8.w : 28.w,
              vertical: 2.h,
            ),
            child: MouseRegion(
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() {
                _isHovered = false;
                _isPressed = false;
              }),
              child: GestureDetector(
                onTapDown: (_) => setState(() => _isPressed = true),
                onTapUp: (_) => setState(() => _isPressed = false),
                onTapCancel: () => setState(() => _isPressed = false),
          
                /* 
                  Navegación declarativa hacia la vista de listado de planetas.
                  Se usa pushNamed para mantener el stack de navegación.
                */
                onTap: () {
                  context.pushNamed(PlanetListPage.name);
                },
          
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    /* 
                      Escala dinámica para simular efecto de pulso.
                      Se reduce levemente al presionar.
                    */
                    final scale = _isPressed
                        ? 0.95
                        : 1 + (_pulseController.value * 0.1);
          
                    return Transform.scale(
                      scale: scale,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: kIsWeb ? 30 : 28,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: _isHovered ? Colors.black : Colors.white,
                          borderRadius: BorderRadius.circular(100),
                          boxShadow: [
                            BoxShadow(
                              color: _isHovered
                                  ? const Color(0xff000000).withOpacity(0.4)
                                  : Colors.black.withOpacity(0.6),
                              blurRadius: _isHovered ? 16 : 12,
                              spreadRadius: _isHovered ? 2 : 0,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Text(
                          'Ver Planetas',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: _isHovered
                                ? const Color(0xffffffff)
                                : const Color(0xff000000),
                            fontSize: 16.sp,
                            fontFamily: 'Georgia',
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}