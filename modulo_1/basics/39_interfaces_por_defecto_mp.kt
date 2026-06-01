interface Serializable {
    val id: String                    // abstracta — debe implementarse
    fun serializar(): String          // abstracta — debe implementarse
    val version: Int get() = 1        // con default — puede sobreescribirse
}

interface Validable {
    val errores: List<String>
    val esValido: Boolean get() = errores.isEmpty()

    fun validar(): Boolean
    fun imprimirErrores() {                // implementación por defecto
        if (errores.isEmpty()) println("Sin errores")
        else errores.forEach { println("  ❌ $it") }
    }
}

// POLIMORFISMO: Embarque puede usarse donde se espere Serializable O Validable
data class Embarque(
    override val id: String,
    val naviera:     String,
    val contenedores: List<String>,
    val totalToneladas: Double
) : Serializable, Validable {

    override fun serializar() =
        "$id|$naviera|${contenedores.joinToString(",")}|$totalToneladas"

    override val errores: List<String> get() = buildList {
        if (naviera.isBlank())          add("La naviera no puede estar vacía")
        if (contenedores.isEmpty())     add("El embarque debe tener al menos un contenedor")
        if (totalToneladas <= 0)        add("El total de toneladas debe ser mayor que cero")
    }

    override fun validar() = esValido
}

fun main() {
    val embarque1 = Embarque("EMB-001", "Naviera Mediterramar", listOf("CONT-7821", "CONT-4453"), 40.5)
    val embarque2 = Embarque("EMB-002", "",    emptyList(),                -5.0)

    // Polimorfismo por interfaz
    fun procesarSerializable(s: Serializable) = println("→ ${s.serializar()}")
    fun procesarValidable(v: Validable) {
        println("Válido: ${v.esValido}")
        v.imprimirErrores()
    }

    procesarSerializable(embarque1)   // → EMB-001|Naviera Mediterramar|CONT-7821,CONT-4453|40.5
    procesarValidable(embarque1)      // Válido: true / Sin errores
    procesarValidable(embarque2)      // Válido: false / ❌ ...
}
