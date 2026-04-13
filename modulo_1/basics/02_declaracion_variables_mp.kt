fun main() {
    val nombreCapitan = "Andrés"
    val numeroMuelle: Int = 19
    val tarifaPuerto = 3.14159
    
    var barcosEnPuerto = 0
    barcosEnPuerto = barcosEnPuerto + 1
    println("Barcos en puerto: $barcosEnPuerto")
    
    barcosEnPuerto = barcosEnPuerto - 1
    println("Barcos en puerto: $barcosEnPuerto")
    
    println("El capitán $nombreCapitan está asignado al muelle $numeroMuelle")
}