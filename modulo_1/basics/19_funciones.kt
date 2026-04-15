fun main() {
    println("Funciones")
    val saludo = saludo()
    println("$saludo")
    val suma: Int = sumar(5, 4)
    println(suma)
    println(restarTipoExpresion(5,3))
    println(restarTipoInferido(5,3))
    saludar("Pedro")
}

fun saludo(): String {
    return "hello"
}

fun sumar(a: Int, b: Int): Int {
    return a + b
}

// Tipo expresion
fun restarTipoExpresion(a: Int, b: Int)=a-b
// Inferido
fun restarTipoInferido(a: Int, b: Int)=a-b
fun saludar(nombre: String){
    println("Hola $nombre")
}