class CargaContenedor(cargaKg: Double) {

    // ENCAPSULAMIENTO: el setter valida antes de asignar
    var cargaKg: Double = cargaKg
        set(value) {
            require(value >= 0.0) { "La carga no puede ser negativa" }
            field = value  // 'field' es el backing field
        }

    // ABSTRACCIÓN: el usuario consulta en toneladas sin saber la fórmula
    val toneladas: Double
        get() = cargaKg / 1000.0

    val libras: Double
        get() = cargaKg * 2.20462

    val clasificacion: String
        get() = when {
            cargaKg < 5000  -> "Carga Ligera"
            cargaKg < 15000 -> "Carga Estandar"
            cargaKg < 25000 -> "Carga Pesada"
            else            -> "Carga Maxima"
        }
}


fun main() {
    val carga = CargaContenedor(12000.0)
    println("${carga.cargaKg} kg = ${carga.toneladas} ton = ${carga.libras} lb")
    println(carga.clasificacion)  // Carga Estandar

    carga.cargaKg = 2500.0
    println("${carga.cargaKg} kg → ${carga.clasificacion}")  // Carga Ligera

    // carga.cargaKg = -100.0  // IllegalArgumentException
}
