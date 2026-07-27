// lib/screens/pantalla_ajustes.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/auth_provider.dart';

class PantallaOperaciones extends ConsumerWidget {
  const PantallaOperaciones({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.settings, size: 56),
            const SizedBox(height: 8),
            const Text('Operaciones de la app', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            if (authState is Autenticado) ...[
              Text('Capitán: ${authState.capitan}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
            ],
            FilledButton.icon(
              onPressed: () => ref.read(authProvider.notifier).logout(),
              icon: const Icon(Icons.logout),
              label: const Text('Cerrar sesión'),
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
                foregroundColor: Theme.of(context).colorScheme.onError,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
