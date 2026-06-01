fun main(){
    println("Control de Puerto Marítimo - Set: Registro de Banderas Nacionales")
    println("Set inmutable")
    val numeros = setOf(1,2,3,4,5,6,7,8,1,3)
    println("numeros Set: ${numeros}")

    println("Operaciones de Conjuntos")
    val pares   = setOf(2,4,6,8,10)
    val multiplos3= setOf(3,6,9)
    println("pares Set: ${pares}")
    println("multiplos3 Set: ${multiplos3}")
    println("Union set: ${pares.union(multiplos3)}")
    println("Interseccion set: ${pares.intersect(multiplos3)}")
    println("Subraccion set: ${pares.subtract(multiplos3)}")
    println("pares set: ${pares}")
    println("multiplos3 set: ${multiplos3}")


    println("Set mutable")
    val banderasNacionales = mutableSetOf ("Panama", "Liberia", "Marshall Islands", "Bahamas")
    println(banderasNacionales)

    banderasNacionales.add("Panama")
    println(banderasNacionales)

    banderasNacionales.add("Malta")
    println(banderasNacionales)

    banderasNacionales.remove("Bahamas")
    println(banderasNacionales)

    println("Verificar si elemnto existe ${"Panama" in banderasNacionales}")
    println("Verificar si elemnto existe ${"Cyprus" in banderasNacionales}")


}
