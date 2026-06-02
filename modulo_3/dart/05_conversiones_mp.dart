void main() {
  // Conversiones numéricas
  int    teus    = 2500;
  double teusD   = teus.toDouble();   // 2500.0
  String texto   = teus.toString();   // "2500"

  // String → número
  int    calado1 = int.parse('12');         // 12
  double calado2 = double.parse('8.75');    // 8.75

  // Conversión segura (no lanza excepción)
  int?    loa1 = int.tryParse('abc');    // null
  double? loa2 = double.tryParse('185'); // 185.0

  // Verificar tipo con is (como en Kotlin)
  Object codigoBuque = 'IMO-9876543';
  if (codigoBuque is String) {
    print(codigoBuque.length);  // smart cast — ya es String
  }

  // Cast explícito con as
  Object obj  = 'MSC Beatrice';
  String buque = obj as String;

  // Comprobar nulabilidad
  String? terminal = null;
  int longitud = terminal?.length ?? 0;
  print(longitud);  // 0

  // Números especiales
  print(double.infinity);     // Infinity
  print(double.nan);          // NaN
  print(double.maxFinite);    // 1.7976931348623157e+308
}
