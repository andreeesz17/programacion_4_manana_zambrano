// lib/router/app_router_paso4.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_dashboard.dart';
import '../screens/pantalla_muellees.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_metricas.dart';
import '../screens/pantalla_ajustes.dart';
import '../models/muelle_ssh.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/dashboard',
  debugLogDiagnostics: true,
  routes: [
    // ShellRoute — mantiene ScaffoldConNav vivo entre rutas hijas
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/dashboard',
          builder: (context, state) => const PantallaCentroControl(),
        ),
        GoRoute(
          path:    '/muellees',
          builder: (context, state) => const PantallaMuelles(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id       = state.pathParameters['id']!;
                final muelle = state.extra as MuelleSSH?;
                return PantallaDetalle(id: id, muelle: muelle);
              },
            ),
            GoRoute(
              path:    ':id/logs',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return Scaffold(
                  appBar: AppBar(title: Text('Logs de $id')),
                  body:   Center(child: Text('Logs del muelle $id')),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/metricas',
          builder: (context, state) => const PantallaMetricas(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (context, state) => const PantallaOperaciones(),
        ),
      ],
    ),
  ],
);
