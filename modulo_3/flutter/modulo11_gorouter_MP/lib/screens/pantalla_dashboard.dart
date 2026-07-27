// lib/screens/pantalla_dashboard.dart
import 'package:flutter/material.dart';
import '../models/muelle_ssh.dart';

class PantallaCentroControl extends StatelessWidget {
  const PantallaCentroControl({super.key});

  @override
  Widget build(BuildContext context) {
    final totalMuelles = muelleesSimulados.length;
    final muelleesSsl = muelleesSimulados.where((s) => s.ssl).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Centro de Control'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Información General',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text('Total de Muelles: $totalMuelles'),
            const SizedBox(height: 8),
            Text('Muelles con SSL: $muelleesSsl'),
            const SizedBox(height: 24),
            const Text(
              'Lista de Muelles',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: muelleesSimulados.length,
                itemBuilder: (context, index) {
                  final s = muelleesSimulados[index];
                  return ListTile(
                    title: Text(s.nombre),
                    subtitle: Text('IP: ${s.ip}'),
                    trailing: Text(s.ssl ? 'SSL Activo' : 'Sin SSL'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
