fun main() {
    println("Control de Puerto Marítimo - Listas: Gestión de Contenedores y Muelles")
    val contenedores = listOf("CONT-1021", "CONT-3345", "CONT-7782", "CONT-4490", "CONT-6631")

    println("Size: ${contenedores.size}")
    println("Mostrar el elemento indice 0: ${contenedores[0]}")
    println("Mostrar el primer elemento: ${contenedores.first()}")
    println("Mostrar el ultimo elemento: ${contenedores.last()}")

    println("Mostrar el elemento indice 2: ${contenedores.get(2)}")
    println("Mostrar indice conetnido elemento: ${contenedores.indexOf("CONT-3345")}")
    println("Verificar existencia de elemento: ${contenedores.contains("CONT-3345")}")
    println("Verificar existencia de un elemento: ${"CONT-3345" in contenedores}")

    println("Sublista: ${contenedores.subList(1, 3)}")
    println("Tomar primeros 2 elementos: ${contenedores.take(2)}")
    println("Suprimir tres primeros elementos: ${contenedores.drop(3)}")
    println("Tomar los ultimos dos elemntos: ${contenedores.takeLast(2)}")

    for (contenedor in contenedores) {
        println(contenedor)
    }

    println("listas-Mutable")
    val muelles = mutableListOf("Muelle Norte", "Muelle Sur", "Terminal Este", "Terminal Oeste", "Muelle Pesquero")

    println(muelles)

    muelles.add("Muelle Sur")
    println(muelles)

    muelles.add(0, "Terminal Central")
    println(muelles)

    muelles.remove("Terminal Este")
    println(muelles)

    muelles[1] = "Muelle de Graneles"
    println(muelles)

    println("Array deque")
    val deque =  ArrayDeque<Int>()
    println(deque)
    deque.addFirst(1)
    println(deque)
    deque.addLast(2)
    println(deque)
    deque.addLast(0)
    println(deque)
    deque.removeFirst()
    println(deque)
    deque.removeLast()
    println(deque)
}
