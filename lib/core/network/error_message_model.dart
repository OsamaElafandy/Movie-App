import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorMessageModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) {
    return ErrorMessageModel(
      statusCode: json['status_code'] as int,
      statusMessage: json['status_message'] as String,
      success: json['success'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_code': statusCode,
      'status_message': statusMessage,
      'success': success,
    };
  }

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
