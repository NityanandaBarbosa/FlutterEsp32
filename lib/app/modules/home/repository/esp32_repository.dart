import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_esp32/app/modules/home/model/pin.dart';
import 'i_esp32_repository.dart';
import 'package:http/http.dart' as http;

class Esp32Repository implements IEsp32Repository {
  @override
  Future<Either<ConnectionFailure, List<Pin>>> connectToEsp() async {
    List<Pin> listOfPins = [];
    try {
      var response = await Dio().get("http://192.168.1.1/");
      //fetchEsp();
      if (response?.statusCode == 200) {
        print(response?.data);
        var listPin = response.data.split(",");
        for (var i in listPin) {
          var pinSplit = i.split(":");
          Pin objPin = new Pin(
              door: int.parse(pinSplit[0]), state: int.parse(pinSplit[1]));
          listOfPins.add(objPin);
        }
        return right(listOfPins);
      }
    } on DioError catch (e) {
      print(e);
      // if (e?.response?.statusCode == 404) {
      //   return left(NotConnectedToEsp(e.error));
      // }
      return left(NotConnectedToEsp(e.error.toString()));
    } catch (e) {
      print(e);
      return left(NotConnectedToEsp(e.error));
    }
  }
}
