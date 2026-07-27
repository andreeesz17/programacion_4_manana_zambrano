// lib/main.dart
import 'package:flutter/material.dart';
import 'widgets/tarjeta_log.dart';
import 'widgets/fila_estado.dart';
import 'widgets/avatar_badge.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoración y espaciado                  │
// │  2  Paso 2  Column — TarjetaLog                                 │
// │  3  Paso 3  Row + Expanded + Spacer — FilaEstado                │
// │  4  Paso 4  Stack + Positioned — AvatarBadge                   │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
          body: ListView(
            children: [
              TarjetaLog(nivel: 'ERROR', componente: 'aduanas-service',
                  mensaje:   'Manifiesto inválido — carga retenida',
                  timestamp: DateTime.now()),
              TarjetaLog(nivel: 'WARN',  componente: 'terminal-sur',
                  mensaje:   'Muelles disponibles: 2 / 10',
                  timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
              TarjetaLog(nivel: 'INFO',  componente: 'logistica',
                  mensaje:   'Descarga de contenedores completada',
                  timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
              TarjetaLog(nivel: 'DEBUG', componente: 'sistema-radar',
                  mensaje:   'Escaneo de buque → 200 OK (38ms)',
                  timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
            ],
          ),
        ),
    3 => const Scaffold(
          body: Column(
            children: [
              FilaEstado(nombre: 'buque-carguero-01',   detalle: '10.0.0.5 · 45ms',          activo: true),
              Divider(height: 1),
              FilaEstado(nombre: 'remolcador-alfa',    detalle: '10.0.0.12 · 8ms',           activo: true),
              Divider(height: 1),
              FilaEstado(
                nombre: 'grua-goliath',
                detalle: '10.0.0.30 · sin respuesta',
                activo: false,
                message: 'Error de sobrepeso al intentar levantar carga',
              ),
              Divider(height: 1),
              FilaEstado(nombre: 'centro-control-puerto-principal',
                         detalle: '10.0.0.8 · 12ms', activo: true),
            ],
          ),
        ),
    4 => const Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AvatarBadge(nombre: 'muelle-01', alertas: 2,  activo: true),
                  SizedBox(width: 24),
                  AvatarBadge(nombre: 'muelle-02',  alertas: 0,  activo: true),
                  SizedBox(width: 24),
                  AvatarBadge(nombre: 'dique-seco', alertas: 0,  activo: false),
                  SizedBox(width: 24),
                  AvatarBadge(nombre: 'almacen',  alertas: 11, activo: true),
                ],
              ),
              SizedBox(height: 40),
              Divider(height: 1),
              FilaEstado(
                nombre: 'Sistema de Balizas',
                detalle: '10.4.3.2 · 4ms',
                activo: false,
                message: 'No responde a señales de posicionamiento GPS',
              ),
            ],
          ),
        ),
    5 => Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text('SizedBox', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Primer elemento'),
              const SizedBox(height: 32),
              const Text('Segundo elemento (después de 32px)'),
              const Divider(height: 32),
              const Text('Padding', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                color: Colors.indigo.shade50,
                child: const Padding(
                  padding: EdgeInsets.only(left: 24),
                  child:   Text('Texto con Padding izquierdo'),
                ),
              ),
              const Divider(height: 32),
              const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.settings, color: Colors.indigo),
              ),
              const Divider(height: 32),
              const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8, runSpacing: 8,
                children: ['Granel', 'Líquidos', 'Refrigerado', 'Contenedores', 'Aduanas', 'Inspección', 'Despachado']
                    .map((t) => Chip(label: Text(t)))
                    .toList(),
              ),
            ],
          ),
        ),
    _ => Scaffold(body: Center(child: Text('Paso $paso no definido'))),
  },
));

Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:   220,
      height:  80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(12),
        border:       Border.all(color: Colors.indigo, width: 1.5),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Muelle de Carga 01',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);
