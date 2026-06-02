void main() {
  // var — tipo inferido (como val en Kotlin)
  var operador = 'Carlos';        // String
  var anosServicio = 12;          // int
  var tarifaMuelle = 1850.75;     // double
  var activo = true;              // bool

  // Tipo explícito
  String naviera   = 'Maersk Line';
  int    capacidad = 5000;          // TEUs
  double eslora    = 3.14159;
  bool   habilitado = false;

  // final — no se puede reasignar (como val en Kotlin)
  final puerto = 'Buenaventura';
  // puerto = 'Cartagena';  // ERROR — final no se puede reasignar

  // const — constante en tiempo de compilación (como const en Kotlin)
  const gravedadMar = 9.8;
  const pi2         = 3.14159;

  // Diferencia clave: final vs const
  final fechaAtraque = DateTime.now();   // OK — se evalúa en runtime
  // const fechaAtraque = DateTime.now(); // ERROR — DateTime.now() no es constante de compilación

  print('$operador $naviera tiene $anosServicio años de servicio en $puerto');

  // var — mutable, tipo inferido
var contenedores = 0;
contenedores = 1;          // OK

// final — inmutable referencia, evaluado en runtime
final manifiesto = [1, 2, 3];
manifiesto.add(4);          // OK — la referencia es final, no el contenido
// manifiesto = [5, 6];     // ERROR — no se puede reasignar la referencia

// const — inmutable profundo, evaluado en compilación
const tiposEmbarque = ['seco', 'liquido'];
// tiposEmbarque.add('refrigerado'); // ERROR — lista const es completamente inmutable
}
