void main() {
  String codigoHttp = '404';

  switch (codigoHttp) {
    case '200':
      print('OK');
    case '201':
      print('Creado');
    case '400':
      print('Petición incorrecta');
    case '401':
      print('No autorizado');
    case '404':
      print('No encontrado');
    case '500':
      print('Error del servidor');
    default:
      print('Código desconocido');
  }
}