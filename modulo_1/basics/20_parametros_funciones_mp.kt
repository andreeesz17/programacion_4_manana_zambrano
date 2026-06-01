fun main() {
    println("Control de Puerto Marítimo - Funciones con Parámetros por Defecto: Registro de Operadores")
    println(crearOperador("Jhon", 25, "supervisor", true))
    println(crearOperador("Luis"))
    println(crearOperador("Maria", 30))
    println(crearOperador("Juan", 30, "supervisor"))
    // Argumentos nombrados
    println(crearOperador(experiencia=30, nombre="Andresito", activo=false))
}

fun crearOperador(
    nombre: String,
    experiencia: Int = 18,
    cargo: String = "operador",
    activo: Boolean = true
): String {
    return "OperadorPortuario[$nombre, experiencia=$experiencia, cargo=$cargo, activo=$activo]"
}
