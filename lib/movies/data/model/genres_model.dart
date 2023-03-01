import '../../domain/entities/genres.dart';

class GenresModel extends Genres {
  const GenresModel({required super.id, required super.name});

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
