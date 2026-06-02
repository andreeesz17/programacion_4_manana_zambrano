void main() {
  final precios = [29.99, 49.50, 15.00, 99.99];

  // map devuelve un Iterable con cada elemento transformado
  final preciosConIva = precios.map((p) => p * 1.15);
  print(preciosConIva.toList());
  // [34.4885, 56.925, 17.25, 114.9885]

  // map sobre Strings
  final endpoints = ['/usuarios', '/productos', '/pedidos'];
  final urls = endpoints.map((e) => 'https://api.ejemplo.com$e');
  print(urls.toList());
  // [https://api.ejemplo.com/usuarios, ...]
}

void main() {
  final temperaturas = [36.1, 37.8, 39.2, 36.5, 38.7, 35.9];

  final conFiebre = temperaturas.where((t) => t > 37.5);
  print(conFiebre.toList());  // [37.8, 39.2, 38.7]

  final normales = temperaturas.where((t) => t >= 36.0 && t <= 37.5);
  print(normales.toList());   // [36.1, 36.5]
}                