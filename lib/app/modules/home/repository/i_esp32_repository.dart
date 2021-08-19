import 'package:dartz/dartz.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';
import 'package:flutter_esp32/app/modules/home/model/pin.dart';

abstract class IEsp32Repository {
  Future<Either<ConnectionFailure, List<Pin>>> connectToEsp();
}
