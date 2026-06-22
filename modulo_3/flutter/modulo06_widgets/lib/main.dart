import 'package:flutter/material.dart';
import 'package:modulo06_widgets/widgets/catalogo_basicos.dart';
import 'package:modulo06_widgets/widgets/contador_limitado.dart';
import 'package:modulo06_widgets/widgets/etiqueta.dart';
import 'package:modulo06_widgets/widgets/pantalla_contexto.dart';
import 'package:modulo06_widgets/widgets/reloj.dart';
import 'package:modulo06_widgets/widgets/servicio_estado.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1   StatelessWidget mínimo                             │
// │  2  Paso 1b  Widgets básicos — catálogo                        │
// │  3  Paso 2   StatelessWidget con parámetros                     │
// │  4  Paso 3   StatefulWidget / setState / cambio de estatus      │
// │  5  Paso 3b  Parámetros en StatefulWidget                       │
// │  6  Paso 4   Ciclo de vida con Timer                            │
// │  7  Paso 5   BuildContext                                        │
// │  8  Paso 6   Composición de widgets                             │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 7;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.deepPurple,          // ← cambia aquí
      brightness: Brightness.dark,     // ← Brightness.dark para modo oscuro
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Activo',    color: Colors.green),
            Etiqueta(texto: 'Error',     color: Colors.red,    relleno: true),
            Etiqueta(texto: 'En espera', color: Colors.orange),
            Etiqueta(texto: 'Crítico',   color: Colors.red,    fontSize: 16, relleno: true),
            Etiqueta(texto: 'Info',      color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'nginx-proxy'),
      ),
    ),
    5 => Scaffold(                               // Paso 3b
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Intentos de login',
              limite:   1,
              color:    Colors.deepPurple,
              textoBoton: 'Intentar',
              onLimite: () => debugPrint('¡Cuenta bloqueada!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Conexiones activas',
              limite:   10,
              color:    Colors.indigo, textoBoton: '',
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(                              // Paso 4
      appBar: AppBar(title: const Text('Cronómetro')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),    // Paso 5 — ya tiene su propio Scaffold
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
  
));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {
    // describe cómo se ve
    return const SelectableText(
      'Aunque la NOAA detectó condiciones asociadas al fenómeno y modelos anticipan un evento entre moderado y fuerte, aún no hay evidencias lo que serán los impactos.',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepPurple,
        shadows: [
          Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(4, 4)),
        ]
      ),
      textAlign: TextAlign.left,
      //overflow: TextOverflow.ellipsis,
      maxLines: 3,
    );
  }
}