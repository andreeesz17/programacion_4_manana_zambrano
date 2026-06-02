enum class EstadoEmbarque(val descripcion: String, val esTerminal: Boolean) {
    EN_ESPERA   ("Esperando asignacion de muelle",  false),
    EN_MANIOBRA ("Realizando maniobra de atraque",  false),
    ATRACADO    ("Amarrado con exito en el muelle",  true),
    RECHAZADO   ("Acceso denegado por aduana",       true),
    ZARPADO     ("Embarcacion ha abandonado el puerto", true);

    fun puedeTransicionarA(siguiente: EstadoEmbarque): Boolean = when (this) {
        EN_ESPERA   -> siguiente == EN_MANIOBRA || siguiente == RECHAZADO
        EN_MANIOBRA -> siguiente == ATRACADO || siguiente == RECHAZADO
        else        -> false
    }
}


fun main() {
    val estado = EstadoEmbarque.EN_MANIOBRA
    println(estado.descripcion)  // Realizando maniobra de atraque
    println(estado.esTerminal)   // false

    // when exhaustivo — sin else porque el compilador conoce todos los casos
    val icono = when (estado) {
        EstadoEmbarque.EN_ESPERA   -> "⏰"
        EstadoEmbarque.EN_MANIOBRA -> "⏳"
        EstadoEmbarque.ATRACADO    -> "✅"
        EstadoEmbarque.RECHAZADO   -> "❌"
        EstadoEmbarque.ZARPADO     -> "🚫"
    }
    println(icono)  // ⏳

    println(estado.puedeTransicionarA(EstadoEmbarque.ATRACADO))  // true
}
