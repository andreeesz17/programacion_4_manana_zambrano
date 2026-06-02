// ABSTRACCIÓN: sealed class define los tipos posibles de alerta portuaria
sealed class AlertaPortuaria(val titulo: String, val mensaje: String) {
    abstract fun formatear(): String  // cada tipo formatea de forma distinta

    data class InformeAduanero(
        val destinatario: String,
        val asunto:       String,
        val cuerpo:       String
    ) : AlertaPortuaria(asunto, cuerpo) {
        override fun formatear() =
            "📧 Informe Aduanero → $destinatario\n   Asunto: $titulo\n   ${mensaje.take(50)}..."
    }

    data class AlertaOperativa(val puesto: String, val icono: String = "🔔")
        : AlertaPortuaria("Alerta Operativa", "") {
        override fun formatear() = "$icono Alerta → $puesto: $titulo"
    }

    data class MensajeVHF(val canal: String, val texto: String)
        : AlertaPortuaria("VHF", texto) {
        override fun formatear() = "📡 VHF Canal $canal: ${texto.take(160)}"
    }

    object Silenciosa : AlertaPortuaria("", "") {
        override fun formatear() = "🔕 Alerta silenciosa registrada"
    }
}

// ABSTRACCIÓN + POLIMORFISMO: interfaz con contrato genérico
interface EnviadorAlerta {
    val nombre: String
    fun enviar(alerta: AlertaPortuaria): Boolean
}

// HERENCIA: implementaciones concretas del mismo contrato
class ServicioAduanas : EnviadorAlerta {
    override val nombre = "Aduana Maritima"
    override fun enviar(n: AlertaPortuaria): Boolean {
        if (n !is AlertaPortuaria.InformeAduanero) return false
        println("  [ADUANA] → ${n.destinatario}")
        return true
    }
}

class ServicioOperaciones : EnviadorAlerta {
    override val nombre = "Centro de Operaciones"
    override fun enviar(n: AlertaPortuaria): Boolean {
        if (n !is AlertaPortuaria.AlertaOperativa) return false
        println("  [OPERACIONES] → ${n.puesto}")
        return true
    }
}

// ENCAPSULAMIENTO: la lista de servicios es privada
class CentroControl(private val servicios: List<EnviadorAlerta>) {

    fun enviar(alerta: AlertaPortuaria) {
        println(alerta.formatear())  // POLIMORFISMO: cada tipo formatea distinto
        val exito = servicios.any { it.enviar(alerta) }
        if (!exito) println("  ⚠️ Sin servicio disponible")
        println()
    }
}

fun main() {
    val centroControl = CentroControl(listOf(ServicioAduanas(), ServicioOperaciones()))

    listOf(
        AlertaPortuaria.InformeAduanero("aduana@puerto.cl", "Manifiesto de Carga", "Contenedor CONT-7821 listo para despacho."),
        AlertaPortuaria.AlertaOperativa("Muelle Norte"),
        AlertaPortuaria.MensajeVHF("16", "MV Atlantic Star solicita piloto de atraque"),
        AlertaPortuaria.Silenciosa
    ).forEach { centroControl.enviar(it) }
}
