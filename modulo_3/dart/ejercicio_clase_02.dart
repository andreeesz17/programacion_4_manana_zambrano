import 'dart:io';

void main() {
  print('Ingrese la calificación: ');
  double nota = double.parse(stdin.readLineSync()!);

  if (nota >= 7) {
    print('Aprobado');
  } else {
    print('Reprobado');
  }
}