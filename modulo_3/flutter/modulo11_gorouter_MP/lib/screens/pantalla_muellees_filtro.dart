// lib/screens/pantalla_muellees_filtro.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/muelle_ssh.dart';

class PantallaMuellesFiltro extends StatelessWidget {
  final bool soloSSL;
  const PantallaMuellesFiltro({super.key, this.soloSSL = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloSSL
        ? muelleesSimulados.where((s) => s.ssl).toList()
        : muelleesSimulados;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Muelles${soloSSL ? ' (SSL)' : ''}'),
        actions: [
          // Toggle filtro SSL — cambia la URL con query param
          IconButton(
            icon:    Icon(soloSSL ? Icons.lock : Icons.lock_open),
            tooltip: soloSSL ? 'Ver cargas' : 'Solo SSL',
            onPressed: () => soloSSL
                ? context.go('/muellees')
                : context.go('/muellees?soloSSL=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final s = filtrados[i];
          return ListTile(
            leading: Icon(Icons.dns, color: s.ssl ? Colors.green : Colors.grey),
            title:   Text(s.nombre),
            subtitle: Text(s.ip),
            onTap: () => context.push(
              '/muellees/${s.id}',
              extra: s,   // pasa el objeto completo
            ),
          );
        },
      ),
    );
  }
}
