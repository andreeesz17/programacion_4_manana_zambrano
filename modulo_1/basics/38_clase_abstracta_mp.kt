abstract class ZonaPortuaria(val nombre: String) {
    // abstract — las subclases DEBEN implementar esto (herencia forzada)
    abstract val area: Double
    abstract val perimetro: Double
    abstract fun descripcion(): String

    // concreto — disponible en todas las subclases (reutilización)
    fun comparar(otra: ZonaPortuaria): String = when {
        area > otra.area -> "$nombre es más grande que ${otra.nombre}"
        area < otra.area -> "$nombre es más pequeña que ${otra.nombre}"
        else             -> "$nombre y ${otra.nombre} tienen la misma área"
    }

    // Polimorfismo: toString usa area y descripcion que son polimórficas
    override fun toString() = "${descripcion()} | Área: ${"%.2f".format(area)} m²"
}

class PatioCilindrico(val radio: Double) : ZonaPortuaria("Patio Cilíndrico") {
    override val area:       Double get() = Math.PI * radio * radio
    override val perimetro:  Double get() = 2 * Math.PI * radio
    override fun descripcion() = "Patio cilíndrico de radio $radio m"
}

class PatioRectangular(val ancho: Double, val largo: Double) : ZonaPortuaria("Patio Rectangular") {
    override val area:       Double get() = ancho * largo
    override val perimetro:  Double get() = 2 * (ancho + largo)
    override fun descripcion() = "Patio rectangular de ${ancho}x${largo} m"
}

class PatioTriangular(val lado: Double) : ZonaPortuaria("Patio Triangular") {
    override val area:       Double get() = (Math.sqrt(3.0) / 4) * lado * lado
    override val perimetro:  Double get() = 3 * lado
    override fun descripcion() = "Patio triangular equilátero de lado $lado m"
}

fun main() {
    // POLIMORFISMO: la lista acepta cualquier ZonaPortuaria
    val zonas: List<ZonaPortuaria> = listOf(
        PatioCilindrico(50.0),
        PatioRectangular(120.0, 80.0),
        PatioTriangular(100.0)
    )

    zonas.forEach { println(it) }  // toString polimórfico

    val mayor = zonas.maxByOrNull { it.area }
    println("\nZona más grande: ${mayor?.nombre}")

    println(zonas[0].comparar(zonas[1]))
}
