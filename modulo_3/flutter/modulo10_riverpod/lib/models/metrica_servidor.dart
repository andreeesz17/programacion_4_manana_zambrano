// lib/models/metrica_servidor.dart
class MetricaServidor {
  final String servidor;
  final double cpu;
  final double ram;
  final int conexiones;
  final double ssd;

  const MetricaServidor({
    required this.servidor,
    required this.cpu,
    required this.ram,
    required this.conexiones,
    required this.ssd,
  });
}
