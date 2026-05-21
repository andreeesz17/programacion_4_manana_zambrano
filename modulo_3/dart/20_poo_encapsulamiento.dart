class CuentaBancaria {
  final String titular;
  double _saldo;  // privado — nadie lo modifica directamente

  CuentaBancaria(this.titular, double saldoInicial)
      : _saldo = saldoInicial;

  // Getter — lectura permitida, escritura no
  double get saldo => _saldo;

  // Los únicos caminos para modificar _saldo
  void depositar(double monto) {
    if (monto <= 0) throw ArgumentError('El monto debe ser positivo');
    _saldo += monto;
    print('Depósito de \$$monto. Nuevo saldo: \$$_saldo');
  }

  void retirar(double monto) {
    if (monto <= 0)      throw ArgumentError('El monto debe ser positivo');
    if (monto > _saldo)  throw StateError('Saldo insuficiente');
    _saldo -= monto;
    print('Retiro de \$$monto. Nuevo saldo: \$$_saldo');
  }
}

void main() {
  final cuenta = CuentaBancaria('Ana López', 500.0);

  cuenta.depositar(200.0);  // Depósito de $200.0. Nuevo saldo: $700.0
  cuenta.retirar(150.0);    // Retiro de $150.0.  Nuevo saldo: $550.0
  print(cuenta.saldo);      // 550.0

  // cuenta._saldo = 999999;  // ERROR — privado, Dart no lo permite
}

class ServidorMetricas {
  // ENCAPSULAMIENTO: datos privados — nadie puede modificarlos directamente
  final String _hostname;
  double _cargaCpu     = 0.0;
  double _usoRamGb     = 0.0;
  int    _solicitudes  = 0;
  final  _historialCpu = <double>[];

  ServidorMetricas(this._hostname);

  // Getters — acceso de lectura controlado
  String get hostname    => _hostname;
  double get cargaCpu    => _cargaCpu;
  double get usoRamGb    => _usoRamGb;
  int    get solicitudes => _solicitudes;

  // Propiedad calculada — abstracción sobre los datos internos
  double get promedioCpu =>
      _historialCpu.isEmpty
          ? 0
          : _historialCpu.reduce((a, b) => a + b) / _historialCpu.length;

  bool get estaSaturado => _cargaCpu > 90 || _usoRamGb > 28;

  // Setter con validación — ENCAPSULAMIENTO en acción
  set cargaCpu(double valor) {
    if (valor < 0 || valor > 100) {
      throw RangeError('CPU debe estar entre 0 y 100: $valor');
    }
    _cargaCpu = valor;
    _historialCpu.add(valor);
    // Solo guardamos los últimos 60 valores
    if (_historialCpu.length > 60) _historialCpu.removeAt(0);
  }

  set usoRamGb(double valor) {
    if (valor < 0) throw ArgumentError('RAM no puede ser negativa');
    _usoRamGb = valor;
  }

  // Método controlado — la única forma de incrementar solicitudes
  void registrarSolicitud() => _solicitudes++;

  void resetearContador() {
    _solicitudes = 0;
    print('$_hostname: contador reseteado');
  }

  @override
  String toString() =>
      '$_hostname | CPU: ${_cargaCpu.toStringAsFixed(1)}% '
      'RAM: ${_usoRamGb.toStringAsFixed(1)}GB '
      'Req: $_solicitudes';
}

void main() {
  final servidor = ServidorMetricas('prod-api-01');

  // Solo podemos modificar el estado a través de los métodos
  servidor.cargaCpu  = 72.5;
  servidor.usoRamGb  = 18.3;
  servidor.registrarSolicitud();
  servidor.registrarSolicitud();
  servidor.registrarSolicitud();

  print(servidor);
  print('Promedio CPU: ${servidor.promedioCpu.toStringAsFixed(1)}%');
  print('Saturado: ${servidor.estaSaturado}');

  try {
    servidor.cargaCpu = 150;  // lanza RangeError
  } catch (e) {
    print('Error capturado: $e');
  }
}