import 'dart:io';

void main() {
  print('Ingrese un número: ');  
  int numero = int.parse(stdin.readLineSync()!);

  if (numero > 0) {
    print('El número es positivo');
  } else if (numero < 0) {
    print('El número es negativo');
  } else {
    print('El número es cero');
  }
}