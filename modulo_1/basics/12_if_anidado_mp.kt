fun main() {
    println("Controles de Flujo en el Puerto")
    println("Condicional If - Anidado")
    
    println("¿El barco tiene permisos especiales? (s/n): ")
    val tienePermiso = readLine()?.trim()?.lowercase() == "s"
    
    println("Cantidad de tripulantes: ")
    val tripulacion = readLine()?.toIntOrNull() ?: 0
    
    if (tienePermiso) {
        println("Barco con permisos especiales")
        
        if (tripulacion < 10) {
            println("Tripulación reducida: ingreso rápido")
        } else if (tripulacion > 50) {
            println("Tripulación alta: requiere control adicional")
        } else {
            println("Tripulación en rango normal")
        }
        
    } else {
        println("Barco sin permisos especiales")
        
        if (tripulacion < 10 || tripulacion > 50) {
            println("Condiciones fuera de lo permitido: revisión obligatoria")
        } else {
            println("Ingreso permitido con supervisión")
        }
    }
}