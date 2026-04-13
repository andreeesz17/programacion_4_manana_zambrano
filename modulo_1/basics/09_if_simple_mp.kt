fun main() {
    println("Controles de Flujo en el Puerto")
    println("Condicional If")
    
    println("Ingrese el peso de carga del barco (en toneladas): ")
    val pesoCarga = readLine()?.toDoubleOrNull() ?: 36.5
    
    if (pesoCarga >= 38.0) {
        println("Carga alta detectada: asignar muelle especial")
    }
    
    if (pesoCarga >= 40.0) {
        println("Carga crítica: requiere supervisión y descarga inmediata")
    }
    
    println("Peso de carga registrado: $pesoCarga toneladas")
}