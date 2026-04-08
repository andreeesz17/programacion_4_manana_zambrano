/**
 * You can edit, run, and share this code.
 * play.kotlinlang.org
 */
fun main() {
    val nombre = "Peter"
    val apellido = "Parker"
    val edad = 28
    // Variable Simple
    println("Hola $nombre")
    // Expresion
    println("Nombre completo : ${nombre.uppercase()} ${apellido.uppercase()}")
    val nombreCompleto = "Nombre completo : ${nombre.uppercase()} ${apellido.uppercase()}"
    println(nombreCompleto)
    println("Edad : ${edad+6} años")
    
    // String MultiLinea
    val tarjeta = """
    	|Nombre: $nombre $apellido
        |Edad: $edad
        |Acceso: ${if(edad>18)"Permitido" else "Denegado"}
    """.trimMargin()
    println(tarjeta)
    
}