fun main (){
    println("Control de Puerto Marítimo - Map: Rutas Marítimas y Carga Portuaria")
    println("map inmutable")
    val rutasMaritimas = mapOf(
        "Valparaiso" to "Shanghai",
        "Buenos Aires" to "Rotterdam",
        "Santos" to "Hamburgo",
        "Callao" to "Los Angeles",
    )
    println(rutasMaritimas["Valparaiso"])
    println(rutasMaritimas["Cartagena"])
    println(rutasMaritimas.getOrDefault("Valparaiso", "Desconocido"))
    println(rutasMaritimas.getOrDefault("Cartagena", "Desconocido"))
    println(rutasMaritimas)
    println(rutasMaritimas.keys)
    println(rutasMaritimas.values)
    println(rutasMaritimas.entries)
    for ((origen, destino) in rutasMaritimas) {
        println("$origen -> $destino")
    }

    println("map mutable")
    val cargaPuerto = mutableMapOf(
        "contenedores" to 10,
        "graneles" to 4,
        "vehiculos" to 12,
        "carga_refrigerada" to 8
    )
    cargaPuerto["carga_peligrosa"] = 5
    println(cargaPuerto)
    cargaPuerto["contenedores"] = 20
    println(cargaPuerto)
    cargaPuerto.remove("carga_refrigerada")
    println(cargaPuerto)
    cargaPuerto.getOrPut("equipos_portuarios"){15}
    println(cargaPuerto)
    cargaPuerto.getOrPut("vehiculos"){15}
    println(cargaPuerto)
}
