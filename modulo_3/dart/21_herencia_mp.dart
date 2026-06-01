// Clase base — comportamiento y datos comunes
class Embarcacion {
  final String nombre;
  final int    anosServicio;

  Embarcacion(this.nombre, this.anosServicio);

  // Método que cada subclase debe especializar
  String tipoCarga() => '---';

  // Método común — reutilizado sin cambios por todas las subclases
  void presentarse() {
    print('Buque: $nombre, $anosServicio años en servicio, carga: ${tipoCarga()}');
  }
}

// HERENCIA: PortaContenedores y Petrolero reutilizan Embarcacion y lo especializan
class PortaContenedores extends Embarcacion {
  PortaContenedores(super.nombre, super.anosServicio);

  @override
  String tipoCarga() => 'Contenedores TEU/FEU';

  void descargarContenedores() => print('$nombre descargando contenedores en muelle 🏗️');
}

class Petrolero extends Embarcacion {
  Petrolero(super.nombre, super.anosServicio);

  @override
  String tipoCarga() => 'Crudo y derivados del petróleo';

  void transferirCrudo() => print('$nombre transfiriendo crudo a terminal de líquidos ⛽');
}

void main() {
  final portaContenedores = PortaContenedores('MSC Beatrice', 8);
  final petrolero         = Petrolero('Maersk Peary', 12);

  portaContenedores.presentarse();  // Buque: MSC Beatrice, 8 años en servicio, carga: Contenedores TEU/FEU
  petrolero.presentarse();          // Buque: Maersk Peary, 12 años en servicio, carga: Crudo y derivados del petróleo

  portaContenedores.descargarContenedores();
  petrolero.transferirCrudo();
}
