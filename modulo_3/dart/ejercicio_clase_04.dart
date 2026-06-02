import 'dart:io';

void main() {
    
    int cajas = 0;
    int entradas = 0;
    int entrada = 1;
    int empleado = 0;

     while (entrada != 0) {
        print("Ingrese la cantidad");
        entrada = int.parse(stdin.readLineSync()!);
        entradas ++;
        cajas += entrada; 
    }
    if (cajas < 20){
            print("Rendimiento bajo");
        }else if(cajas < 50){
            print("Rendimeinto normal");
        }else(
            print("Rendimiento excelente")
            );

    print("Total de cajas: $cajas");
    print("Cantidad de empleados registrados: $entradas");
    print("Promedio de cajas por empleado: ${cajas/empleado}");

}