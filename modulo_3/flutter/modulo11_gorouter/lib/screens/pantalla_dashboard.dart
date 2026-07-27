// lib/screens/pantalla_dashboard.dart
import 'package:flutter/material.dart';
import '../models/servidor_ssh.dart';

class PantallaDashboard extends StatelessWidget {
  const PantallaDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final totalServidores = servidoresSimulados.length;
    final servidoresSsl = servidoresSimulados.where((s) => s.ssl).length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
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
            Text('Total de Servidores: $totalServidores'),
            const SizedBox(height: 8),
            Text('Servidores con SSL: $servidoresSsl'),
            const SizedBox(height: 24),
            const Text(
              'Lista de Servidores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: servidoresSimulados.length,
                itemBuilder: (context, index) {
                  final s = servidoresSimulados[index];
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
