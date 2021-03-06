import 'package:flutter/material.dart';
import 'package:flutter_esp32/app/modules/home/exceptions/connectionFailure.dart';
import 'package:flutter_esp32/app/modules/home/widgets/alerts.dart';
import 'package:flutter_esp32/app/modules/home/widgets/bottomNavigator.dart';
import 'package:flutter_esp32/app/modules/home/widgets/pinButton.dart';
import 'package:flutter_esp32/app/modules/home/widgets/settings.dart';
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
      store.failure.fold(() {
        successAlert(context);
      }, (failure) {
        if (failure is ConnectionFailure) {
          failAlert(context);
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
            backgroundColor: store.highContrast == false ? Colors.blue : Color(0xFF333333),
            title: Center(
                child: Text(
              'Flutter ESP32',
              style: TextStyle(fontSize: 23 + 2.0 * store.fontSizeSelect, color: Color(0xFFFFFFFF)),
            )),
          ),
          body: Container(
            decoration: BoxDecoration(
              color: store.highContrast == false ? Colors.white : Color(0xFF000000),
            ),
            child: (store.bottomNavIndex == 0 ? _wrapOfButtons() : settings(store, context)),
          ),
          bottomNavigationBar: btnNavigator(store),
          floatingActionButton: Semantics(
            label: "Refresh",
            button: true,
            excludeSemantics: true,
            onTap: () async {
              await store.tryToConnect();
            },
            child: FloatingActionButton(
              backgroundColor: store.highContrast == false ? Colors.blue : Color(0xFFFFFF00),
              onPressed: () async {
                await store.tryToConnect();
              },
              child: Icon(
                Icons.refresh,
                semanticLabel: "Refresh",
                color: store.highContrast == false ? Colors.white : Colors.black87,
              ),
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
          child: store.connected == null ?  CircularProgressIndicator() : store.connected == false
              ? SizedBox(
                  width: 200,
                  height: 100,
                  child: PhysicalModel(
                    child: Card(
                      color: store.highContrast == false ? Colors.white : Color(0xFF333333),
                      child: Center(
                        child: Text(
                          "Fail",
                          style: TextStyle(color: store.highContrast == false ? Colors.black : Colors.white, fontSize: store.fontSizeSelect <= 1 ? 20 : 20 + 2.0 * store.fontSizeSelect),
                        ),
                      ),
                    ),
                    color: store.highContrast == false ? Colors.black12 : Color(0xFFFFFF00),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5.0),
                      topRight: Radius.circular(5.0),
                      bottomLeft: Radius.circular(5.0),
                      bottomRight: Radius.circular(5.0),
                    ),
                    shadowColor: store.highContrast == false ? Colors.black87 : Color(0xFFFFFF00),
                    elevation: 25,
                  ),
                )
              : Wrap(children: store.espPinList.map((item) => pinButton(item, context, store)).toList()),
        );
      },
    );
  }
}
