object ConfiguracionPuerto {
    val host:    String = "api.puertovalparaiso.cl"
    val puerto:  Int    = 443
    private val apiKey: String = "sk-puerto-secreto-123"   // privado — nunca expuesto

    fun baseUrl() = "https://$host:$puerto"
    fun headers() = mapOf("Authorization" to "Bearer $apiKey")
}

class OperadorPortuario private constructor(val id: Int, val nombre: String) {
    companion object {
        private var contadorId = 0

        // Factory function — encapsulamiento del constructor
        fun crear(nombre: String, matricula: String): OperadorPortuario? {
            if (nombre.isBlank() || !matricula.contains("-")) return null
            return OperadorPortuario(++contadorId, nombre.trim())
        }

        const val CARGO_DEFECTO = "operador"
    }
}


fun main() {
    println(ConfiguracionPuerto.baseUrl())  // https://api.puertovalparaiso.cl:443
    // ConfiguracionPuerto.apiKey            // ERROR — privado

    val op = OperadorPortuario.crear("Ana García", "PTO-001")
    println(op)  // OperadorPortuario(id=1, nombre=Ana García)
}
