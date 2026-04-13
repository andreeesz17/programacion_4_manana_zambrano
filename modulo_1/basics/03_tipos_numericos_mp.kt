fun main() {
    
    val barcosPequenos: Byte = 127
    println("Cantidad máxima de barcos pequeños: $barcosPequenos")
    
    val contenedores: Short = 32_765
    println("Cantidad de contenedores en almacén: $contenedores")
    
    val barcosEnPuerto: Int = 12
    println("Barcos actualmente en puerto: $barcosEnPuerto")
    
    val cargaTotal: Long = 12_122_122_122_123_123L
    println("Carga total registrada: $cargaTotal kg")
    
    println("Datos Decimales")
    
    val tarifaAtraque: Float = 3.14f
    println("Tarifa de atraque (Float): $tarifaAtraque")
    
    val profundidadPuerto: Double = 3.1415926535
    println("Profundidad del puerto (Double): $profundidadPuerto metros")
    
    val nombreBarco = "Andresito"
    val numeroTripulantes = 19
    
    println("Nombre del barco: $nombreBarco")
    val nombreTipo = nombreBarco::class.simpleName
    println("Tipo inferido nombreBarco: $nombreTipo")
    println("Tipo inferido nombreBarco: ${nombreBarco::class.simpleName}")
    
    println("Número de tripulantes: $numeroTripulantes")
    val tripulantesTipo = numeroTripulantes::class.simpleName
    println("Tipo inferido tripulantes: $tripulantesTipo")
    println("Tipo inferido tripulantes: ${numeroTripulantes::class.simpleName}")
}