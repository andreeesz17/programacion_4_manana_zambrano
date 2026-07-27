// lib/router/app_router_paso5.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';
import '../screens/scaffold_con_nav.dart';
import '../screens/pantalla_dashboard.dart';
import '../screens/pantalla_servidores.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_metricas.dart';
import '../screens/pantalla_ajustes.dart';
import '../screens/pantalla_login.dart';
import '../models/servidor_ssh.dart';

// Función que crea el router con acceso al WidgetRef (para el guard)
GoRouter appRouterPaso5(WidgetRef ref) => GoRouter(
  initialLocation: '/dashboard',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    final authState     = ref.read(authProvider);
    final autenticado   = authState is Autenticado;
    final enLogin       = state.matchedLocation == '/login';

    // No autenticado y no está en /login → ir al login
    if (!autenticado && !enLogin) return '/login';
    // Autenticado y está en /login → ir a la app
    if (autenticado && enLogin)   return '/dashboard';
    // Sin redirección
    return null;
  },
  routes: [
    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/dashboard',
          builder: (context, state) => const PantallaDashboard(),
        ),
        GoRoute(
          path:    '/servidores',
          builder: (context, state) => const PantallaServidores(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) => PantallaDetalle(
                id:       state.pathParameters['id']!,
                servidor: state.extra as ServidorSSH?,
              ),
            ),
            GoRoute(
              path:    ':id/logs',
              builder: (context, state) {
                final id = state.pathParameters['id']!;
                return Scaffold(
                  appBar: AppBar(title: Text('Logs de $id')),
                  body:   Center(child: Text('Logs del servidor $id')),
                );
              },
            ),
          ],
        ),
        GoRoute(path: '/metricas', builder: (context, state) => const PantallaMetricas()),
        GoRoute(path: '/ajustes',  builder: (context, state) => const PantallaAjustes()),
      ],
    ),
    GoRoute(
      path:    '/login',
      builder: (context, state) => const PantallaLogin(),
    ),
  ],
);
