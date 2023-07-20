part of 'dartz.core.dart';

class Tuple<A, B> {
  final A head;
  final B tail;

  A get value1 => head;
  B get value2 => tail;
  const Tuple(this.head, this.tail);
}

class Tuple3<A, B, C> {
  final A head;
  final B middle;
  final C tail;

  A get value1 => head;
  B get value2 => middle;
  C get value3 => tail;
  const Tuple3(this.head, this.middle, this.tail);
}
