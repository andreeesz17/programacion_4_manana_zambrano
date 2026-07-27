import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_error.dart';
import 'http_client.dart';
import 'buque.dart';
import 'buques_repository.dart';

// ── 1. Dependencias ───────────────────────────────────────────────────────────
final httpClientProvider =
    Provider<HttpClient>((_) => HttpClient());

final repositoryProvider = Provider<BuquesRepository>(
  (ref) => BuquesRepository(ref.read(httpClientProvider)),
);

// ── 2. Estado ─────────────────────────────────────────────────────────────────
class CatalogoState {
  final List<Buque> buques;
  final bool           cargando;
  final ApiError?      error;
  final int            offset;

  const CatalogoState({
    this.buques = const [],
    this.cargando  = false,
    this.error,
    this.offset    = 0,
  });

  CatalogoState copyWith({
    List<Buque>? buques,
    bool?           cargando,
    ApiError?       error,
    int?            offset,
  }) =>
      CatalogoState(
        buques: buques ?? this.buques,
        cargando:  cargando  ?? this.cargando,
        error:     error,
        offset:    offset ?? this.offset,
      );
}

// ── 3. Notifier ───────────────────────────────────────────────────────────────
class CatalogoNotifier extends Notifier<CatalogoState> {
  @override
  CatalogoState build() => const CatalogoState();

  Future<void> cargar() async {
    state = state.copyWith(cargando: true, error: null, offset: 0);
    try {
      final lista = await ref.read(repositoryProvider).listar(limit: 20, offset: 0);
      state = CatalogoState(buques: lista, offset: 0, cargando: false);
    } on ApiError catch (e) {
      state = CatalogoState(error: e, cargando: false);
    }
  }

  Future<void> buscar(String termino) async {
    if (termino.isEmpty) { await cargar(); return; }
    state = state.copyWith(cargando: true, error: null, offset: 0);
    try {
      final lista = await ref.read(repositoryProvider).buscar(termino);
      state = CatalogoState(buques: lista, cargando: false);
    } on ApiError catch (e) {
      state = CatalogoState(error: e, cargando: false);
    }
  }

  Future<void> cargarMas() async {
    // Si ya está cargando, evitamos duplicar la petición.
    if (state.cargando) return;

    final nuevoOffset = state.offset + 20;
    // Ponemos cargando = true pero preservamos los buques actuales
    state = state.copyWith(cargando: true, error: null);

    try {
      final nuevos = await ref.read(repositoryProvider).listar(limit: 20, offset: nuevoOffset);
      state = state.copyWith(
        buques: [...state.buques, ...nuevos],
        cargando: false,
        offset: nuevoOffset,
      );
    } on ApiError catch (e) {
      state = state.copyWith(cargando: false, error: e);
    }
  }
}

// ── 4. Provider del notifier ──────────────────────────────────────────────────
final catalogoProvider =
    NotifierProvider<CatalogoNotifier, CatalogoState>(CatalogoNotifier.new);
