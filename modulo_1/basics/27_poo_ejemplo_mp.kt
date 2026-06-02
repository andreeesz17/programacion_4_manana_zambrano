class OperadorPortuario(val nombre: String, val matricula: String) {
    val nombreNormalizado: String
    val puertoMatricula: String

    init {
        // Encapsulamiento en acción: validamos antes de construir
        require(nombre.isNotBlank()) { "El nombre no puede estar vacío" }
        require(matricula.contains("-")) { "Matricula inválida: $matricula" }

        nombreNormalizado = nombre.trim().lowercase()
        puertoMatricula      = matricula.substringAfter("-")
    }
}

fun main() {
    val op = OperadorPortuario("  Ana García  ", "PTO-ValpaRaiso")
    println(op.nombreNormalizado)  // ana garcía
    println(op.puertoMatricula)    // ValpaRaiso

    // OperadorPortuario("", "invalido")   // IllegalArgumentException — require falla
}
