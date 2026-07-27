// lib/screens/scaffold_con_nav.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldConNav extends StatelessWidget {
  final Widget child;
  const ScaffoldConNav({super.key, required this.child});

  // Detecta la ruta activa para resaltar la tab correcta
  int _indiceActivo(BuildContext context) {
    final loc = GoRouterState.of(context).uri.path;
    if (loc.startsWith('/servidores')) return 1;
    if (loc.startsWith('/metricas'))   return 2;
    if (loc.startsWith('/ajustes'))    return 3;
    return 0; // /dashboard
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,    // child cambia, el Scaffold NO se reconstruye
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indiceActivo(context),
        onDestinationSelected: (i) {
          switch (i) {
            case 0: context.go('/dashboard');
            case 1: context.go('/servidores');
            case 2: context.go('/metricas');
            case 3: context.go('/ajustes');
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.dns_outlined), selectedIcon: Icon(Icons.dns),
            label: 'Servidores',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined), selectedIcon: Icon(Icons.bar_chart),
            label: 'Métricas',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined), selectedIcon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}
