import 'package:equatable/equatable.dart';

class Recommends extends Equatable {
  final String? backdropPath;
  final int id;

  const Recommends({
    required this.backdropPath,
    required this.id,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
      ];
}
