import 'buque.dart';

class BuqueDto {
  final int     id;
  final String  name;
  final String  price;
  final bool    isActive;
  final String? categoryName;

  const BuqueDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory BuqueDto.fromJson(Map<String, dynamic> json) {
    // Standard Platzi API returns category as a map: "category": {"name": "..."}
    // and price as a number. We parse both formats robustly.
    String? parsedCategoryName = json['category_name'] as String?;
    if (parsedCategoryName == null && json['category'] is Map<String, dynamic>) {
      parsedCategoryName = json['category']['name'] as String?;
    }

    return BuqueDto(
      id:           json['id']            as int,
      name:         json['name']          as String,
      price:        json['price']?.toString() ?? '0',
      isActive:     json['is_active']     as bool? ?? true, // Default to true so standard Platzi products show up
      categoryName: parsedCategoryName,
    );
  }

  Buque toDomain() => Buque(
    id:        id,
    nombre:    name,
    tonelaje:    double.tryParse(price) ?? 0.0,
    activo:    isActive,
    tipo: categoryName,
  );
}
