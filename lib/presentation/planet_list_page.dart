// ignore_for_file: sort_child_properties_last

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/core/appbar.dart';
import 'package:tres_astronautas/presentation/planet_list_detail_page.dart';
import 'package:tres_astronautas/providers/planets_provider.dart';
import 'package:go_router/go_router.dart';

/// Página que muestra el listado de planetas con opción de búsqueda.
/// Utiliza Riverpod para consumir datos asincrónicos desde planetListProvider.
class PlanetListPage extends ConsumerStatefulWidget {
  static const String name = 'planetList';
  const PlanetListPage({super.key});

  @override
  ConsumerState<PlanetListPage> createState() => _PlanetListPageState();
}

class _PlanetListPageState extends ConsumerState<PlanetListPage> {
  String filter = ''; // Filtro de búsqueda ingresado por el usuario

  @override
  Widget build(BuildContext context) {
    final planetAsync = ref.watch(planetListProvider); // Observa el estado del provider

    return Scaffold(
      appBar: appBarHomeMobile(context, 'Planetas', 'List', ),
      body: Column(
        children: [
          cajaBusqueda(), // Campo de búsqueda
          Expanded(
            child: planetAsync.when(
              data: (planets) {
                // Filtra los planetas según el texto ingresado
                final filtered = planets.where((p) {
                  final nameMatch = p.name.toLowerCase().contains(filter);
                  final massMatch = p.mass.toLowerCase().contains(filter);
                  final atmosphereMatch = p.atmosphere.toLowerCase().contains(filter);
                  final moonsMatch = p.moons.toString().contains(filter);
                  final speedMatch = p.orbitalSpeed.toString().contains(filter);
                  return nameMatch || massMatch || atmosphereMatch || moonsMatch || speedMatch;
                }).toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text('No se encontraron planetas.'));
                }

                // Lista de planetas filtrados con diseño personalizado
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final planet = filtered[index];

                    return Card(
                      color: const Color(0xff000000), // Fondo negro
                      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Encabezado con imagen y nombre
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 4.h,
                                  backgroundImage: NetworkImage(planet.image),
                                  onBackgroundImageError: (_, __) =>
                                      const AssetImage('assets/images/planet_placeholder.png'),
                                ),
                                SizedBox(width: 3.w),
                                Expanded(
                                  child: Text(
                                    planet.name,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),

                            // Campos adicionales
                            Text('Masa: ${planet.mass}', style: _infoStyle()),
                            Text('Atmósfera: ${planet.atmosphere}', style: _infoStyle()),
                            Text('Gravedad: ${planet.gravity} m/s²', style: _infoStyle()),

                            SizedBox(height: 1.h),

                            // Botón para ver más detalles
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  context.pushNamed(
                                    PlanetDetailPage.name,
                                    extra: planet,
                                  );
                                },
                                child: const Text('Ver detalles'),
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error al cargar planetas: $e')),
            ),
          ),
        ],
      ),
    );
  }

  /// Widget que contiene el campo de búsqueda con estilo responsivo.
  Container cajaBusqueda() {
    final width = MediaQuery.of(context).size.width * (kIsWeb ? 0.8 : 0.9);

    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffa9a9a9)),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: TextField(
          decoration: const InputDecoration(
            labelText: 'Filtrar',
          ),
          onChanged: (value) => setState(() => filter = value.toLowerCase()),
        ),
      ),
    );
  }

  /// Estilo de texto para los campos informativos dentro de cada tarjeta.
  TextStyle _infoStyle() {
    return TextStyle(
      fontSize: 14.sp,
      color: Colors.white70,
    );
  }
}