import '../error/failure.dart';
import '../result/result.dart';

abstract class UseCase<Params, Return extends Object?> {
  Future<Result<Failure, Return>> call(Params params);
}

abstract class UseCaseNoParams<Return extends Object?> {
  Future<Result<Failure, Return>> call();
}
