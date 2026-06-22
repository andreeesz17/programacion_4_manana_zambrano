import 'package:flutter/material.dart';

class ServicioEstado extends StatefulWidget {
  final String nombre;
  const ServicioEstado({super.key, required this.nombre});

  @override
  State<ServicioEstado> createState() => _ServicioEstadoState();
}

class _ServicioEstadoState extends State<ServicioEstado> {
  bool _activo    = true;
  int  _reinicios = 0;

  // Cambiado de 3 a 1
  static const int _maxReinicios = 1;

  String nivel = 'normal';

  void _actualizarNivel() {
    if (_reinicios >= 2) {
      nivel = 'critico';
    } else if (_reinicios >= 1) {
      nivel = 'warning';
    } else {
      nivel = 'normal';
    }
  }

  // Lógica para definir el color del ícono según el nivel
  Color _obtenerColorIcono() {
    if (!_activo) return Colors.red; 
    if (nivel == 'critico') return Colors.purple; // Color para crítico
    if (nivel == 'warning') return Colors.orange; // Color para warning
    return Colors.green; // Color para normal
  }

  void _toggle() {
    setState(() {
      _activo = !_activo;
      if (_activo) _reinicios++;
      _actualizarNivel();
    });
  }

  @override
  Widget build(BuildContext context) {
    final enLimite = _reinicios >= _maxReinicios;

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            _activo ? Icons.wifi : Icons.wifi_off,
            size:  72,
            color: _obtenerColorIcono(),
          ),
          const SizedBox(height: 8),

          Text(widget.nombre,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),

          // Agregado fontStyle condicional
          Text(
            _activo ? 'En línea' : 'Fuera de línea',
            style: TextStyle(
              fontSize:   15,
              fontWeight: FontWeight.w600,
              fontStyle:  _activo ? FontStyle.normal : FontStyle.italic,
              color:      _activo ? Colors.green.shade700 : Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),

          if (!_activo)
            Container(
              margin:     const EdgeInsets.only(bottom: 16),
              padding:    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color:        Colors.red.shade50,
                borderRadius: BorderRadius.circular(8),
                border:       Border.all(color: Colors.red.shade300),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.warning_amber, color: Colors.red, size: 16),
                  SizedBox(width: 6),
                  Text('Requiere atención',
                      style: TextStyle(color: Colors.red, fontSize: 13)),
                ],
              ),
            ),

          // Cambiado a ElevatedButton.icon
          ElevatedButton.icon(
            onPressed: enLimite ? null : _toggle,
            icon: Icon(_activo ? Icons.stop : Icons.play_arrow),
            label: Text(_activo ? 'Detener servicio' : 'Iniciar servicio'),
            style: ElevatedButton.styleFrom(
              backgroundColor: _activo ? Colors.red.shade600 : Colors.green.shade600,
            ),
          ),
          const SizedBox(height: 12),

          // Opacidad cambiada a 0.1 cuando está en límite
          Opacity(
            opacity: enLimite ? 0.1 : 1.0,
            child: Text(
              'Reinicios: $_reinicios / $_maxReinicios ($nivel)',
              style: TextStyle(
                fontSize: 13,
                color:    enLimite ? Colors.red : Colors.grey.shade600,
              ),
            ),
          ),

          if (enLimite)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                'Límite de reinicios alcanzado',
                style: TextStyle(
                    fontSize: 12, color: Colors.red.shade700, fontWeight: FontWeight.bold),
              ),
            ),
          
          const SizedBox(height: 16),

          // Botón TextButton para reiniciar todo el estado
          TextButton(
            onPressed: () {
              setState(() {
                _activo = true;
                _reinicios = 0;
                nivel = 'normal';
              });
            },
            child: const Text('Reiniciar todo'),
          ),
        ],
      ),
    );
  }
}