class Contenedor(val ancho: Double, val largo: Double) {
    val volumen:    Double get() = ancho * largo
    val perimetro:  Double get() = 2 * (ancho + largo)

    // Siempre llaman al constructor primario con this(...)
    constructor(lado: Double) : this(lado, lado)
    constructor(ancho: Int, largo: Int) : this(ancho.toDouble(), largo.toDouble())

    override fun toString() = "Contenedor(${ancho}x${largo}) | volumen=${volumen}"
}

fun main() {
    val c1 = Contenedor(6.0, 2.4)
    val c2 = Contenedor(3.0)         // contenedor cuadrado
    val c3 = Contenedor(12, 3)       // con Int

    println(c1)  // Contenedor(6.0x2.4) | volumen=14.4
    println(c2)  // Contenedor(3.0x3.0) | volumen=9.0
    println(c3)  // Contenedor(12.0x3.0) | volumen=36.0
}
