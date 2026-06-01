// Sin open — no se puede heredar (protección por defecto)
class Embarcacion(val nombre: String)
// class Carguero : Embarcacion("Atlantic Star")  // ERROR — Embarcacion es final

// Con open — la jerarquía está diseñada para ello
open class Embarcacion(val nombre: String, val senalAcustica: String) {
    // open — la subclase PUEDE sobreescribir
    open fun emitirSenal() = println("$nombre emite: $senalAcustica")
    open fun descripcion() = "Soy $nombre"

    // Sin open — la subclase NO puede sobreescribir
    fun navegar() = println("$nombre navega en aguas portuarias")
}

// HERENCIA: Carguero reutiliza todo de Embarcacion y especializa emitirSenal
class Carguero(nombre: String) : Embarcacion(nombre, "--- --- (señal de carga)") {
    override fun emitirSenal() {
        super.emitirSenal()                          // reutiliza la implementación del padre
        println("(solicita grúa portico)")           // añade comportamiento propio
    }
    override fun descripcion() = "${super.descripcion()}, un barco carguero"
}

class Remolcador(nombre: String, val potenciaHP: Int) : Embarcacion(nombre, "- - (señal de remolque)") {
    override fun descripcion() =
        "${super.descripcion()}, un remolcador de $potenciaHP HP"
}

fun main() {
    val carguero = Carguero("MV Atlantic Star")
    carguero.emitirSenal()
    // MV Atlantic Star emite: --- --- (señal de carga)
    // (solicita grúa portico)

    val remolcador = Remolcador("TB Neptuno", 4500)
    println(remolcador.descripcion())  // Soy TB Neptuno, un remolcador de 4500 HP

    // Herencia — Carguero y Remolcador tienen todo lo de Embarcacion más lo propio
    carguero.navegar()  // MV Atlantic Star navega en aguas portuarias — heredado de Embarcacion
}
