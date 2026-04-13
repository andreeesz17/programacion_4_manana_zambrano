fun main() {
    println("Controles de Flujo en el Puerto")
    
    println("Ingrese código del tipo de barco: ")
    val codigo = readLine()?.toIntOrNull() ?: 0
    
    val tipoBarco = when (codigo) {
        1 -> "Barco de carga"
        2 -> "Barco pesquero"
        3 -> "Barco turístico"
        4 -> "Buque petrolero"
        5 -> "Barco militar"
        6 -> "Barco de transporte de pasajeros"
        else -> "Tipo de barco no registrado"
    }
    
    println("Tipo de barco: $tipoBarco")
}