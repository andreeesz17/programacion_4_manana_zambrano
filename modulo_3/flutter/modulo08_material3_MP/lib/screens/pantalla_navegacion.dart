// lib/screens/pantalla_navegacion.dart
import 'package:flutter/material.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │ Prueba esto                                                      │
// │ - Navega entre las 4 pestañas — observa el indicador animado     │
// │   bajo el ícono activo                                           │
// │ - Vuelve a Centro de Control y navega a Muelles: el Centro de Control         │
// │   mantiene su posición de scroll gracias a IndexedStack          │
// │ - Toca una alerta CRÍTICA y una de AVISO — observa cómo el color │
// │   de la tarjeta varía automáticamente con cs.errorContainer       │
// │   vs cs.tertiaryContainer                                        │
// │ - Cambia indicatorColor: cs.primaryContainer a                   │
// │   cs.tertiaryContainer — el indicador cambia de color             │
// └──────────────────────────────────────────────────────────────────┘

class PantallaNavegacion extends StatefulWidget {
  const PantallaNavegacion({super.key});

  @override
  State<PantallaNavegacion> createState() => _PantallaNavegacionState();
}

class _PantallaNavegacionState extends State<PantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Control de Tráfico Marítimo'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaCentroControl(),
          _PantallaMuelles(),
          _PantallaAlertas(),
          _PantallaOperaciones(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.tertiaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label:        'Centro de Control',
          ),
          NavigationDestination(
            icon:         Icon(Icons.dns_outlined),
            selectedIcon: Icon(Icons.dns),
            label:        'Muelles',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('3'), child: Icon(Icons.notifications_outlined)),
            selectedIcon: Badge(label: Text('3'), child: Icon(Icons.notifications)),
            label:        'Alertas',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Operaciones',
          ),
        ],
      ),
    );
  }
}

// ─── Pantallas de cada pestaña ────────────────────────────────────────────

class _PantallaCentroControl extends StatelessWidget {
  const _PantallaCentroControl();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen', style: text.headlineSmall),
        const SizedBox(height: 16),
        // Tarjetas de métricas
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Muelles', valor: '8',  icono: Icons.dns,          color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Alertas',    valor: '3',  icono: Icons.notifications, color: cs.errorContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Flujo',   valor: '99.8%', icono: Icons.trending_up, color: cs.tertiaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Carga',  valor: '4.2 kTEU', icono: Icons.waves,       color: cs.secondaryContainer)),
        ]),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _TarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaMuelles extends StatelessWidget {
  const _PantallaMuelles();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: 6,
      itemBuilder: (ctx, i) => Card(
        child: ListTile(
          leading:  Icon(Icons.directions_boat, color: cs.primary),
          title:    Text('Buque Carguero 0${i + 1}'),
          subtitle: Text('Calado 15m · Autorizado'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          onTap: () {},
        ),
      ),
    );
  }
}

class _PantallaAlertas extends StatelessWidget {
  const _PantallaAlertas();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const alertas = [
      (muelle: 'Buque DB-01',  mensaje: 'Carga excedida',         nivel: 'CRÍTICO'),
      (muelle: 'Buque WB-03', mensaje: 'Retraso en Aduana',      nivel: 'AVISO'),
      (muelle: 'Buque AP-02', mensaje: 'Inspección de Seguridad', nivel: 'CRÍTICO'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: alertas.length,
      itemBuilder: (ctx, i) {
        final alerta = alertas[i];
        final esCritico = alerta.nivel == 'CRÍTICO';

        return Card(
          color: esCritico ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(
              esCritico ? Icons.error : Icons.warning,
              color: esCritico ? cs.onErrorContainer : cs.onTertiaryContainer,
            ),
            title: Text(alerta.muelle,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(alerta.mensaje),
            trailing: Chip(
              label: Text(alerta.nivel, style: const TextStyle(fontSize: 11)),
              backgroundColor: esCritico ? cs.error : cs.tertiary,
              labelStyle: TextStyle(
                color: esCritico ? cs.onError : cs.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PantallaOperaciones extends StatelessWidget {
  const _PantallaOperaciones();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title:   Text('Notificaciones'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.security_outlined),
          title:   Text('Seguridad Portuaria'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title:   Text('Capitanía'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
