import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget settings(store) {
  return Observer(
    builder: (_) {
      return ListView(
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
                                  fontWeight: FontWeight.bold,
                                  color: store.highContrast == false
                                      ? Colors.black
                                      : Color(0xFFFFFFFF)),
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
      );
    },
  );
}
