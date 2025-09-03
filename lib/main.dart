import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sizer/sizer.dart';
import 'package:tres_astronautas/router/router.dart';

void main() {
  runApp(
    const ProviderScope(child: Planets()),
  );
}

class Planets extends ConsumerWidget {
  const Planets({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider); // Aquí usamos Riverpod

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Planets',
          routerConfig: router, 
       // theme: ThemeData.dark(),

        );
      },
    );
  }
}
