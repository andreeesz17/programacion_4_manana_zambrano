// lib/providers/muellees_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/muelle_ssh.dart';

// NotifierProvider — estado complejo con mécargas propios
class MuellesNotifier extends Notifier<List<MuelleSSH>> {
  @override
  List<MuelleSSH> build() => [
    MuelleSSH(id:'1', nombre:'prod-web-01', ip:'10.0.2.10', puerto:22,   ssl:true,  favorito:true),
    MuelleSSH(id:'2', nombre:'prod-db-01',  ip:'10.0.2.20', puerto:22,   ssl:true),
    MuelleSSH(id:'3', nombre:'staging-api', ip:'10.0.3.10', puerto:2222, ssl:false),
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? MuelleSSH(id:s.id, nombre:s.nombre, ip:s.ip,
                        puerto:s.puerto, ssl:s.ssl,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(MuelleSSH muelle) {
    state = [...state, muelle];
  }
}

final muelleesProvider =
    NotifierProvider<MuellesNotifier, List<MuelleSSH>>(
  MuellesNotifier.new,
);

// Filtro de búsqueda — estado primitivo
final busquedaProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO — se recalcula cuando cualquiera de sus dependencias cambia
final muelleesFiltradosProvider = Provider<List<MuelleSSH>>((ref) {
  final cargas    = ref.watch(muelleesProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return cargas;

  final q = busqueda.toLowerCase();
  return cargas.where((s) =>
      s.nombre.toLowerCase().contains(q) || s.ip.contains(q)
  ).toList();
  // Cuando 'muelleesProvider' o 'busquedaProvider' cambian,
  // este provider se recalcula automáticamente.
});