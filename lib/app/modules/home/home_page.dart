import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flutter ESP32')),
      ),
      body: Observer(
        builder: (_) {
          return Center(
            child: store.connected == false
                ? Text("Fail")
                : Wrap(
                    children: store.espPinList
                        .map((item) => _pinButton(item))
                        .toList()),
          );
          // : ListView.builder(
          //     itemCount: store.espPinList.length,
          //     itemBuilder: (context, index) {
          //       return _pinButton(store.espPinList[index].door);
          //       //Text("${store.espPinList[index].door} ${store.espPinList[index].state} ");
          //     }),
          //);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await store.tryToConnect();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget _pinButton(Pin pin) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.25,
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
              bottomLeft: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(pin.state == 1
                      ? Icons.power_settings_new
                      : Icons.power_off_sharp),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text("G${pin.door}"),
                ),
                Text(pin.state == 0 ? "Off" : "On")
              ],
            ),
          ),
        ),
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
        shadowColor: Colors.black87,
        elevation: 15,
        //shape: BoxSh,
      ),
    );
  }
}
