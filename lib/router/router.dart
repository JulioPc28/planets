import 'package:go_router/go_router.dart';
import 'package:tres_astronautas/data/planet.dart';
import 'package:tres_astronautas/presentation/error_planet_page.dart';
import 'package:tres_astronautas/presentation/home_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tres_astronautas/presentation/planet_list_detail_page.dart';
import 'package:tres_astronautas/presentation/planet_list_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: HomePage.name,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: PlanetListPage.name,
        path: '/planetList',
        builder: (context, state) => const PlanetListPage(),
      ),
      GoRoute(
        name: PlanetDetailPage.name,
        path: '/planetDetail',
        builder: (context, state) {
          // Se espera que el objeto Planet se pase como argumento vía `extra`
          final planet = state.extra as Planet?;
          if (planet == null) return const ErrorPage();
          return PlanetDetailPage(planet: planet);
        },
      ),
      GoRoute(
        name: ErrorPage.name,
        path: '/errorPage',
        builder: (context, state) => const ErrorPage(),
      ),
    ],
  );
});