import 'package:arch/core/network/error_message_model.dart';

class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerExceptions(this.errorMessageModel);
}

class LocalDataBaseExceptions implements Exception {
  final String message;
  const LocalDataBaseExceptions(this.message);
}
