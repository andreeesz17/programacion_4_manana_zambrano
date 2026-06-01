void main() {
  // Forma básica
  double calado = 14.2; // metros

  if (calado > 13.5) {
    print('Sobrecalado — restricción de acceso al muelle');
  } else if (calado > 10.0) {
    print('Calado operativo — acceso autorizado');
  } else {
    print('Calado bajo — verificar lastre');
  }

  // Operador ternario — para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String estadoAcceso = calado > 13.5 ? 'Acceso restringido' : 'Acceso autorizado';
  print(estadoAcceso);

  // null-aware con ternario
  String? terminal;
  String display = terminal != null ? terminal.toUpperCase() : 'Sin terminal asignada';

  // Forma más concisa con ??
  String display2 = terminal?.toUpperCase() ?? 'Sin terminal asignada';
  print(display2);  // Sin terminal asignada
}

void main() {
  String? codigoBuque;

  // Sin verificar — error de compilación
  // print(codigoBuque.length);  // ERROR: codigoBuque puede ser null

  // Forma 1 — verificación explícita
  if (codigoBuque != null) {
    print(codigoBuque.length);  // aquí Dart sabe que codigoBuque es String
  }

  // Forma 2 — operador ?.
  print(codigoBuque?.length);  // null, sin excepción

  // Forma 3 — valor por defecto
  int longitud = codigoBuque?.length ?? 0;
  print(longitud);  // 0
}
