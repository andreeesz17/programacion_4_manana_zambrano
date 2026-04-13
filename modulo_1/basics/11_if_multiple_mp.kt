fun main() {
    println("Controles de Flujo en el Puerto")
    println("Clasificación de carga del barco")
    
    println("Ingrese el peso de carga (en toneladas): ")
    val carga = readLine()?.toIntOrNull() ?: 0
    
    val clasificacion = if (carga <= 90) {
        "Carga ligera"
    } else if (carga <= 119) {
        "Carga normal"
    } else if (carga <= 200) {
        "Carga elevada"
    } else if (carga <= 300) {
        "Carga pesada"
    } else if (carga <= 500) {
        "Carga crítica"
    } else {
        "Sobrecarga - requiere inspección inmediata"
    }
    
    println("Clasificación: $clasificacion")
}