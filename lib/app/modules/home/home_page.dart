import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';
import 'package:flutter_esp32/app/modules/home/widgets/pinButton.dart';
import 'package:flutter_esp32/app/modules/home/widgets/settings.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'home_store.dart';
import 'model/pin.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.tryToConnect();
    reaction((_) => store.failure, (_) {
      String message;
      store.failure.fold(() {
        message = "Connected to ESP32";

        edgeAlert(context,
            title: "Success",
            description: message,
            duration: 2,
            icon: Icons.check,
            gravity: Gravity.top,
            backgroundColor: Colors.green);
      }, (failure) {
        if (failure is ConnectionFailure) {
          message = "Connect to the ESP32 access point!";
          edgeAlert(context,
              title: "Error",
              description: message,
              duration: 2,
              icon: Icons.error,
              gravity: Gravity.top,
              backgroundColor: Colors.red);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                store.highContrast == false ? Colors.blue : Colors.black87,
            title: Center(
                child: Text(
              'Flutter ESP32',
              style: TextStyle(color: Color(0xFFFFFFFF)
                  // ? Colors.white
                  // : Color(0xFFFFFF00),
                  ),
            )),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: store.highContrast == false
                  ? Colors.white
                  : Color(0xFF000000),
            ),
            child: (store.bottomNavIndex == 0
                ? _wrapOfButtons()
                : settings(store)),
          ),
          bottomNavigationBar: Observer(builder: (_) {
            return BottomNavigationBar(
              showUnselectedLabels: true,
              backgroundColor:
                  store.highContrast == false ? Colors.blue : Colors.black87,
              //ype: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.keyboard_control),
                  label: 'Main',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
              currentIndex: store.bottomNavIndex,
              selectedItemColor: store.highContrast == false
                  ? Color(0xFFFFFF00)
                  : Colors.white,
              onTap: store.setBottomNavIndex,
            );
          }),
          floatingActionButton: FloatingActionButton(
            backgroundColor:
                store.highContrast == false ? Colors.blue : Color(0xFFFFFF00),
            onPressed: () async {
              await store.tryToConnect();
            },
            child: Icon(
              Icons.refresh,
              color:
                  store.highContrast == false ? Colors.white : Colors.black87,
            ),
          ),
        );
      },
    );
  }

  Widget _wrapOfButtons() {
    return Observer(
      builder: (_) {
        return Center(
          child: store.connected == false
              ? Text("Fail")
              : Wrap(
                  children: store.espPinList
                      .map((item) => pinButton(item, context, store))
                      .toList()),
        );
      },
    );
  }
}
