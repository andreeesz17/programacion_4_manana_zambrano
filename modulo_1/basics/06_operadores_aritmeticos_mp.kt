fun main() {
    
    // Entrada de datos
    println("Sistema de Cálculo de Carga del Puerto")
    
    println("Ingrese cantidad de contenedores del barco 1: ")
    val contenedores1 = readLine()?.toInt() ?: 0

    println("Ingrese cantidad de contenedores del barco 2: ")
    val contenedores2 = readLine()?.toInt() ?: 0

    println("Operaciones de Carga")
    
    println("Suma total de contenedores")
    println("$contenedores1 + $contenedores2 : ${contenedores1 + contenedores2}")
    
    println("Diferencia de carga")
    println("$contenedores1 - $contenedores2 : ${contenedores1 - contenedores2}")
    
    println("Multiplicación (simulación de lotes)")
    println("$contenedores1 * $contenedores2 : ${contenedores1 * contenedores2}")
    
    println("Distribución de carga")
    println("$contenedores1 / $contenedores2 : ${contenedores1 / contenedores2}")
    
    println("Contenedores sobrantes")
    println("$contenedores1 % $contenedores2 : ${contenedores1 % contenedores2}")
    
    println("Operadores de Asignación Compuesta")
    
    var cargaMuelle = 10
    
    cargaMuelle += 5
    println("Carga en muelle (+=5): $cargaMuelle")
    
    cargaMuelle -= 3
    println("Carga en muelle (-=3): $cargaMuelle")
    
    cargaMuelle *= 6
    println("Carga en muelle (*=6): $cargaMuelle")
    
    cargaMuelle /= 2
    println("Carga en muelle (/=2): $cargaMuelle")
    
    cargaMuelle %= 2
    println("Carga en muelle (%=2): $cargaMuelle")
    
    // Incremento o Decremento
    cargaMuelle++
    println("Incremento de carga: $cargaMuelle")
    
    cargaMuelle--
    println("Decremento de carga: $cargaMuelle")
}