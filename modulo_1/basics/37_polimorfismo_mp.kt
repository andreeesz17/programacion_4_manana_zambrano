// La interfaz define el contrato — QUÉ puede hacer
// Las implementaciones definen el CÓMO
interface Maniobrable {
    fun ejecutarManiobra(toneladas: Double): Boolean
    val nombre: String
}

class GruaPortica(val codigo: String) : Maniobrable {
    override val nombre = "Grúa Pórtico"
    override fun ejecutarManiobra(toneladas: Double): Boolean {
        println("🏗️ Izando ${"%.2f".format(toneladas)} ton con grúa $codigo")
        return true
    }
}

class MontacargasFrontal(val placa: String) : Maniobrable {
    override val nombre = "Montacargas Frontal"
    override fun ejecutarManiobra(toneladas: Double): Boolean {
        println("🚜 Trasladando ${"%.2f".format(toneladas)} ton con montacargas $placa")
        return true
    }
}

class CarretillaElevadora : Maniobrable {
    override val nombre = "Carretilla Elevadora"
    override fun ejecutarManiobra(toneladas: Double): Boolean {
        println("🔧 Movilizando ${"%.2f".format(toneladas)} ton con carretilla")
        return true
    }
}

// Esta función no sabe ni le importa qué tipo de equipo es
// Solo sabe que recibe algo que implementa Maniobrable — POLIMORFISMO
fun operarCarga(toneladas: Double, equipo: Maniobrable) {
    println("Iniciando maniobra con ${equipo.nombre}...")
    val exito = equipo.ejecutarManiobra(toneladas)
    println(if (exito) "✅ Maniobra exitosa" else "❌ Maniobra fallida")
}

fun main() {
    val equipos: List<Maniobrable> = listOf(
        GruaPortica("GP-04"),
        MontacargasFrontal("MC-112"),
        CarretillaElevadora()
    )

    // Misma función — comportamiento distinto según el tipo
    equipos.forEach { operarCarga(22.5, it) }
}
