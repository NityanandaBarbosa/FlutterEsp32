import 'package:dartz/dartz.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';

abstract class IEsp32Repository {
  Future<Either<ConnectionFailure, String>> connectToEsp();
}
