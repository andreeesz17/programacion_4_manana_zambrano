// abstract class define el contrato — QUÉ puede hacer cualquier ZonaPortuaria
abstract class ZonaPortuaria {
  String get nombre;
  double calcularArea();     // cada zona lo implementa a su manera
  double calcularPerimetro();

  // Método concreto construido sobre la abstracción
  void describir() {
    print('$nombre — área: ${calcularArea().toStringAsFixed(2)} m², '
          'perímetro: ${calcularPerimetro().toStringAsFixed(2)} m');
  }
}

// Implementaciones concretas — el CÓMO es específico de cada clase
class PatioContenedores extends ZonaPortuaria {
  final double radio;
  PatioContenedores(this.radio);

  @override String get nombre => 'Patio de Contenedores (r=$radio m)';
  @override double calcularArea()      => 3.1416 * radio * radio;
  @override double calcularPerimetro() => 2 * 3.1416 * radio;
}

class MuelleGeneral extends ZonaPortuaria {
  final double ancho, largo;
  MuelleGeneral(this.ancho, this.largo);

  @override String get nombre => 'Muelle General (${ancho}x$largo m)';
  @override double calcularArea()      => ancho * largo;
  @override double calcularPerimetro() => 2 * (ancho + largo);
}

void main() {
  final zonas = <ZonaPortuaria>[PatioContenedores(50), MuelleGeneral(120, 35)];
  for (final z in zonas) {
    z.describir();  // no importa qué tipo de ZonaPortuaria es
  }
}
