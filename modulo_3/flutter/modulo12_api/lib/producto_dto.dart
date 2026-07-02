import 'producto.dart';

class ProductoDto {
  final int     id;
  final String  name;
  final String  price;
  final bool    isActive;
  final String? categoryName;

  const ProductoDto({
    required this.id,
    required this.name,
    required this.price,
    required this.isActive,
    this.categoryName,
  });

  factory ProductoDto.fromJson(Map<String, dynamic> json) {
    // Standard Platzi API returns category as a map: "category": {"name": "..."}
    // and price as a number. We parse both formats robustly.
    String? parsedCategoryName = json['category_name'] as String?;
    if (parsedCategoryName == null && json['category'] is Map<String, dynamic>) {
      parsedCategoryName = json['category']['name'] as String?;
    }

    return ProductoDto(
      id:           json['id']            as int,
      name:         json['name']          as String,
      price:        json['price']?.toString() ?? '0',
      isActive:     json['is_active']     as bool? ?? true, // Default to true so standard Platzi products show up
      categoryName: parsedCategoryName,
    );
  }

  Producto toDomain() => Producto(
    id:        id,
    nombre:    name,
    precio:    double.tryParse(price) ?? 0.0,
    activo:    isActive,
    categoria: categoryName,
  );
}
