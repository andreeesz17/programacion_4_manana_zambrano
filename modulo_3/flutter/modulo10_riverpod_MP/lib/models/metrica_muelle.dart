// lib/models/metrica_muelle.dart
class MetricaMuelle {
  final String muelle;
  final double cpu;
  final double ram;
  final int conexiones;
  final double ssd;

  const MetricaMuelle({
    required this.muelle,
    required this.cpu,
    required this.ram,
    required this.conexiones,
    required this.ssd,
  });
}
