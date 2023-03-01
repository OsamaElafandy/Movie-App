import '../../domain/entities/recommends.dart';

class RecommendModel extends Recommends {
  const RecommendModel({required super.backdropPath, required super.id});

  factory RecommendModel.fromJson(Map<String, dynamic> json) {
    return RecommendModel(
      backdropPath: json['backdrop_path'] ?? "/jauI01vUIkPA0xVsamGj0Gs1nNL.jpg",
      id: json['id'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'backdrop_path': backdropPath,
      'id': id,
    };
  }
}
