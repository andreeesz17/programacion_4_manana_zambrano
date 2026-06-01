fun main() {
    println("Control de Puerto Marítimo - Ciclo Repeat: Medición de Carga de Contenedores")
    println("¿Cuantas mediciones de peso tomar para calcular carga promedio del contenedor?")
    val mediciones = readLine()?.toIntOrNull() ?: 3
    var totalPeso = 0
    repeat(mediciones) { i ->
        println("Medicion ${i + 1} (peso en toneladas)")
        val peso = readLine()?.toIntOrNull() ?: 0
        totalPeso += peso * 4  // para convertir a unidades estandar de carga
    }
    val promedio = if (mediciones > 0) totalPeso / mediciones else 0
    println("Peso promedio del contenedor: $promedio toneladas")
    println("Clasificacion: ${
        when {
            promedio < 10 -> "Carga Ligera"
            promedio <= 25 -> "Carga Estandar"
            else -> "Carga Pesada"
        }
    }")
}
