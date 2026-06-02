// Reusamos la jerarquía de ZonaPortuaria
abstract class InstalacionPortuaria {
  String get nombre;
  double calcularArea();
}

class Muelle extends InstalacionPortuaria {
  final double lado;
  Muelle(this.lado);
  @override String get nombre => 'Muelle';
  @override double calcularArea() => lado * lado;
}

class AlmacenPortuario extends InstalacionPortuaria {
  final double base, altura;
  AlmacenPortuario(this.base, this.altura);
  @override String get nombre => 'Almacén Portuario';
  @override double calcularArea() => (base * altura) / 2;
}

class PatioContendores extends InstalacionPortuaria {
  final double radio;
  PatioContendores(this.radio);
  @override String get nombre => 'Patio de Contenedores';
  @override double calcularArea() => 3.1416 * radio * radio;
}

// POLIMORFISMO: una sola función trabaja con cualquier InstalacionPortuaria
void imprimirArea(InstalacionPortuaria instalacion) {
  print('${instalacion.nombre}: ${instalacion.calcularArea().toStringAsFixed(2)} m²');
}

void main() {
  final instalaciones = <InstalacionPortuaria>[
    Muelle(80),
    AlmacenPortuario(120, 60),
    PatioContendores(150),
  ];

  // Misma llamada — comportamiento diferente según el tipo real
  for (final i in instalaciones) {
    imprimirArea(i);
  }

  // Instalación con mayor área — POLIMORFISMO con reduce
  final mayor = instalaciones.reduce((a, b) => a.calcularArea() > b.calcularArea() ? a : b);
  print('\nInstalación más grande: ${mayor.nombre}');
}
