import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'todo_dto.dart';

class PantallaPaso2 extends StatelessWidget {
  const PantallaPaso2({super.key});

  Future<List<TodoDto>> _fetchTodos() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=15'),
    );
    if (res.statusCode != 200) {
      throw Exception('Error al cargar la lista (${res.statusCode})');
    }
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => TodoDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO simple'),
        leading: BackButton(onPressed: () => context.go('/')),
        backgroundColor: Colors.green.shade100,
      ),
      body: FutureBuilder<List<TodoDto>>(
        future: _fetchTodos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 8),
                  Text('Error: ${snap.error}'),
                ],
              ),
            );
          }

          final todos = snap.data!;
          final pendientes = todos.where((t) => t.pendiente).toList();
          final completadasCount = todos.where((t) => t.completed).length;
          final pendientesCount = pendientes.length;
          final largasCount = todos.where((t) => t.title.length > 30).length;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Resumen con chips
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Chip(
                        label: Text('$completadasCount completadas'),
                        backgroundColor: Colors.green[100],
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text('$pendientesCount pendientes'),
                        backgroundColor: Colors.orange[100],
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 8),
                      Chip(
                        label: Text('$largasCount títulos largos (>30)'),
                        backgroundColor: Colors.purple[100],
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              // Sección: Tareas pendientes (Mini-ejercicio 2)
              if (pendientes.isNotEmpty) ...[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Text(
                    'Tareas pendientes:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.orange),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: pendientes.length,
                    itemBuilder: (context, idx) {
                      final t = pendientes[idx];
                      return Container(
                        width: 160,
                        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        child: Card(
                          color: Colors.orange.shade50,
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'ID: ${t.id}',
                                  style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Expanded(
                                  child: Text(
                                    t.title,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Divider(),
              ],

              // Lista completa de todos
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Text(
                  'Todas las tareas:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, i) {
                    final t = todos[i];
                    return CheckboxListTile(
                      title: Text(
                        t.title,
                        style: TextStyle(
                          decoration: t.completed ? TextDecoration.lineThrough : null,
                          color: t.completed ? Colors.grey : null,
                        ),
                      ),
                      subtitle: Text('ID: ${t.id}'),
                      value: t.completed,
                      onChanged: null, // solo lectura por ahora
                      activeColor: Colors.green,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
