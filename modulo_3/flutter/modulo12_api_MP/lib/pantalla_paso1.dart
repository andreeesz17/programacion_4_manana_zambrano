import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class PantallaPaso1 extends StatefulWidget {
  const PantallaPaso1({super.key});

  @override
  State<PantallaPaso1> createState() => _PantallaPaso1State();
}

class _PantallaPaso1State extends State<PantallaPaso1> {
  int _id = 1;

  Future<Map<String, dynamic>> _fetchCarga(int id) async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/cargas/$id'),
    );
    if (res.statusCode != 200) {
      throw Exception('Error al cargar la manifiesto (${res.statusCode})');
    }
    return jsonDecode(res.body) as Map<String, dynamic>;
  }

  void _nextCarga() {
    setState(() {
      _id++;
    });
  }

  void _prevCarga() {
    if (_id > 1) {
      setState(() {
        _id--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 1 · FutureBuilder crudo'),
        leading: BackButton(onPressed: () => context.go('/')),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _fetchCarga(_id),
          builder: (context, snap) {
            // Estado 1: esperando respuesta
            if (snap.connectionState != ConnectionState.done) {
              return const CircularProgressIndicator();
            }
            // Estado 2: error de red
            if (snap.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.wifi_off, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  Text('Error: ${snap.error}',
                      style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => setState(() {}),
                    child: const Text('Reintentar'),
                  ),
                ],
              );
            }
            // Estado 3: datos disponibles
            final carga = snap.data!;
            final isCompleted = carga['completed'] as bool;
            return Padding(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        isCompleted ? Icons.task_alt : Icons.hourglass_empty,
                        size: 64,
                        color: isCompleted ? Colors.green : Colors.orange,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Manifiesto ID: ${carga['id']}',
                        style: const TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        carga['title'] as String,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Chip(
                        label: Text(
                          isCompleted ? 'Despachada ✓' : 'En puerto',
                          style: TextStyle(
                            color: isCompleted ? Colors.green.shade800 : Colors.orange.shade800,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: isCompleted
                            ? Colors.green[100]
                            : Colors.orange[100],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _id > 1 ? _prevCarga : null,
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Anterior'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade50,
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: _nextCarga,
                            icon: const Icon(Icons.arrow_forward),
                            label: const Text('Siguiente'),
                            iconAlignment: IconAlignment.end,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade50,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
