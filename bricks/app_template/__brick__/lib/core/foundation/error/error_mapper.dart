import 'failure.dart';

abstract class ErrorMapper {
  Failure map(Object error, [StackTrace? stackTrace]);
}
