void main() {
  // Lambda asignada a una variable
  final calcularVolumenContenedor = (int n) => n * n;
  print(calcularVolumenContenedor(7));  // 49

  // Lambda de cuerpo completo
  final calcularDescuentoFlete = (double tarifa, double pct) {
    final descuento = tarifa * (pct / 100);
    return tarifa - descuento;
  };
  print(calcularDescuentoFlete(100.0, 15.0));  // 85.0

  // Lambda en línea — pasada directamente como argumento
  final calados = [3.1, 4.1, 8.4, 1.1, 5.5, 9.9, 2.2, 6.6];
  calados.sort((a, b) => b.compareTo(a));  // orden descendente
  print(calados);  // [9.9, 6.6, 5.5, 4.1, 3.1, 2.2, 1.1, 1.1]
}
