fun main() {
    println("Operadores Lógicos en el control del puerto")
    
    val tienePermiso = true
    val estaRegistrado = false
    val estaEnHorario = true
    
    println("&& - AND lógico (todas las condiciones deben cumplirse)")
    println("$tienePermiso && $estaRegistrado = ${tienePermiso && estaRegistrado}")
    println("$estaEnHorario && $tienePermiso = ${estaEnHorario && tienePermiso}")
    
    println("|| - OR lógico (al menos una condición se cumple)")
    println("$tienePermiso || $estaRegistrado = ${tienePermiso || estaRegistrado}")
    println("$estaEnHorario || $estaRegistrado = ${estaEnHorario || estaRegistrado}")
    
    println("! - NOT lógico (negación)")
    println("! $tienePermiso = ${!tienePermiso}")
    println("! $estaEnHorario = ${!estaEnHorario}")
}