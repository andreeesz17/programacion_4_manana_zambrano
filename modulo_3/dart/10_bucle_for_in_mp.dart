void main() {
  final rutasMaritimas = ['Pacífico Norte', 'Atlántico Sur', 'Mediterráneo', 'Canal de Suez', 'Estrecho de Malaca'];

  // for-in — la forma idiomática para recorrer listas
  for (final ruta in rutasMaritimas) {
    print(ruta);
  }

  // forEach con lambda — alternativa funcional
  rutasMaritimas.forEach((r) => print(r.toLowerCase()));

  // for-in sobre un Map
  final puertosMaritimos = {'Buenaventura': 80, 'Cartagena': 443, 'Barranquilla': 22, 'Santa Marta': 21};
  for (final entrada in puertosMaritimos.entries) {
    print('${entrada.key} → código ${entrada.value}');
  }

  // for-in sobre caracteres de un String
  for (final caracter in 'Dart') {
    print(caracter);
  }
}
