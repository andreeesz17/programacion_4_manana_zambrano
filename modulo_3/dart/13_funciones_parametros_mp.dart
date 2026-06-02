// required → el parámetro es obligatorio
// sin required → es opcional (necesita valor por defecto o ser nullable)
void configurarTerminal({
  required String terminal,
  required int    muelleNumero,
  bool   accesoPrioritario = false,
  int    tiempoEsperaMin   = 30,
}) {
  final acceso = accesoPrioritario ? 'prioritario' : 'estándar';
  print('Asignando Terminal $terminal — Muelle $muelleNumero — Acceso $acceso (espera: ${tiempoEsperaMin} min)');
}

void main() {
  // Los nombrados pueden pasarse en cualquier orden
  configurarTerminal(
    terminal:           'Terminal Norte',
    muelleNumero:       7,
    accesoPrioritario:  true,
    tiempoEsperaMin:    15,
  );

  // Solo los obligatorios — los opcionales toman su valor por defecto
  configurarTerminal(
    terminal:     'Terminal Sur',
    muelleNumero: 3,
  );
}
