// lib/router/app_router_paso2.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_dashboard.dart';
import '../screens/pantalla_muellees.dart';
import '../screens/pantalla_detalle.dart';
import '../models/muelle_ssh.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/dashboard',
      builder: (context, state) => const PantallaCentroControl(),
    ),
    GoRoute(
      path:    '/muellees',
      builder: (context, state) => const PantallaMuelles(),
      routes: [
        // Ruta hija: /muellees/:id
        GoRoute(
          path:    ':id',   // relativa — ruta completa: /muellees/:id
          builder: (context, state) {
            final id       = state.pathParameters['id']!;
            final muelle = state.extra as MuelleSSH?;
            return PantallaDetalle(id: id, muelle: muelle);
          },
        ),
        // Ruta hija: /muellees/:id/logs
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
  ],
);
