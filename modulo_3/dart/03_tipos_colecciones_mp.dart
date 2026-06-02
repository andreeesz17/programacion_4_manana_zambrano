void main() {
  // List — lista ordenada (como List en Kotlin)
  List<String> contenedores = ['MSCU123456', 'MAEU789012', 'HLCU345678'];
  var          calados      = [8.5, 10.2, 12.0, 9.7, 11.3]; // metros, tipo inferido: List<double>

  print(contenedores[0]);       // MSCU123456
  print(contenedores.length);   // 3
  contenedores.add('CMAU901234');
  contenedores.remove('MAEU789012');

  // Map — clave → valor (como Map en Kotlin)
  Map<String, int> capacidadTerminal = {
    'Terminal Norte':   2500,
    'Terminal Sur':     4800,
    'Terminal Este':    1900,
  };

  print(capacidadTerminal['Terminal Norte']);   // 2500
  print(capacidadTerminal['Terminal Oeste']);   // null — clave no existe
  capacidadTerminal['Terminal Central'] = 3200; // añadir

  // Set — sin duplicados (como Set en Kotlin)
  Set<String> servicios = {'contenedor', 'granel', 'rodante'};
  servicios.add('contenedor');   // ignorado — ya existe
  print(servicios.length);       // 3

  // Spread operator — para combinar colecciones
  var muelleSur  = ['Muelle-1', 'Muelle-2', 'Muelle-3'];
  var muelleNorte = ['Muelle-4', 'Muelle-5', 'Muelle-6'];
  var todosLosMuelles = [...muelleSur, ...muelleNorte];
  print(todosLosMuelles);

  // Collection if — elementos condicionales
  bool mostrarRestringidos = true;
  var zonas = [
    'Zona Publica',
    'Zona Comercial',
    if (mostrarRestringidos) 'Zona Restringida',  // solo si la condición es true
  ];

  // Collection for — generar elementos
  var capacidades = [for (var i = 1; i <= 5; i++) i * 500];
  print(capacidades);  // [500, 1000, 1500, 2000, 2500]
}
