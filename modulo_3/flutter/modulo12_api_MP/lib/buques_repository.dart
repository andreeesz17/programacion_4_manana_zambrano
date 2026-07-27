import 'http_client.dart';
import 'buque.dart';
import 'buque_dto.dart';

class BuquesRepository {
  final HttpClient _client;
  const BuquesRepository(this._client);

  Future<List<Buque>> listar({int limit = 20, int offset = 0}) async {
    final data = await _client.get('/products?limit=$limit&offset=$offset');
    return (data as List)
        .map((e) => BuqueDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }

  Future<List<Buque>> buscar(String termino) async {
    final data = await _client.get('/products/?title=$termino');
    return (data as List)
        .map((e) => BuqueDto.fromJson(e as Map<String, dynamic>).toDomain())
        .toList();
  }
}
