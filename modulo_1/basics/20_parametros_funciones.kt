fun main() {
    println("Funciones-Parametros por defecto")
    println(crearUsuario("Jhon", 25, "admin", true))
    println(crearUsuario("Luis"))
    println(crearUsuario("Maria", 30))
    println(crearUsuario("Juan", 30, "admin"))
    // Argumentos nombrados
    println(crearUsuario(edad=30, nombre="Andresito", activo=false))
}

fun crearUsuario(
    nombre: String,
    edad: Int = 18,
    rol: String = "viewer",
    activo: Boolean = true
): String {
    return "Usuario[$nombre, edad=$edad, rol=$rol, activo=$activo]"
}