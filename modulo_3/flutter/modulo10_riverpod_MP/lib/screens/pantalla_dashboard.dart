// lib/screens/pantalla_dashboard.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'pantalla_muellees.dart';
import 'pantalla_metricas.dart';

final indiceTabProvider = StateProvider<int>((ref) => 0);

class PantallaCentroControl extends ConsumerWidget {
  const PantallaCentroControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(indiceTabProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const PantallaMuelles(),
        1 => const PantallaMetricas(),
        _ => const PantallaMuelles(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex:         indice,
        onDestinationSelected: (i) =>
            ref.read(indiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dns_outlined),
            selectedIcon: Icon(Icons.dns),
            label:        'Muelles',
          ),
          NavigationDestination(
            icon:         Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label:        'Métricas',
          ),
        ],
      ),
    );
  }
}
