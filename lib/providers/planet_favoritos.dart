import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final favoritePlanetsProvider = StateNotifierProvider<FavoriteNotifier, Set<String>>((ref) {
  return FavoriteNotifier();
});

class FavoriteNotifier extends StateNotifier<Set<String>> {
  FavoriteNotifier() : super({}) {
    _loadFavorites();
  }

  // Carga los favoritos desde SharedPreferences al iniciar
  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList('favorite_planets') ?? [];
    state = stored.toSet();
  }

  // Agrega o elimina un planeta y actualiza SharedPreferences
  Future<void> toggleFavorite(String planetId) async {
    final prefs = await SharedPreferences.getInstance();
    final updated = {...state};

    if (updated.contains(planetId)) {
      updated.remove(planetId);
    } else {
      updated.add(planetId);
    }

    state = updated;
    await prefs.setStringList('favorite_planets', updated.toList());
  }
}