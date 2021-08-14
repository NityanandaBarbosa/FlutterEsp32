import 'package:dio/dio.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';

import 'package:dartz/dartz.dart';

import 'i_esp32_repository.dart';

class Esp32Repository implements IEsp32Repository {
  @override
  Future<Either<ConnectionFailure, String>> connectToEsp() async {
    try {
      final response = await Dio().get("http://192.168.1.1/");
      return right(response?.data);
    } on DioError catch (e) {
      print(e);
      if (e?.response?.statusCode == 404) {
        return left(NotConnectedToEsp(e.error));
      }
      return left(NotConnectedToEsp(e.error));
    } catch (e) {
      return left(NotConnectedToEsp(e.error));
    }
  }
}
