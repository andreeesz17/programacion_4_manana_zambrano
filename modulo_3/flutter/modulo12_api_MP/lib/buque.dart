class Buque {
  final int     id;
  final String  nombre;
  final double  tonelaje;
  final bool    activo;
  final String? tipo;

  const Buque({
    required this.id,
    required this.nombre,
    required this.tonelaje,
    required this.activo,
    this.tipo,
  });

  bool get caro => tonelaje > 500;
}
