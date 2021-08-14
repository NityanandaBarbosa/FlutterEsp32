import 'package:dartz/dartz.dart';

abstract class IEsp32Repository {
  Future<Either<ConnectFailure, String>> connectToEsp();
}
