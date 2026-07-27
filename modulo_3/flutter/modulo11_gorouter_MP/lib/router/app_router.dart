// lib/router/app_router.dart
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_dashboard.dart';
import '../screens/pantalla_muellees.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,  // imprime cada navegación en la consola
  routes: [
    GoRoute(
      path:    '/',
      name:    'inicio',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/muellees',
      name:    'muellees',
      builder: (context, state) => const PantallaMuelles(),
    ),
    GoRoute(
      path:    '/dashboard',
      builder: (context, state) => const PantallaCentroControl(),
    ),
  ],
);
