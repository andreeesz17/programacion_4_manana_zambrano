class ManifiestoEmbarque {
  final String naviera;
  double _cargaToneladas;  // privado — nadie lo modifica directamente

  ManifiestoEmbarque(this.naviera, double cargaInicial)
      : _cargaToneladas = cargaInicial;

  // Getter — lectura permitida, escritura no
  double get cargaToneladas => _cargaToneladas;

  // Los únicos caminos para modificar _cargaToneladas
  void cargarEmbarque(double toneladas) {
    if (toneladas <= 0) throw ArgumentError('El peso debe ser positivo');
    _cargaToneladas += toneladas;
    print('Carga de ${toneladas}t añadida al manifiesto. Total: ${_cargaToneladas}t');
  }

  void descargarEmbarque(double toneladas) {
    if (toneladas <= 0)              throw ArgumentError('El peso debe ser positivo');
    if (toneladas > _cargaToneladas) throw StateError('Carga insuficiente en manifiesto');
    _cargaToneladas -= toneladas;
    print('Descarga de ${toneladas}t registrada. Restante: ${_cargaToneladas}t');
  }
}

void main() {
  final manifiesto = ManifiestoEmbarque('Maersk Line', 500.0);

  manifiesto.cargarEmbarque(200.0);    // Carga de 200.0t añadida al manifiesto. Total: 700.0t
  manifiesto.descargarEmbarque(150.0); // Descarga de 150.0t registrada. Restante: 550.0t
  print(manifiesto.cargaToneladas);    // 550.0

  // manifiesto._cargaToneladas = 999999;  // ERROR — privado, Dart no lo permite
}

class GruaPortuaria {
  // ENCAPSULAMIENTO: datos privados — nadie puede modificarlos directamente
  final String _codigoGrua;
  double _cargaActualTon  = 0.0;
  double _usoCombustibleL = 0.0;
  int    _ciclosOperacion = 0;
  final  _historialCarga  = <double>[];

  GruaPortuaria(this._codigoGrua);

  // Getters — acceso de lectura controlado
  String get codigoGrua        => _codigoGrua;
  double get cargaActualTon    => _cargaActualTon;
  double get usoCombustibleL   => _usoCombustibleL;
  int    get ciclosOperacion   => _ciclosOperacion;

  // Propiedad calculada — abstracción sobre los datos internos
  double get promedioCarga =>
      _historialCarga.isEmpty
          ? 0
          : _historialCarga.reduce((a, b) => a + b) / _historialCarga.length;

  bool get estaSaturada => _cargaActualTon > 45 || _usoCombustibleL > 280;

  // Setter con validación — ENCAPSULAMIENTO en acción
  set cargaActualTon(double valor) {
    if (valor < 0 || valor > 50) {
      throw RangeError('Carga debe estar entre 0 y 50 toneladas: $valor');
    }
    _cargaActualTon = valor;
    _historialCarga.add(valor);
    // Solo guardamos los últimos 60 registros
    if (_historialCarga.length > 60) _historialCarga.removeAt(0);
  }

  set usoCombustibleL(double valor) {
    if (valor < 0) throw ArgumentError('El combustible no puede ser negativo');
    _usoCombustibleL = valor;
  }

  // Método controlado — la única forma de incrementar ciclos
  void registrarCiclo() => _ciclosOperacion++;

  void resetearContador() {
    _ciclosOperacion = 0;
    print('$_codigoGrua: contador de ciclos reseteado');
  }

  @override
  String toString() =>
      '$_codigoGrua | Carga: ${_cargaActualTon.toStringAsFixed(1)}t '
      'Combustible: ${_usoCombustibleL.toStringAsFixed(1)}L '
      'Ciclos: $_ciclosOperacion';
}

void main() {
  final grua = GruaPortuaria('GRUA-PORTAL-03');

  // Solo podemos modificar el estado a través de los métodos
  grua.cargaActualTon  = 32.5;
  grua.usoCombustibleL = 118.3;
  grua.registrarCiclo();
  grua.registrarCiclo();
  grua.registrarCiclo();

  print(grua);
  print('Promedio de carga: ${grua.promedioCarga.toStringAsFixed(1)}t');
  print('Saturada: ${grua.estaSaturada}');

  try {
    grua.cargaActualTon = 75;  // lanza RangeError
  } catch (e) {
    print('Error capturado: $e');
  }
}
