import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'api_error.dart';
import 'buque.dart';
import 'buque_dto.dart';

class PantallaPaso4 extends StatelessWidget {
  const PantallaPaso4({super.key});

  Future<Result<List<Buque>>> _fetchBuques() async {
    try {
      final res = await http
          .get(Uri.parse('https://api.escuelajs.co/api/v1/products?limit=20'))
          .timeout(const Duration(seconds: 10));

      if (res.statusCode == 404) {
        return const Failure(NoEncontrado());
      }

      if (res.statusCode != 200) {
        return Failure(MuelleError(res.statusCode));
      }

      final lista = jsonDecode(res.body) as List<dynamic>;
      final buques = lista
          .map((e) => BuqueDto.fromJson(e as Map<String, dynamic>).toDomain())
          .toList();
      return Success(buques);
    } on SocketException {
      return const Failure(SinConexion());
    } on Exception catch (e) {
      return Failure(FormatoError(e.toString()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 4 · Errores tipados'),
        leading: BackButton(onPressed: () => context.go('/')),
        backgroundColor: Colors.red.shade100,
      ),
      body: FutureBuilder<Result<List<Buque>>>(
        future: _fetchBuques(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return switch (snap.data) {
            null                    => const Center(child: Text('Sin datos')),
            Success(:final data)    => _buildLista(data),
            Failure(:final error)   => _buildError(error),
          };
        },
      ),
    );
  }

  Widget _buildLista(List<Buque> buques) => ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: buques.length,
    itemBuilder: (context, i) {
      final p = buques[i];
      return Card(
        child: ListTile(
          title: Text(p.nombre),
          subtitle: Text(p.tipo ?? 'Sin categoría'),
          trailing: Text(
            '\$${p.tonelaje.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    },
  );

  Widget _buildError(ApiError error) {
    // Switch exhaustivo — el compilador avisa si falta un caso (Mini-ejercicio 4)
    final (icono, color) = switch (error) {
      SinConexion()    => (Icons.wifi_off,   Colors.red),
      Timeout()        => (Icons.timer_off,  Colors.orange),
      MuelleError()  => (Icons.cloud_off,  Colors.purple),
      FormatoError()   => (Icons.data_array, Colors.brown),
      NoEncontrado()   => (Icons.search_off, Colors.teal),
    };

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icono, size: 64, color: color),
            const SizedBox(height: 16),
            Text(
              error.mensaje,
              style: TextStyle(
                  fontSize: 18, color: color, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'El botón reintentar necesita estado — llega en el Paso 5.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
