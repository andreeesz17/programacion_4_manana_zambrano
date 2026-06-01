fun main() {
  println("Control de Puerto Marítimo - When con Condiciones Arbitrarias")
  println("Sistema de Tarifas Portuarias")
  println("Tonelaje del barco (TRB)")
  val tonelajeBarco=readLine()?.toIntOrNull()?:0
  println("Tiene convenio con el puerto (s/n)")
  val tieneConvenio = readLine()?.trim()?.lowercase()=="s"
  val nivelConvenio = if(tieneConvenio){
      println("Nivel del convenio (BASICO/INTERMEDIO/PREMIUM)")
      readLine()?.trim()?.uppercase()?:""
  } else ""
  val tarifa = when{
     !tieneConvenio && tonelajeBarco <500 -> 0.0
     !tieneConvenio && tonelajeBarco >=5000 -> 15.0
     !tieneConvenio -> 45.0
     nivelConvenio == "BASICO" -> 20.0
     nivelConvenio == "INTERMEDIO" -> 10.0
     nivelConvenio == "PREMIUM" -> 0.0
     else -> 30.0
  }
  println("Tarifa portuaria: $${"%.2f".format(tarifa)}")
}
