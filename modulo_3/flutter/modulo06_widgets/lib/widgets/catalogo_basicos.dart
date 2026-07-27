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
          // ← pega aquí cada bloque al avanzar
          // ── Text básico ───────────────────────────────────────────────────────
          const Text(
            'nginx-proxy: En línea',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold, // .w100–.w900  ·  .bold = .w700
              color: Colors.green,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal, // .italic
              decoration: TextDecoration.lineThrough,
              shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))]
              //             .underline  .lineThrough  .overline
            ),
          ),
          const SizedBox(height: 8),

          // ── Alineación y desbordamiento ───────────────────────────────────────
          SizedBox(
            width: double.infinity,
            child: Text(
              'api-gateway-produccion-region-us-east → sin respuesta',
              textAlign:
                  TextAlign.justify, // .left  .right  .justify  .start  .end
              maxLines: 2,
              overflow: TextOverflow.fade, 
              softWrap: false// .clip  .fade  .visible
            ),
          ),
          const SizedBox(height: 8),

          // ── Text.rich — estilos distintos en un solo widget ───────────────────
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'CRÍTICO',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — última revisión hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
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
              Icon(Icons.check_circle, size: 80, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.cancel, size: 80, color: Colors.red),
              const Icon(Icons.warning_amber, size: 80, color: Colors.orange),
              const Icon(Icons.dns, size: 14, color: Colors.indigo),
              const Icon(Icons.wifi_off, size: 14, color: Colors.grey),
              

              
            ],
          ),
          const SizedBox(height: 8),
          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración',
          ), // leído por lectores de pantalla
          const Divider(height: 32),

          // ── Cuatro variantes ──────────────────────────────────────────────────
        Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(onPressed: () {}, child: const Text('FilledButton'),
              ),
              TextButton(onPressed: () {}, child: const Text('FilledButton')),
              ElevatedButton(onPressed: () {}, child: const Text('Desactivado')),
              //             ↑ onPressed: null → desactiva el botón visualmente
            ],
          ),
          const SizedBox(height: 12),

          // ── Variantes .icon ───────────────────────────────────────────────────
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Reiniciar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Detener'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.indigo,
                iconSize: 28,
                tooltip: 'Detiene todos los servicios'
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ── Botón con estilo personalizado ────────────────────────────────────
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 0,
               // ocupa todo el ancho
            ),
            child: const Text(
              'Acción crítica',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),


          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            
            ),
            color: Colors.red.shade50,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              leading: const Icon(Icons.dns, color: Colors.indigo),
              title: const Text('nginx-proxy'),
              subtitle: const Text('Aunque la NOAA detectó condiciones asociadas al fenómeno y modelos anticipan un evento entre moderado y fuerte, aún no hay evidencias lo que serán los impactos.'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              isThreeLine: true,
              onTap: () {}, // toda la fila queda tocable
            ),
          ),
          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title: const Text('backup-worker'),
              subtitle: const Text('sin respuesta · 10.0.0.30'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          const Divider(height: 32),
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Modo mantenimiento'),
            ),
          ),
          const Divider(height: 32),


          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              const Chip(label: Text('nginx')),
              const Chip(label: Text('Python')),
              const Chip(label: Text('CSS')),
              const Chip(label: Text('Kotlin')),
              const Chip(
                avatar: Icon(Icons.check, size: 16, color: Colors.white),
                label: Text('TLS 1.3'),
                backgroundColor: Colors.blue,
                labelStyle: TextStyle(color: Colors.white, fontSize: 12),
              ),
              FilterChip(
                onDeleted: () {},
                deleteIcon: const Icon(Icons.close, size: 16),
                label: const Text('HTTP/2'),
                selected: false,
                onSelected: (_) {},
                padding: const EdgeInsets.all(8),
              ),
              ActionChip(
                label: const Text('Ver logs'),
                avatar: const Icon(Icons.open_in_new, size: 16),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(height: 32),

          // Agrega a children: [ ... ]

// ── Circular ──────────────────────────────────────────────────────────
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    const SizedBox(width: 48, height: 48,
      child: CircularProgressIndicator()),           // value: null → animación continua
    SizedBox(width: 48, height: 48,
      child: CircularProgressIndicator(
        value:       null,           // CAMBIO: 0.7 -> null (pasa a animación continua)
        color:       Colors.green,
        strokeWidth: 6,
        backgroundColor: Colors.grey.shade200, // CAMBIO: Se agregó pista visible
      )),
    SizedBox(width: 48, height: 48,
      child: CircularProgressIndicator(
        value:       0.3,
        color:       Colors.red,
        strokeWidth: 3,
        strokeCap:   StrokeCap.round,   // puntas redondeadas
        backgroundColor: Colors.grey.shade200, // CAMBIO: Se agregó pista visible
      )),
    // CAMBIO: Se agregó un indicador envuelto en Transform.scale
    Transform.scale(
      scale: 0.5,
      child: const SizedBox(
        width: 48,
        height: 48,
        child: CircularProgressIndicator(),
      ),
    ),
  ],
),
const SizedBox(height: 16),

// ── Lineal ────────────────────────────────────────────────────────────
const LinearProgressIndicator(),                                  // indeterminado
const SizedBox(height: 8),
const LinearProgressIndicator(value: null, color: Colors.indigo), // 60 %
const SizedBox(height: 8),
const LinearProgressIndicator(
  value:     1.0,
  color:     Colors.green,
  minHeight: 12,                     // CAMBIO: minHeight: 6 -> 12
),
const Divider(height: 32),

        ],
      ),
    );
  }
}