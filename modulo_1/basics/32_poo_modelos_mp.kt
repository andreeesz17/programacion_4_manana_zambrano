data class Contenedor(
    val id:        Int,
    val codigo:    String,
    val pesoTon:   Double,
    val tipoCarga: String,
    val activo:    Boolean = true
)


fun main() {
    val c1 = Contenedor(1, "CONT-7821", 22.5, "Carga General")
    val c2 = Contenedor(1, "CONT-7821", 22.5, "Carga General")
    val c3 = Contenedor(2, "CONT-4453", 18.0, "Carga Refrigerada")

    // toString() automático
    println(c1)  // Contenedor(id=1, codigo=CONT-7821, ...)

    // equals() por valor
    println(c1 == c2)   // true
    println(c1 == c3)   // false

    // copy() — nuevo objeto con cambios puntuales
    val liviano   = c1.copy(pesoTon = 12.0)
    val inactivo  = c1.copy(activo = false)

    // Desestructuración
    val (id, codigo, pesoTon) = c1
    println("$id: $codigo — $pesoTon ton")

    // En bucles
    listOf(c1, c3).forEach { (id2, codigo2, peso2) ->
        println("[$id2] $codigo2: $peso2 ton")
    }
}
