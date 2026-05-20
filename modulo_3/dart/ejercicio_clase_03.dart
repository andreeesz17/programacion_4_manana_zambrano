import 'dart:io';

void main() {
  print('Ingrese un año: ');
  double anio = double.parse(stdin.readLineSync()!);

  if (anio % 4 == 0) {
    print('bisiesto');
  } else {
    print('no es bisiesto');
  }
}