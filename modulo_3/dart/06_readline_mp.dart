import 'dart:io';

void main(){
  print('Ingrese el nombre del buque: ');
  String? nombreBuque = stdin.readLineSync();
  print('Bienvenido al puerto, $nombreBuque');

  print('Ingrese el número de contenedores a bordo:');
  int contenedores = int.parse(stdin.readLineSync()!);
  print('Contenedores registrados: $contenedores');

  print('Ingrese el calado del buque (metros):');
  double calado = double.parse(stdin.readLineSync()!);
  print('Calado registrado: $calado m');

  print('Ingrese el peso de carga (toneladas):');
  int cargaA = int.parse(stdin.readLineSync()!);
  print('Ingrese el peso de tara (toneladas):');
  int cargaB = int.parse(stdin.readLineSync()!);
  int pesoNeto = cargaA + cargaB;
  print('El peso total del embarque de $cargaA y $cargaB es: $pesoNeto toneladas');


}
