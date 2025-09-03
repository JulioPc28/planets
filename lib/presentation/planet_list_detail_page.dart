import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/core/appbar.dart';
import 'package:tres_astronautas/data/planet.dart';

class PlanetDetailPage extends ConsumerWidget {
  static const String name = 'planetDetail';
  final Planet planet;

  const PlanetDetailPage({required this.planet, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isWide = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: appBarHomeDetail(context, planet.name, 'Detail', planet),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: const Color(0xff000000),
          child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Imagen + descripción en layout responsivo
                isWide
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _planetImage(context),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              planet.description,
                              style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          _planetImage(context),
                          SizedBox(height: 2.h),
                          Text(
                            planet.description,
                            style: TextStyle(fontSize: 14.sp, color: Colors.white70),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                SizedBox(height: 3.h),

                // Características físicas
                Text('Características físicas',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                const Divider(color: Colors.white30),
                _buildInfoRow('Masa', planet.mass),
                _buildInfoRow('Volumen (km³)', planet.volume),
                _buildInfoRow('Densidad (g/cm³)', planet.density),
                _buildInfoRow('Radio ecuatorial (km)', planet.equatorialRadius),

                SizedBox(height: 2.h),

                // Órbita y movimiento
                Text('Órbita y movimiento',
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: Colors.white)),
                const Divider(color: Colors.white30),
                _buildInfoRow('Distancia orbital (km)', planet.orbitalDistance),
                _buildInfoRow('Velocidad orbital (km/h)', planet.orbitalSpeed),
                _buildInfoRow('Duración del día (días)', planet.dayLength),
                _buildInfoRow('Duración del año (días)', planet.yearLength),
                _buildInfoRow('Gravedad superficial (m/s²)', planet.gravity),
                _buildInfoRow('Velocidad de escape (km/h)', planet.escapeVelocity),
                _buildInfoRow('Atmósfera', planet.atmosphere),
                _buildInfoRow('Lunas', planet.moons),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Imagen del planeta con tamaño fijo y placeholder controlado
  Widget _planetImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        width: kIsWeb ? 25.w : 50.w,
        height: kIsWeb ? 35.h : 25.h,
        child: Image.network(
          planet.image,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset(
              'assets/images/planet_placeholder.png',
              fit: BoxFit.cover,
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  /// Fila de información con estilo uniforme
  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.8.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp, color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              value.toString(),
              textAlign: TextAlign.right,
              style: TextStyle(fontSize: 13.sp, color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}