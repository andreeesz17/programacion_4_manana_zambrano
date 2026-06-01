fun main() {
    println("Control de Puerto Marítimo - Funciones del Sistema Portuario")
    val bienvenida = bienvenida()
    println("$bienvenida")
    val tarifa: Int = calcularTarifa(5, 4)
    println(tarifa)
    println(restarTipoExpresion(5,3))
    println(restarTipoInferido(5,3))
    registrarBarco("Puerto Valparaiso")
}

fun bienvenida(): String {
    return "Bienvenido al Sistema de Control Portuario"
}

fun calcularTarifa(a: Int, b: Int): Int {
    return a + b
}

// Tipo expresion
fun restarTipoExpresion(a: Int, b: Int)=a-b
// Inferido
fun restarTipoInferido(a: Int, b: Int)=a-b
fun registrarBarco(puerto: String){
    println("Registrando acceso en $puerto")
}
