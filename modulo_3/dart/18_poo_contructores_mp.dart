class TerminalPortuaria {
  final String nombre;
  final String ubicacion;
  final int    capacidadTeus;
  final bool   manejaRefrigerados;

  // Constructor principal
  TerminalPortuaria({
    required this.nombre,
    required this.ubicacion,
    required this.capacidadTeus,
    this.manejaRefrigerados = false,
  });

  // Constructor nombrado — alternativa de creación con configuración predefinida
  TerminalPortuaria.local()
      : nombre              = 'Terminal Local',
        ubicacion           = 'Muelle Principal',
        capacidadTeus       = 500,
        manejaRefrigerados  = false;

  TerminalPortuaria.produccion({required this.nombre, required this.ubicacion})
      : capacidadTeus      = 8000,
        manejaRefrigerados = true;

  // Constructor factory — lógica de creación más compleja
  factory TerminalPortuaria.desdeUrl(String url) {
    // Analiza una URL y extrae sus partes
    final uri = Uri.parse(url);
    return TerminalPortuaria(
      nombre:             uri.host,
      ubicacion:          uri.host,        // simplificado para el ejemplo
      capacidadTeus:      uri.port != 0 ? uri.port : (uri.scheme == 'https' ? 443 : 80),
      manejaRefrigerados: uri.scheme == 'https',
    );
  }

  @override
  String toString() =>
      '${manejaRefrigerados ? "Reefer" : "Estándar"} — $nombre en $ubicacion ($capacidadTeus TEUs)';
}

void main() {
  final t1 = TerminalPortuaria(nombre: 'Terminal Norte', ubicacion: 'Bahía de Cartagena', capacidadTeus: 3000);
  final t2 = TerminalPortuaria.local();
  final t3 = TerminalPortuaria.produccion(nombre: 'SPRBUN', ubicacion: 'Buenaventura');
  final t4 = TerminalPortuaria.desdeUrl('https://terminal.puertomar.com:8443/v1');

  print(t1);  // Estándar — Terminal Norte en Bahía de Cartagena (3000 TEUs)
  print(t2);  // Estándar — Terminal Local en Muelle Principal (500 TEUs)
  print(t3);  // Reefer — SPRBUN en Buenaventura (8000 TEUs)
  print(t4);  // Reefer — terminal.puertomar.com en terminal.puertomar.com (8443 TEUs)
}
