import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_esp32/app/modules/home/repository/i_esp32_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'exceptions/connectionFailure.dart';
import 'model/pin.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  final IEsp32Repository esp32repository = Modular.get();

  @observable
  Option<ConnectionFailure> failure;

  @observable
  int bottomNavIndex = 0;

  @observable
  bool connected = false;

  @observable
  List<Pin> espPinList;

  @observable
  bool highContrast = false;

  @action
  setEspReturn(List<Pin> value) => espPinList = value;

  @action
  setBottomNavIndex(int value) => bottomNavIndex = value;

  @action
  setHighContrast(bool value) => highContrast = value;

  @action
  Future tryToConnect() async {
    failure = null;
    final responseConnect = await esp32repository.connectToEsp();
    responseConnect.fold((failureResult) {
      failure = optionOf(failureResult);
      connected = false;
    }, (connect) {
      setEspReturn(connect);
      failure = None();
      connected = true;
    });
  }

  Future tapButton(Pin pin) async {
    var response;
    if (pin.state == 0) {
      response = await esp32repository.turnOnLed(pin);
    } else {
      response = await esp32repository.turnOffLed(pin);
    }
    response.fold((failureResult) {
      failure = optionOf(failureResult);
      connected = false;
    }, (connect) {
      setEspReturn(connect);
      failure = None();
      connected = true;
    });
  }
}
