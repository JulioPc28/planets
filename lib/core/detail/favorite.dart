

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/data/planet.dart';
import 'package:tres_astronautas/providers/planet_favoritos.dart';

/// Icono de favoritos para usar en el AppBar.
/// Cambia dinámicamente según si el planeta está marcado como favorito.
class FavoritePlanetIcon extends ConsumerWidget {
  final Planet planet;

  const FavoritePlanetIcon({required this.planet, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritePlanetsProvider);
    final isFavorite = favorites.contains(planet.name);

    return IconButton(
      icon: Icon(isFavorite ? Icons.star : Icons.star_border,
      size: 25.sp,
      ),
      onPressed: () {
        ref.read(favoritePlanetsProvider.notifier).toggleFavorite(planet.name);
      },
    );
  }
}