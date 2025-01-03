abstract class UseCase<Type, Params> {
  // Future<Either<Failure, Type>> call(Params params);
  Future<Type> call(Params params);
}
