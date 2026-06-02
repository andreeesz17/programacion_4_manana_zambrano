int calcularFlete(int toneladas)   => toneladas * 2;
int calcularRecargo(int toneladas) => toneladas * 3;

void main() {
  // La variable 'operacionFlete' tiene tipo: int Function(int)
  int Function(int) operacionFlete;

  operacionFlete = calcularFlete;
  print(operacionFlete(5));     // 10

  operacionFlete = calcularRecargo;
  print(operacionFlete(5));     // 15

  // Lista de funciones
  final tarifas = <int Function(int)>[calcularFlete, calcularRecargo];
  for (final fn in tarifas) {
    print(fn(10));         // 20, luego 30
  }
}
