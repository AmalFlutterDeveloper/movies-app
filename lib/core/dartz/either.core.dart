part of 'dartz.core.dart';

abstract class Either<L, R> {
  const Either();
  T fold<T>(T Function(L) left, T Function(R) right);
  bool isLeft() => fold((p0) => true, (p0) => false);
  bool isRight() => fold((p0) => false, (p0) => true);
}

class Left<L, R> extends Either<L, R> {
  final L value;
  const Left(this.value);
  @override
  T fold<T>(T Function(L) left, T Function(R) right) => left(value);
}

class Right<L, R> extends Either<L, R> {
  final R value;
  const Right(this.value);

  @override
  T fold<T>(T Function(L) left, T Function(R) right) => right(value);
}
