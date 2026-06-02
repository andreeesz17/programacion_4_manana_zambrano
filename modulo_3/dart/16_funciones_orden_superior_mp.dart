void main() {
  final tarifasMuelle = [1850.00, 3200.50, 975.00, 5499.99];

  // map devuelve un Iterable con cada elemento transformado
  final tarifasConRecargo = tarifasMuelle.map((t) => t * 1.15);
  print(tarifasConRecargo.toList());
  // [2127.5, 3680.575, 1121.25, 6324.9885]

  // map sobre Strings
  final rutasMaritimas = ['/manifiesto', '/contenedores', '/embarques'];
  final urls = rutasMaritimas.map((r) => 'https://api.puertomar.com$r');
  print(urls.toList());
  // [https://api.puertomar.com/manifiesto, ...]
}

void main() {
  final caladosBuques = [8.1, 12.8, 15.2, 9.5, 13.7, 7.9];

  final sobrecalado = caladosBuques.where((c) => c > 12.5);
  print(sobrecalado.toList());  // [12.8, 15.2, 13.7]

  final caladoNormal = caladosBuques.where((c) => c >= 8.0 && c <= 12.5);
  print(caladoNormal.toList());   // [8.1, 9.5]
}
