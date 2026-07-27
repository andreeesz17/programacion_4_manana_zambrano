import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'pantalla_paso1.dart';
import 'pantalla_paso2.dart';
import 'pantalla_paso3.dart';
import 'pantalla_paso4.dart';
import 'pantalla_paso5.dart';

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/',      builder: (context, state) => const PantallaMenu()),
    GoRoute(path: '/paso1', builder: (context, state) => const PantallaPaso1()),
    GoRoute(path: '/paso2', builder: (context, state) => const PantallaPaso2()),
    GoRoute(path: '/paso3', builder: (context, state) => const PantallaPaso3()),
    GoRoute(path: '/paso4', builder: (context, state) => const PantallaPaso4()),
    GoRoute(path: '/paso5', builder: (context, state) => const PantallaPaso5()),
  ],
);

void main() => runApp(const ProviderScope(child: AppHttp()));

class AppHttp extends StatelessWidget {
  const AppHttp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      useMaterial3: true,
    ),
  );
}

// ── Menú principal ─────────────────────────────────────────────────────────────
class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    const pasos = [
      _PasoInfo(
        ruta: '/paso1',
        titulo: 'Terminal 1',
        subtitulo: 'Conexión a Satélite',
        detalle: 'Ping Portuario · Manifiestos Crudos',
        icono: Icons.network_ping,
        color: Colors.blue,
      ),
      _PasoInfo(
        ruta: '/paso2',
        titulo: 'Terminal 2',
        subtitulo: 'Estructuración de Manifiestos',
        detalle: 'Parseo CargaDto · Listado General',
        icono: Icons.data_object,
        color: Colors.green,
      ),
      _PasoInfo(
        ruta: '/paso3',
        titulo: 'Terminal 3',
        subtitulo: 'Registro Oficial de Buques',
        detalle: 'Mapeo a BuqueDomain · Base Portuaria',
        icono: Icons.shopping_bag,
        color: Colors.orange,
      ),
      _PasoInfo(
        ruta: '/paso4',
        titulo: 'Terminal 4',
        subtitulo: 'Gestión de Siniestros',
        detalle: 'Manejo Seguro de Incidentes',
        icono: Icons.error_outline,
        color: Colors.red,
      ),
      _PasoInfo(
        ruta: '/paso5',
        titulo: 'Terminal 5',
        subtitulo: 'Despliegue de Control Completo',
        detalle: 'Arquitectura Riverpod · Estado del Puerto',
        icono: Icons.architecture,
        color: Colors.purple,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Control Portuario — API'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pasos.length,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, i) {
          final p = pasos[i];
          return Card(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                backgroundColor: p.color,
                radius: 24,
                child: Icon(p.icono, color: Colors.white),
              ),
              title: Text(
                '${p.titulo} · ${p.subtitulo}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  p.detalle,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.go(p.ruta),
            ),
          );
        },
      ),
    );
  }
}

class _PasoInfo {
  final String ruta;
  final String titulo;
  final String subtitulo;
  final String detalle;
  final IconData icono;
  final Color color;
  const _PasoInfo({
    required this.ruta,
    required this.titulo,
    required this.subtitulo,
    required this.detalle,
    required this.icono,
    required this.color,
  });
}
