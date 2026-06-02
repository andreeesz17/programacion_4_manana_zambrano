void main() {
  String estadoEmbarque = '404';

  switch (estadoEmbarque) {
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
  String codigoHttp = '404';

  String descripcion = switch (codigoHttp) {
    '200' => 'OK — solicitud exitosa',
    '201' => 'Created — recurso creado',
    '204' => 'No Content — sin contenido',
    '400' => 'Bad Request — datos inválidos',
    '401' => 'Unauthorized — sin autenticación',
    '403' => 'Forbidden — sin permiso',
    '404' => 'Not Found — recurso no existe',
    '500' => 'Internal Server Error',
    '503' => 'Service Unavailable',
    _     => 'Código HTTP desconocido',  // _ es el caso por defecto
  };
  print(descripcion);

  String tipoEmbarque = 'CONTENEDOR';

  // Múltiples valores en una rama con ||
  String categoria = switch (tipoEmbarque) {
    'CONTENEDOR' || 'TEU' || 'FEU'           => 'Carga contenerizada',
    'GRANEL_SOLIDO' || 'GRANEL_LIQUIDO'      => 'Carga a granel',
    'RODANTE' || 'RO_RO'                     => 'Carga rodante',
    'REFRIGERADO' || 'REEFER'                => 'Carga refrigerada',
    _                                         => 'Tipo de carga desconocido',
  };

  print(categoria);  // Carga contenerizada

  // Guards — condición adicional con 'when'
  double nivelMar = 3.8; // metros sobre nivel de referencia

  String alertaMarea = switch (nivelMar) {
    double n when n >= 5.0  => '🚨 MAREA CRÍTICA — evacuar zona portuaria',
    double n when n >= 4.0  => '🔴 MAREA ALTA — suspender operaciones',
    double n when n >= 3.0  => '🟡 MAREA MODERADA — operar con precaución',
    double n when n >= 1.5  => '🟢 MAREA NORMAL — operaciones autorizadas',
    _                        => '🔵 MAREA BAJA — verificar calado mínimo',
  };

  print(alertaMarea);
}
