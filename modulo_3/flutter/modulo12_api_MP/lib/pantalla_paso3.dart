import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'buque.dart';
import 'buque_dto.dart';

class PantallaPaso3 extends StatelessWidget {
  const PantallaPaso3({super.key});

  Future<List<Buque>> _fetchBuques() async {
    final res = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/products?limit=20&offset=0'),
    );
    if (res.statusCode != 200) {
      throw Exception('Error al cargar buques (${res.statusCode})');
    }
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => BuqueDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 3 · API real'),
        leading: BackButton(onPressed: () => context.go('/')),
        backgroundColor: Colors.orange.shade100,
      ),
      body: FutureBuilder<List<Buque>>(
        future: _fetchBuques(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  Text('Error: ${snap.error}'),
                ],
              ),
            );
          }

          // Filtra para mostrar solo los buques activos (Mini-ejercicio 3)
          final cargasBuques = snap.data!;
          final buquesActivos = cargasBuques.where((p) => p.activo).toList();

          if (buquesActivos.isEmpty) {
            return const Center(
              child: Text('No hay buques activos disponibles.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: buquesActivos.length,
            itemBuilder: (context, i) {
              final p = buquesActivos[i];
              return Card(
                elevation: 2,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: p.activo ? Colors.green[100] : Colors.grey[200],
                    child: Text(
                      p.id.toString(),
                      style: TextStyle(
                        color: p.activo ? Colors.green[800] : Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  title: Text(
                    p.nombre,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(p.tipo ?? 'Sin categoría'),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (p.caro) ...[
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            const SizedBox(width: 4),
                          ],
                          Text(
                            '\$${p.tonelaje.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: p.caro ? Colors.orange.shade800 : Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        p.activo ? 'Activo' : 'Inactivo',
                        style: TextStyle(
                          color: p.activo ? Colors.green : Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
