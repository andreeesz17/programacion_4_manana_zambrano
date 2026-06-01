class CoordenadaAmarradero(val latitud: Double, val longitud: Double)   // solo lectura

class ContadorEmbarques(var valor: Int = 0) {                  // lectura y escritura
    fun incrementar() { valor++ }
    fun resetear()    { valor = 0 }
}

// Sin val/var — parámetro del constructor, NO propiedad
// Solo accesible dentro del bloque init
class RegistroTemporal(codigoBarco: String) {
    val codigoUpper = codigoBarco.uppercase()
    // codigoBarco no existe fuera de aquí
}
