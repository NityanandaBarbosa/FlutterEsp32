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
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('Flutter ESP32')),
          ),
          body: store.bottomNavIndex == 0 ? _wrapOfButtons() : _config(),
          bottomNavigationBar: Observer(builder: (_) {
            return BottomNavigationBar(
              showUnselectedLabels: false,
              backgroundColor: Colors.blue,
              //ype: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.keyboard_control),
                  label: 'Main',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Configs',
                ),
              ],
              currentIndex: store.bottomNavIndex,
              selectedItemColor: Colors.white,
              onTap: store.setBottomNavIndex,
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await store.tryToConnect();
            },
            child: Icon(Icons.refresh),
          ),
        );
      },
    );
  }

  Widget _config() {
    return Observer(
      builder: (_) {
        return Scaffold(
          body: ListView(
            children: <Widget>[
              new Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                        Expanded(
                            flex: 2,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Settings',
                                  style: new TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Colors.grey,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 50.0),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.verified,
                            color: Colors.grey,
                          ),
                          title: Text("Version"),
                          trailing: Text("1.0.0"),
                        ),
                        ListTile(
                          //onTap: linkendlin,
                          leading: Icon(
                            Icons.brightness_6_outlined,
                            color: Colors.black,
                          ),
                          title: Text("High Contrast"),
                          trailing: Switch(
                              value: store.highContrast,
                              onChanged: store.setHighContrast),
                        ),
                        ListTile(
                          //onTap: _launchURL,
                          leading: Icon(
                            Icons.computer_outlined,
                            color: Colors.black,
                          ),
                          title: Text("GitHub"),
                          trailing: Icon(Icons.arrow_right),
                        ),
                        ListTile(
                          onTap: () {
                            //SystemNavigator.pop();
                          },
                          leading: Icon(
                            Icons.work_off_outlined,
                            color: Colors.black,
                          ),
                          title: Text("LinkedIn"),
                          trailing: Icon(Icons.arrow_right),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
                      .map((item) => _pinButton(item))
                      .toList()),
        );
      },
    );
  }

  Widget _pinButton(Pin pin) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PhysicalModel(
        child: InkWell(
          onTap: () => store.tapButton(pin),
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
        ),
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
          bottomLeft: Radius.circular(5.0),
          bottomRight: Radius.circular(5.0),
        ),
        shadowColor: Colors.black,
        elevation: 15,
        //shape: BoxSh,
      ),
    );
  }
}
