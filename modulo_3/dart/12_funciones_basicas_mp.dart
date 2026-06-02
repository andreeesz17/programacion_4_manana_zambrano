// Sintaxis completa — preferida para funciones públicas
int calcularTotalTeus(int teusCargados, int teusDescargados) {
  return teusCargados + teusDescargados;
}

// Sintaxis de flecha — cuando el cuerpo es una sola expresión
int calcularFleteBruto(int toneladas, int tarifaPorTon) => toneladas * tarifaPorTon;

// void — cuando no se devuelve nada
void imprimirSeparador(String titulo) {
  print('─── $titulo ───');
}

void main() {
  print(calcularTotalTeus(5, 3));          // 8
  print(calcularFleteBruto(4, 6));         // 24
  imprimirSeparador('Manifiesto de Carga'); // ─── Manifiesto de Carga ───
}


// Dart puede inferir el tipo de retorno, pero es buena práctica declararlo
// explícitamente en funciones públicas para mejorar la legibilidad.

// Con tipo explícito — recomendado
String formatearTarifa(double tarifa) => '\$${tarifa.toStringAsFixed(2)}';

// Sin tipo — Dart infiere que retorna String
formatearTarifaSinTipo(double tarifa) => '\$${tarifa.toStringAsFixed(2)}';

void main() {
  print(formatearTarifa(1299.9));  // $1299.90
}


// El tercer parámetro es opcional — puede omitirse al llamar
String construirManifiesto(String buque, String ruta, [int? numeroVuelta]) {
  if (numeroVuelta != null) {
    return 'Manifiesto: $buque — Ruta: $ruta — Vuelta: $numeroVuelta';
  }
  return 'Manifiesto: $buque — Ruta: $ruta';
}

// Con valor por defecto — evita el chequeo de null
String construirManifiestoV2(String buque, String ruta, [int vuelta = 1]) {
  return 'Manifiesto v2: $buque — Ruta: $ruta — Vuelta: $vuelta';
}

void main() {
  print(construirManifiesto('MSC Beatrice', 'Cartagena-Rotterdam'));          // Manifiesto: MSC Beatrice — Ruta: Cartagena-Rotterdam
  print(construirManifiesto('MSC Beatrice', 'Cartagena-Rotterdam', 3));      // Manifiesto: MSC Beatrice — Ruta: Cartagena-Rotterdam — Vuelta: 3
  print(construirManifiestoV2('Maersk Sealand', 'Buenaventura-Shanghai'));  // Manifiesto v2: Maersk Sealand — Ruta: Buenaventura-Shanghai — Vuelta: 1
}
