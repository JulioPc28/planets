import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tres_astronautas/data/planet.dart';

/* 
  Repositorio encargado de consumir la API de planetas.
  Centraliza la lógica de acceso remoto para mantener el código desacoplado de la capa de presentación.
*/
class PlanetRepository {
  final String _baseUrl = 'https://us-central1-a-academia-espacial.cloudfunctions.net/planets';

  /* 
    Obtiene la lista completa de planetas desde el endpoint base.
    Retorna una lista de objetos Planet construidos a partir del JSON recibido.
  */
  Future<List<Planet>> fetchPlanets() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List planets = data['data'];
      return planets.map((p) => Planet.fromJson(p)).toList();
    } else {
      /* 
        En caso de error HTTP, lanza una excepción con el código recibido.
        Esto permite manejar el fallo desde la capa que consume el repositorio.
      */
      throw Exception('Error al cargar planetas: ${response.statusCode}');
    }
  }

  /* 
    Obtiene los datos de un planeta específico usando su identificador.
    El parámetro `id` se codifica para asegurar compatibilidad en la URL.
    Si la respuesta es válida y contiene datos, retorna un objeto Planet.
    Si no se encuentra el planeta o hay error, retorna null.
  */
  Future<Planet?> getPlanetById(String id) async {
    final encodedId = Uri.encodeComponent(id);
    final response = await http.get(Uri.parse('$_baseUrl/$encodedId'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final planetData = jsonData['data'];

      if (planetData != null) {
        return Planet.fromJson(planetData);
      }
    }

    return null;
  }
}