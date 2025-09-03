// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tres_astronautas/core/text.dart';

/* 
  Botón interactivo para la AppBar que muestra texto personalizado.
  Aplica efectos visuales en hover, incluyendo cambio de color, borde y sombra.
*/
class BotonVerPlanetsAppbar extends StatefulWidget {
  final String title;
  final Color colorText;
  final double size;
  final VoidCallback? onPressed;

  const BotonVerPlanetsAppbar({
    required this.title,
    required this.colorText,
    required this.size,
    this.onPressed,
    super.key,
  });

  @override
  State<BotonVerPlanetsAppbar> createState() => _BotonVerPlanetsAppbarState();
}

class _BotonVerPlanetsAppbarState extends State<BotonVerPlanetsAppbar> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: _isHovered
                ? const Color(0xffffffff)
                : const Color(0xff000000).withOpacity(0.8),
            border: Border.all(
              color: _isHovered
                  ? Colors.transparent /* sin borde en hover */
                  : const Color(0xffffffff), /* borde visible cuando no hay hover */
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.4),
                offset: const Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextPlanet(
                title: widget.title,
                colorText: _isHovered
                    ? const Color(0xff000000).withOpacity(0.8)
                    : widget.colorText,
                dimen: widget.size,
                onPressed: widget.onPressed,
                sombra: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}