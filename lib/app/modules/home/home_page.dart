import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import 'home_store.dart';

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
      store.failure.map((failure) {
        String message;
        if (failure is ConnectionFailure) {
          message = "Conecte-se ao access point do ESP32!";
        } else {
          message = "I don't know!";
        }
        return edgeAlert(context,
            title: "Error",
            description: message,
            duration: 2,
            icon: Icons.error,
            gravity: Gravity.top,
            backgroundColor: Colors.red);
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
        builder: (_){
          return Center(child: Text(store.connected == false ? "Fail" : "${store.espReturn}"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await store.tryToConnect();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
