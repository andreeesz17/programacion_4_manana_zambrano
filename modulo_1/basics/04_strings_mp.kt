fun main() {
    val nombreBarco = "Poseidón"
    val tipoBarco = "Carga"
    val tripulacion = 28
    
    println("Bienvenido barco $nombreBarco")
    
    println("Identificación: ${nombreBarco.uppercase()} - ${tipoBarco.uppercase()}")
    val identificacion = "Identificación: ${nombreBarco.uppercase()} - ${tipoBarco.uppercase()}"
    println(identificacion)
    
    println("Tripulación registrada: ${tripulacion + 6} personas")
    
    val registro = """
        |Barco: $nombreBarco
        |Tipo: $tipoBarco
        |Tripulación: $tripulacion
        |Acceso al puerto: ${if(tripulacion > 18) "Permitido" else "Denegado"}
    """.trimMargin()
    
    println(registro)
}