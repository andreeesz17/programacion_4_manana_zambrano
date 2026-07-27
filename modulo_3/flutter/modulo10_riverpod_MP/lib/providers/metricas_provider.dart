// lib/providers/metricas_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_muelle.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaMuelle>> {
  // build() puede ser async — es la carga inicial
  @override
  Future<List<MetricaMuelle>> build() => _fetch();

  Future<List<MetricaMuelle>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaMuelle(
        muelle: 'prod-web-01',
        cpu: 45.2,
        ram: 62.1,
        conexiones: 230,
        ssd: 12,
      ),
      MetricaMuelle(
        muelle: 'prod-db-01',
        cpu: 88.1,
        ram: 91.2,
        conexiones: 80,
        ssd: 12,
      ),
      MetricaMuelle(
        muelle: 'staging-api',
        cpu: 22.4,
        ram: 41.0,
        conexiones: 50,
        ssd: 12,
      ),
      MetricaMuelle(
        muelle: 'dev-nest-api',
        cpu: 22.4,
        ram: 41.0,
        conexiones: 50,
        ssd: 12,
      ),
      MetricaMuelle(
        muelle: 'dev-db-api',
        cpu: 22.4,
        ram: 41.0,
        conexiones: 50,
        ssd: 12,
      ),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasProvider =
    AsyncNotifierProvider<MetricasNotifier, List<MetricaMuelle>>(
      MetricasNotifier.new,
    );
