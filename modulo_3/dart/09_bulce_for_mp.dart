void main() {
  // for con índice — cuando necesitas el número de iteración
  for (int i = 0; i < 5; i++) {
    print('Revisando contenedor en posición $i');
  }

  // for con paso distinto
  for (int i = 0; i <= 100; i += 25) {
    print('Carga embarcada: $i%');
  }

  // for decreciente
  for (int i = 5; i >= 1; i--) {
    print('Countdown de atraque: $i');
  }
}
