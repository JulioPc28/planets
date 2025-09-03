import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tres_astronautas/data/planet.dart';
import 'package:tres_astronautas/data/planet_repository.dart';

/* Provider que expone la lista de planetas obtenida desde la API.
 Se utiliza un FutureProvider porque la fuente de datos es asincrónica.
Este provider puede ser consumido directamente en la UI para mostrar estados de carga, éxito o error. */

final planetListProvider = FutureProvider<List<Planet>>((ref) async {
  final repository = PlanetRepository();
  return await repository.fetchPlanets();
});