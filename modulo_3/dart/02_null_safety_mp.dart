void main() {
  // Tipo no-nullable — NUNCA puede ser null
  String matricula = 'IMO-9876543';
  // matricula = null;       // ERROR de compilación

  // Tipo nullable — puede ser null (añadir ?)
  String? naviera = null;   // OK
  naviera = 'Mediterranean Shipping Company';       // OK

  // Operadores de null safety
  String? terminal;

  // ?. — safe call (igual que en Kotlin)
  print(terminal?.length);      // null — no lanza excepción

  // ?? — operador Elvis (igual que ?: en Kotlin)
  String resultado = terminal ?? 'Sin terminal asignada';
  print(resultado);           // Sin terminal asignada

  // ! — non-null assertion (igual que !! en Kotlin) — úsalo con precaución
  String terminalSegura = terminal!;  // lanza si terminal es null

  // Null check con if
  if (naviera != null) {
    print(naviera.length);   // smart cast — ya es String aquí
  }

  // late — inicialización diferida (como lateinit en Kotlin)
  late String codigoAtraque;
  codigoAtraque = 'ATR-2024-001';           // debe asignarse antes de usar
  print(codigoAtraque);
}
