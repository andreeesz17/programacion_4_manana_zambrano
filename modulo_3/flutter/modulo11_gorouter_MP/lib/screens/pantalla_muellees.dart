// lib/screens/pantalla_muellees.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/muelle_ssh.dart';

class PantallaMuelles extends StatelessWidget {
  const PantallaMuelles({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final muellees = muelleesSimulados;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Muelles'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount: muellees.length,
        itemBuilder: (context, i) {
          final s = muellees[i];
          return ListTile(
            leading: const Icon(Icons.dns),
            title: Text(s.nombre),
            onTap: () {
              // Navegar con extras — pasa el objeto completo evitando una segunda búsqueda
              context.push(
                '/muellees/${s.id}',
                extra: s, // MuelleSSH completo
              );
            },
          );
        },
      ),
    );
  }
}
