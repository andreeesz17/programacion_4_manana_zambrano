// El constructor primario integra la declaración de propiedades
class Barco(val nombre: String, val eslora: Int)

// Con cuerpo adicional
class Barco2(val nombre: String, val eslora: Int) {
    fun presentarse() = "Soy $nombre y mido $eslora metros de eslora"
    fun esBarcoGrande() = eslora >= 200
}

fun main() {
    val b = Barco("MV Atlantic Star", 185)
    println(b.nombre)   // MV Atlantic Star
    println(b.eslora)   // 185

    val b2 = Barco2("MV Pacific Dream", 150)
    println(b2.presentarse())     // Soy MV Pacific Dream y mido 150 metros de eslora
    println(b2.esBarcoGrande())   // false
}
