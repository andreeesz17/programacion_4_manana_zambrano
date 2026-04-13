fun main() {
    println("Operadores de comparación en el puerto")
    
    val capacidadMuelle = 15
    val barcosActuales = 10
    
    println("$capacidadMuelle == $barcosActuales = ${capacidadMuelle == barcosActuales}")
    println("$capacidadMuelle .equals $barcosActuales = ${capacidadMuelle.equals(barcosActuales)}")
    
    println("$capacidadMuelle != $barcosActuales = ${capacidadMuelle != barcosActuales}")
    
    println("$capacidadMuelle > $barcosActuales = ${capacidadMuelle > barcosActuales}")
    println("$capacidadMuelle >= $barcosActuales = ${capacidadMuelle >= barcosActuales}")
    
    println("$capacidadMuelle < $barcosActuales = ${capacidadMuelle < barcosActuales}")
    println("$capacidadMuelle <= $barcosActuales = ${capacidadMuelle <= barcosActuales}")
}