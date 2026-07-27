// lib/models/muelle_ssh.dart
class MuelleSSH {
  final String id;
  final String nombre;
  final String ip;
  final int    puerto;
  final bool   ssl;
  bool         favorito;

  MuelleSSH({
    required this.id,
    required this.nombre,
    required this.ip,
    required this.puerto,
    required this.ssl,
    this.favorito = false,
  });
}