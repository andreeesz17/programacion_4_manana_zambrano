class CargaDto {
  final int id;
  final String title;
  final bool completed;

  const CargaDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory CargaDto.fromJson(Map<String, dynamic> json) => CargaDto(
    id:        json['id']        as int,
    title:     json['title']     as String,
    completed: json['completed'] as bool,
  );

  bool get enPuerto => !completed;
}
