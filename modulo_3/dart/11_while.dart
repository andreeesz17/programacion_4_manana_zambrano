void main() {
  // while — comprueba la condición ANTES de ejecutar
  int paquetes = 0;
  int buffer   = 1024;  // bytes disponibles

  while (buffer > 0) {
    final tamano = buffer > 256 ? 256 : buffer;
    paquetes++;
    buffer -= tamano;
    print('Paquete $paquetes: $tamano bytes (restante: $buffer)');
  }

  // do-while — ejecuta AL MENOS UNA VEZ antes de comprobar
  int reintentos = 0;
  bool conexionEstablecida = false;

  do {
    reintentos++;
    print('Intento de conexión #$reintentos...');
    // Simular que conecta en el 3er intento
    if (reintentos == 3) conexionEstablecida = true;
  } while (!conexionEstablecida && reintentos < 5);

  print(conexionEstablecida
      ? 'Conectado tras $reintentos intentos'
      : 'No se pudo conectar');
}

void main() {

  int productos = 15;

  while (productos > 0) {
    print('Producto vendido. Stock restante: $productos');
    productos--;
  }

  print('Stock agotado');

  int intentos = 0;
  bool acceso = false;

  do {
    intentos++;
    print('Verificando contraseña... Intento #$intentos');

    if (intentos == 2) {
      acceso = true;
    }

  } while (!acceso && intentos < 3);

  print(acceso
      ? 'Acceso concedido'
      : 'Acceso denegado');
}