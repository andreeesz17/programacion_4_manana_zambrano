// lib/router/app_router_paso3.dart
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_dashboard.dart';
import '../screens/pantalla_muellees_filtro.dart';
import '../screens/pantalla_detalle.dart';
import '../models/muelle_ssh.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
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
      builder: (context, state) {
        // Query parameters — /muellees?soloSSL=true
        final soloSSL = state.uri.queryParameters['soloSSL'] == 'true';
        return PantallaMuellesFiltro(soloSSL: soloSSL);
      },
    ),
    GoRoute(
      path:    '/muellees/:id',
      builder: (context, state) {
        final id       = state.pathParameters['id']!;
        final muelle = state.extra as MuelleSSH?;
        return PantallaDetalle(id: id, muelle: muelle);
      },
    ),
  ],
);
