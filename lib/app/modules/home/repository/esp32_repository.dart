import 'package:dio/dio.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_esp32/app/modules/home/model/pin.dart';
import 'i_esp32_repository.dart';

class Esp32Repository implements IEsp32Repository {
  @override
  Future<Either<ConnectionFailure, List<Pin>>> connectToEsp() async {
    List<Pin> listOfPins = [];
    try {
      var response = await Dio().get("http://192.168.1.1/");
      //fetchEsp();
      if (response?.statusCode == 200) {
        listOfPins = generateListOfPin(response.data);
        return right(listOfPins);
      }
    } on DioError catch (e) {
      return left(NotConnectedToEsp(e.error.toString()));
    } catch (e) {
      print(e);
      return left(NotConnectedToEsp(e.error));
    }
  }

  @override
  Future<Either<ConnectionFailure, List<Pin>>> turnOffLed(pin) async {
    List<Pin> listOfPins;
    try {
      var response = await Dio().get("http://192.168.1.1/led_off${pin.door}");
      if (response?.statusCode == 200) {
        listOfPins = generateListOfPin(response.data);
        return right(listOfPins);
      }
    } on DioError catch (e) {
      if (e?.response?.statusCode == 404) {
        return left(WrongEspDoor(e.error));
      }
      return left(NotConnectedToEsp(e.error.toString()));
    } catch (e) {
      return left(NotConnectedToEsp(e.error));
    }
  }

  @override
  Future<Either<ConnectionFailure, List<Pin>>> turnOnLed(pin) async {
    List<Pin> listOfPins = [];
    try {
      var response = await Dio().get("http://192.168.1.1/led_on${pin.door}");
      if (response?.statusCode == 200) {
        listOfPins = generateListOfPin(response.data);
        return right(listOfPins);
      }
    } on DioError catch (e) {
      print(e);
      if (e?.response?.statusCode == 404) {
        return left(WrongEspDoor(e.error));
      }
      return left(NotConnectedToEsp(e.error.toString()));
    } catch (e) {
      return left(NotConnectedToEsp(e.error));
    }
  }

  @override
  List<Pin> generateListOfPin(data) {
    List<Pin> listOfPins = [];
    List<String> listPin = data.split(",");
    for (var i in listPin) {
      var pinSplit = i.split(":");
      Pin objPin =
          new Pin(door: int.parse(pinSplit[0]), state: int.parse(pinSplit[1]));
      listOfPins.add(objPin);
    }
    return listOfPins;
  }
}
