data class TipoCarga(val id: Int, val nombre: String)

data class Contenedor(
    val id:        Int,
    val codigo:    String,
    val pesoTon:   Double,
    val unidades:  Int,
    val tipoCarga: TipoCarga,
    val activo:    Boolean = true
) {
    // ABSTRACCIÓN: el usuario consulta disponible sin saber la lógica
    val disponible: Boolean get() = activo && unidades > 0
    val pesoConAranceles: Double get() = pesoTon * 1.19

    // Devuelve una copia — inmutabilidad como forma de encapsulamiento
    fun aplicarDescuento(porcentaje: Double): Contenedor {
        require(porcentaje in 0.0..100.0) { "Descuento debe ser entre 0 y 100" }
        return copy(pesoTon = pesoTon * (1 - porcentaje / 100))
    }
}


// ENCAPSULAMIENTO: el estado del manifiesto es privado y mutable internamente
object ManifiestoContenedores {
    private val tiposCarga = mutableListOf(
        TipoCarga(1, "Carga General"),
        TipoCarga(2, "Carga Refrigerada"),
        TipoCarga(3, "Carga Peligrosa")
    )
    private val contenedores   = mutableListOf<Contenedor>()
    private var siguienteId = 1

    fun agregarContenedor(codigo: String, pesoTon: Double, unidades: Int, tipoCargaId: Int): Contenedor? {
        val tipoCarga = tiposCarga.find { it.id == tipoCargaId } ?: return null
        val contenedor  = Contenedor(siguienteId++, codigo, pesoTon, unidades, tipoCarga)
        contenedores.add(contenedor)
        return contenedor
    }

    // ABSTRACCIÓN: interfaz pública limpia — solo lectura de listas
    fun listar(): List<Contenedor>              = contenedores.toList()
    fun disponibles(): List<Contenedor>         = contenedores.filter { it.disponible }
    fun porTipoCarga(id: Int): List<Contenedor> = contenedores.filter { it.tipoCarga.id == id }
    fun buscar(query: String): List<Contenedor> =
        contenedores.filter { it.codigo.contains(query, ignoreCase = true) }
}

fun main() {
    ManifiestoContenedores.agregarContenedor("CONT-7821",  22.5, 15, 1)
    ManifiestoContenedores.agregarContenedor("CONT-4453",  18.0,  0, 1)
    ManifiestoContenedores.agregarContenedor("CONT-9910",  30.0,  5, 2)
    ManifiestoContenedores.agregarContenedor("CONT-0012",  12.5,  8, 3)

    println("=== Todos los contenedores ===")
    ManifiestoContenedores.listar().forEach { c ->
        val estado = if (c.disponible) "✅" else "❌"
        println("$estado ${c.codigo} — ${"%.2f".format(c.pesoConAranceles)} ton (con aranceles)")
    }

    println("\n=== Disponibles con 10% descuento ===")
    ManifiestoContenedores.disponibles()
        .map { it.aplicarDescuento(10.0) }
        .forEach { println("  ${it.codigo}: ${"%.2f".format(it.pesoTon)} ton") }
}
