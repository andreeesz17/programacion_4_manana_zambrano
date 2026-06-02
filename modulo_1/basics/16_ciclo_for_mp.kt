fun main() {
  println("Control de Puerto Marítimo - Ciclo For: Inspección de Contenedores")
  println("For con rango")

  for( i in 1..10){
     val a=5
      println("5x$i=${i*a}")
  }

  println("For con until")
  for( i in 1 until 11){
     val a=5
      println("5x$i=${i*a}")
  }

  println("For con pasos")
  for(i in 1..10 step 3){
      println(i)
  }

  println("For descendente")
  for(i in 10 downTo 1){
      println(i)
  }

  println("For con listas")
  val amarraderos = listOf("Muelle Norte", "Muelle Sur", "Terminal Este")
  for(amarradero in amarraderos){
      println(amarradero)
  }

  println("For con listas index valor")
  for ((index, valor) in amarraderos.withIndex()){
      println("$index->$valor")
  }

  println("For con Brake")
  for(i in 1..10){
      if(i==5){
          break;
      }
  }

  println("For con Continue")
  for(i in 1..10){
      if(i==3){
          continue;
      }
      println("item $i")
  }

   println("For con Continue")
  for(i in 1..10){
      if(i==3) continue;
      if(i==7) break;
      println("item $i")
  }

  val contenedores = listOf(
    Triple("CONT-7821", 22.4, 98),
    Triple("CONT-4453", 28.1, 94),
    Triple("CONT-9910", 30.3, 88),
  )
  for((posicion,contenedor) in contenedores.withIndex()){
      val (codigo, peso, integridad) = contenedor
      val alertaPeso = if(peso>=25.0) "Sobrepeso" else "Normal"
      val alertaIntegridad = if (integridad<90.0) "Danado" else "Optimo"
      println("Patio $posicion - $codigo - Peso: $peso ton $alertaPeso - Integridad: $integridad% $alertaIntegridad")
  }
}
