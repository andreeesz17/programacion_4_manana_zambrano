// lib/screens/pantalla_muellees.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo10_riverpod_mp/models/muelle_ssh.dart';
import '../providers/muellees_provider.dart';

class PantallaMuelles extends ConsumerWidget {
  const PantallaMuelles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final muellees = ref.watch(muelleesProvider);
    final cs         = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Muelles (${muellees.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: muellees.isEmpty
          ? const Center(child: Text('Sin muellees'))
          : ListView.separated(
              itemCount:        muellees.length,
              separatorBuilder: (context, index) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = muellees[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.ssl
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.dns,
                        color: s.ssl ? Colors.green : Colors.grey),
                  ),
                  title:    Text(s.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${s.ip}:${s.puerto}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.favorito ? Icons.star : Icons.star_border,
                          color: s.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(muelleesProvider.notifier)
                            .toggleFavorito(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(muelleesProvider.notifier)
                            .eliminar(s.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(muelleesProvider.notifier).agregar(
            MuelleSSH(
              id:     id,
              nombre: 'nuevo-srv-$id',
              ip:     '192.168.0.${muellees.length + 1}',
              puerto: 22,
              ssl:    true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}