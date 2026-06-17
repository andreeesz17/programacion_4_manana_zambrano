import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Text básico ───────────────────────────────────────────────────────
const Text(
  'nginx-proxy: En línea',
  style: TextStyle(
    fontSize:      20,
    fontWeight:    FontWeight.bold,    // .w100–.w900  ·  .bold = .w700
    color:         Colors.green,
    letterSpacing: 0.5,
    fontStyle:     FontStyle.normal,   // .italic
    decoration:    TextDecoration.underline, // <-- Cambiado: .underline (puedes usar .lineThrough)
    shadows: [                               // <-- Añadido: Sombra
      Shadow(
        color: Colors.black26, 
        blurRadius: 4, 
        offset: Offset(2, 2)
      )
    ], 
  ),
),
const SizedBox(height: 8),

// ── Alineación y desbordamiento ───────────────────────────────────────
SizedBox(
  width: double.infinity,
  child: Text(
    // <-- Cambiado: Texto más largo para probar el salto de línea y la justificación
    'api-gateway-produccion-region-us-east → sin respuesta. El servidor ha agotado el tiempo de espera y se ha desconectado forzosamente debido a la alta latencia.',
    textAlign: TextAlign.justify,       // <-- Cambiado: .justify
    maxLines:  2,                       // <-- Cambiado: 2 líneas permitidas
    overflow:  TextOverflow.fade,       // <-- Cambiado: .fade (cambia a .clip para ver la diferencia)
    softWrap:  false,                   // <-- Añadido: Evita que el texto salte de línea
  ),
),
const SizedBox(height: 8),

// ── Text.rich — estilos distintos en un solo widget ───────────────────
const Text.rich(
  TextSpan(children: [
    TextSpan(text: 'Estado: ',
        style: TextStyle(fontWeight: FontWeight.w600)),
    TextSpan(text: 'CRÍTICO',
        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
    TextSpan(text: ' — última revisión hace 5 min',
        style: TextStyle(color: Colors.grey, fontSize: 12)),
  ]),
),
const SizedBox(height: 8),

// ── SelectableText — el usuario puede seleccionar y copiar ───────────
const SelectableText(
  '10.0.0.12:5432',
  style: TextStyle(fontFamily: 'monospace', fontSize: 14),
),
const Divider(height: 32),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Tooltip(
      message: 'Servidor activo',
      child: Icon(
        Icons.check_circle_outline, 
        size: 80, 
        color: Theme.of(context).colorScheme.primary,
      ),
    ),
    const Icon(Icons.cancel,        size: 14, color: Colors.red),
    const Icon(Icons.warning_amber, size: 40, color: Colors.orange),
    const Icon(Icons.dns,           size: 40, color: Color.fromARGB(255, 211, 10, 151)),
    const Icon(Icons.wifi_off,      size: 40, color: Colors.grey),
  ],
),
const SizedBox(height: 8),
const Icon(
  Icons.settings,
  size:          24,
  color:         Colors.blueGrey,
  semanticLabel: 'Configuración',
),
const Divider(height: 32),
// ── Cuatro variantes ──────────────────────────────────────────────────
Wrap(
  spacing: 8, runSpacing: 8,
  children: [
    ElevatedButton(onPressed: () {}, child: const Text('ElevatedButton')),
    FilledButton(  onPressed: () {}, child: const Text('FilledButton')),
    OutlinedButton(onPressed: () {}, child: const Text('OutlinedButton')),
    TextButton(    onPressed: () {}, child: const Text('TextButton')),
    ElevatedButton(onPressed: () {}, child: const Text('Desactivado')),
  ],
),
const SizedBox(height: 12),

// ── Variantes .icon ───────────────────────────────────────────────────
Wrap(
  spacing: 8, runSpacing: 8,
  children: [
    ElevatedButton.icon(
      onPressed: () {},
      icon:  const Icon(Icons.refresh, size: 18),
      label: const Text('hola'),
    ),
    FilledButton.icon(
      onPressed: () {},
      icon:  const Icon(Icons.stop, size: 18),
      label: const Text('chao'),
    ),
    TextButton.icon(
      onPressed: () {},
      icon:  const Icon(Icons.play_arrow, size: 18),
      label: const Text('buenas tardes'),
    ),
    OutlinedButton.icon(
      onPressed: () {},
      icon:  const Icon(Icons.pause, size: 18),
      label: const Text('buenos dias'),
    ),
    IconButton(
      onPressed: () {},
      icon:     const Icon(Icons.settings),
      color:    const Color.fromARGB(255, 77, 181, 63),
      iconSize: 28,
      tooltip:  'Date de baja bro',
    ),
  ],
),
const SizedBox(height: 12),

// ── Botón con estilo personalizado ────────────────────────────────────
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 247, 6, 214),
    foregroundColor: const Color.fromARGB(255, 124, 241, 177),
    padding:     const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
    shape:       const StadiumBorder(),
    elevation:   12, // Prueba cambiar a 0 para verlo plano
  ),
  child: const Text(
    'SEMESTRE EN PELIGRO',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
),
const Divider(height: 32),
// Agrega a children: [ ... ]

Card(
  elevation: 12, // <-- Cambiado: 12 para sombra pronunciada (puedes poner 0 para tarjeta plana)
  color: Colors.red.shade50, // <-- Añadido: Fondo coloreado
  margin: const EdgeInsets.only(bottom: 8),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  child: ListTile(
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // <-- Añadido: Espaciado interno
    leading:  const Icon(Icons.dns, color: Colors.indigo),
    title:    const Text('nginx-proxy'),
    // <-- Cambiado: Subtítulo largo para forzar el crecimiento de la tarjeta
    subtitle: const Text('10.0.0.5 · 45ms\nEl servidor ha estado experimentando latencia intermitente durante la última hora.'),
    isThreeLine: true, // <-- Añadido: Permite que el ListTile acomode más texto verticalmente
    trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
    onTap:    () {},           // toda la fila queda tocable
  ),
),
Card(
  elevation: 1,
  child: ListTile(
    leading: CircleAvatar(
      backgroundColor: Colors.red.shade100,
      child: const Icon(Icons.cancel, color: Colors.red, size: 20),
    ),
    title:    const Text('backup-worker'),
    subtitle: const Text('sin respuesta · 10.0.0.30'),
    trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
  ),
),

// <-- Añadido: Variante de tarjeta con SwitchListTile integrado
Card(
  child: SwitchListTile(
    value: false, 
    onChanged: (_) {}, 
    title: const Text('Modo mantenimiento'),
  ),
),

const Divider(height: 32),
// Agrega a children: [ ... ]

Wrap(
  spacing: 8, runSpacing: 8,
  children: [
    Chip(
      label: const Text('nginx'),
      padding: const EdgeInsets.all(8),               // <-- Añadido: Más espacio interior
      deleteIcon: const Icon(Icons.close, size: 16),  // <-- Añadido: Ícono de la X
      onDeleted: () {},                               // <-- Añadido: Activa la X para poder borrar
    ),
    const Chip(
      avatar:          Icon(Icons.check, size: 16, color: Colors.white),
      label:           Text('TLS 1.3'),
      backgroundColor: Colors.blue,                   // <-- Cambiado: De verde a azul
      labelStyle:      TextStyle(color: Colors.white, fontSize: 12),
    ),
    FilterChip(
      label:      const Text('HTTP/2'),
      selected:   false,                              // <-- Cambiado: a false (desaparece el estilo de selección)
      onSelected: (_) {},
    ),
    ActionChip(
      label:     const Text('Ver logs'),
      avatar:    const Icon(Icons.open_in_new, size: 16),
      onPressed: () {},
    ),
    // <-- Añadido: InputChip que combina avatar, label, selected y onDeleted
    InputChip(
      avatar:     const Icon(Icons.admin_panel_settings, size: 16),
      label:      const Text('Usuario Admin'),
      selected:   true,
      onSelected: (_) {},
      onDeleted:  () {},
    ),
  ],
),
const Divider(height: 32),
// Agrega a children: [ ... ]

// ── Circular ──────────────────────────────────────────────────────────
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [ // Se quitó 'const' de la lista para permitir el shade200
    const SizedBox(width: 48, height: 48,
      child: CircularProgressIndicator()),
    SizedBox(width: 48, height: 48,
      child: CircularProgressIndicator(
        value:           null,                 // <-- Cambiado: de 0.7 a null (animación continua)
        color:           Colors.green,
        strokeWidth:     6,
        backgroundColor: Colors.grey.shade200, // <-- Añadido: La pista ahora es visible
      )),
    Transform.scale(                           // <-- Añadido: Escala a 0.5 sin cambiar el strokeWidth
      scale: 0.5,
      child: const SizedBox(width: 48, height: 48,
        child: CircularProgressIndicator(
          value:       0.3,
          color:       Colors.red,
          strokeWidth: 3,
          strokeCap:   StrokeCap.round,
        )),
    ),
  ],
),
const SizedBox(height: 16),

// ── Lineal ────────────────────────────────────────────────────────────
const LinearProgressIndicator(),                                  // indeterminado
const SizedBox(height: 8),
const LinearProgressIndicator(value: 0.6, color: Colors.indigo),  // 60 %
const SizedBox(height: 8),
const LinearProgressIndicator(
  value:     1.0,
  color:     Colors.green,
  minHeight: 12,                                                  // <-- Cambiado: de 6 a 12
),
const Divider(height: 32),
          // ← pega aquí cada bloque al avanzar
        ],
      ),
    );
  }
}