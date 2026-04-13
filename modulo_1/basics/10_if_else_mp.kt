fun main() {
    println("Controles de Flujo en el Puerto")
    println("Condicional If - else")
    
    println("¿El barco tiene permiso especial del puerto? (s/n): ")
    val tienePermiso = readLine()?.trim()?.lowercase() == "s"
    
    println("Costo base de atraque: ")
    val costoBase = readLine()?.toDoubleOrNull() ?: 0.0
    
    if (tienePermiso) {
        val descuento = costoBase * 0.80
        println("Descuento aplicado (20%): $${"%.2f".format(descuento)}")
    } else {
        println("Pago completo: $${"%.2f".format(costoBase)}")
    }
}