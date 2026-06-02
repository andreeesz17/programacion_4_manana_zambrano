fun main() {
  println("Control de Puerto Marítimo - When con Bloques y Niveles de Alerta")
  println("Nombre del Barco")
  val nombreBarco=readLine()?.trim()?.lowercase()?:"Sin Identificacion"
  println("Nivel de Alerta del Puerto (CRITICO/URGENTE/MODERADO/LEVE)")
  val nivel=readLine()?.trim()?.uppercase()?:""


  when (nivel){
      "CRITICO"->{
          println("ALERTA CRITICA: Barco: $nombreBarco")
          println("Llamar al capitan de puerto de guardia")
          println("Activar protocolo de emergencia maritima")
      }
      "URGENTE"->{
          println("URGENTE: Barco: $nombreBarco")
          println("Priorizar en la zona de atraque")
          println("Reevaluar situacion en 15 minutos")
      }
      "MODERADO"->println("Moderado: Barco: $nombreBarco")
      "LEVE"->println("Leve: barco: $nombreBarco continuar espera en rada")
      else -> println("nivel no reconocido")
  }
  }
