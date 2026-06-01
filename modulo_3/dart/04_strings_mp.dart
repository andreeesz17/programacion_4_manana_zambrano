void main() {
  final nombreBuque = 'MSC Beatrice';
  final eslora      = 366;

  // Interpolación con $ (igual que en Kotlin)
  print('Buque: $nombreBuque');                    // Buque: MSC Beatrice

  // Expresión con ${ }
  print('${nombreBuque.toUpperCase()} tiene ${eslora + 4} metros de eslora total');

  // String multilinea con triple comillas
  final ficha = '''
Buque:  $nombreBuque
Eslora: $eslora m
Mayor de clase:  ${eslora >= 300 ? 'Sí' : 'No'}
  ''';
  print(ficha);

  // Raw string — ignora el escape y la interpolación
  final ruta = r'C:\Puertos\Manifiesto\Embarque';  // el \ no se interpreta
  print(ruta);

  // Concatenación (menos idiomático — preferir interpolación)
  final saludo = 'Bienvenido al puerto, ' + nombreBuque + '!';

  // Métodos útiles de String
  print('maersk'.toUpperCase());                    // MAERSK
  print('  Terminal Norte  '.trim());               // Terminal Norte
  print('Contenedor'.contains('edor'));             // true
  print('Atraque'.replaceAll('a', 'A'));            // AtrAque
  print('MSCU,MAEU,HLCU'.split(','));               // [MSCU, MAEU, HLCU]
  print('Buenaventura'.substring(0, 5));            // Buena
  print('Puerto'.startsWith('Pue'));                // true
  print('IMO'.padLeft(7, '0'));                     // 0000IMO
}
