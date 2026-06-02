class AmarraderoPortuario(naviera: String, capacidadInicial: Double) {

    val naviera: String = naviera       // público — cualquiera puede leer

    private var capacidadDisponible: Double = capacidadInicial  // privado — solo esta clase lo modifica

    internal val codigoAmarradero: String =        // internal — visible en el mismo módulo
        "AM${(100000..999999).random()}"

    protected open fun calcularTarifaAtraque(): Double = capacidadDisponible * 0.02  // protected — visible en subclases

    // La capacidad solo cambia a través de estos métodos — NUNCA directamente
    fun cargarContenedor(toneladas: Double) {
        require(toneladas > 0) { "El tonelaje debe ser positivo" }
        capacidadDisponible += toneladas
        println("Cargado: ${"%.2f".format(toneladas)} ton | Capacidad actual: ${consultarCapacidad()}")
    }

    fun descargarContenedor(toneladas: Double): Boolean {
        require(toneladas > 0) { "El tonelaje debe ser positivo" }
        if (toneladas > capacidadDisponible) {
            println("Capacidad insuficiente en el amarradero")
            return false
        }
        capacidadDisponible -= toneladas
        println("Descargado: ${"%.2f".format(toneladas)} ton | Capacidad actual: ${consultarCapacidad()}")
        return true
    }

    fun consultarCapacidad(): String = "${"%.2f".format(capacidadDisponible)} ton"
}

fun main() {
    val amarradero = AmarraderoPortuario("Naviera Mediterramar", 1000.0)

    amarradero.cargarContenedor(500.0)
    amarradero.descargarContenedor(200.0)
    amarradero.descargarContenedor(2000.0)

    println(amarradero.naviera)
    println(amarradero.consultarCapacidad())
    // amarradero.capacidadDisponible = 999999.0  // ERROR — capacidadDisponible es privado
}
