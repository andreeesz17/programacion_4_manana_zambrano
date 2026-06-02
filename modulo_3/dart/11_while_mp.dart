void main() {
  // while — comprueba la condición ANTES de ejecutar
  int lotes     = 0;
  int capacidad = 1024;  // toneladas disponibles en bodega

  while (capacidad > 0) {
    final tamano = capacidad > 256 ? 256 : capacidad;
    lotes++;
    capacidad -= tamano;
    print('Lote $lotes: $tamano ton embarcadas (restante en bodega: $capacidad ton)');
  }

  // do-while — ejecuta AL MENOS UNA VEZ antes de comprobar
  int intentos             = 0;
  bool comunicacionEstablecida = false;

  do {
    intentos++;
    print('Intento de comunicación con capitanía #$intentos...');
    // Simular que conecta en el 3er intento
    if (intentos == 3) comunicacionEstablecida = true;
  } while (!comunicacionEstablecida && intentos < 5);

  print(comunicacionEstablecida
      ? 'Comunicación establecida tras $intentos intentos'
      : 'No se pudo establecer comunicación');
}

void main() {

  int embarques = 15;

  while (embarques > 0) {
    print('Embarque procesado. Pendientes en muelle: $embarques');
    embarques--;
  }

  print('Muelle despejado — todos los embarques procesados');

  int verificaciones = 0;
  bool acceso        = false;

  do {
    verificaciones++;
    print('Verificando credenciales de operador... Intento #$verificaciones');

    if (verificaciones == 2) {
      acceso = true;
    }

  } while (!acceso && verificaciones < 3);

  print(acceso
      ? 'Acceso concedido al área portuaria'
      : 'Acceso denegado — credenciales inválidas');
}
