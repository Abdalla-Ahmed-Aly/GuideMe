import 'package:guide_me/core/errors/failure_code.dart';

abstract class Failure {
  final FailureCode failureCode;
  final String? message;

  const Failure({this.message, required this.failureCode});
}

class AppFailure extends Failure {
  const AppFailure({
    required super.failureCode,
    super.message,
  });
}