class Embarcacion {
  // 1. Propiedades
  final String imo;
  final String nombre;
  String       muelleAsignado;
  bool         _atracado = false;  // _ indica uso interno

  // 2. Constructor nombrado con parámetros nombrados
  Embarcacion({
    required this.imo,
    required this.nombre,
    required this.muelleAsignado,
  });

  // 3. Getter — propiedad derivada, solo lectura
  bool   get atracado => _atracado;
  String get estado   => _atracado ? 'en muelle' : 'en tránsito';

  // 4. Setter — escritura controlada
  set estadoAtraque(bool valor) {
    _atracado = valor;
    print('$nombre: ${valor ? "atracado en puerto" : "zarpando del muelle"}');
  }

  // 5. Métodos
  void atracar() {
    _atracado = true;
    print('$nombre atracado en $muelleAsignado');
  }

  void zarpar() {
    _atracado = false;
    print('$nombre zarpa del muelle $muelleAsignado');
  }

  String resumen() => 'IMO: $imo | Buque: $nombre | Muelle: $muelleAsignado | Estado: $estado';

  // 6. toString
  @override
  String toString() => 'Embarcacion($nombre, $muelleAsignado, $estado)';
}

void main() {
  // Crear una instancia
  final buque = Embarcacion(
    imo:            'IMO-9876543',
    nombre:         'MSC Beatrice',
    muelleAsignado: 'Muelle-7',
  );

  // Usar sus métodos y propiedades
  buque.atracar();
  print(buque.estado);        // en muelle
  print(buque.resumen());
  print(buque);               // llama toString() automáticamente

  buque.estadoAtraque = false; // usa el setter
  print(buque.atracado);      // false
}
