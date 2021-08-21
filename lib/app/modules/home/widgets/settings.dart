import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget settings(store, ctx) {
  return Observer(
    builder: (_) {
      return Column(
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
                                  fontSize: store.fontSizeSelect <= 1
                                      ? 30
                                      : 30 + 2.0 * store.fontSizeSelect,
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
                color: store.highContrast == false
                    ? Colors.white
                    : Color(0xFF333333),
                elevation: 2.0,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.verified,
                        size: store.fontSizeSelect <= 1
                            ? 25
                            : 25 + 2.0 * store.fontSizeSelect,
                        color: store.highContrast == false
                            ? Colors.black
                            : Colors.white,
                      ),
                      title: Text(
                        "Version",
                        style: TextStyle(
                          fontSize: store.fontSizeSelect <= 1
                              ? 15
                              : 15 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      trailing: Text(
                        "1.0.0",
                        style: TextStyle(
                          fontSize: store.fontSizeSelect <= 1
                              ? 15
                              : 15 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                    ListTile(
                      //onTap: linkendlin,
                      leading: Icon(Icons.brightness_6_outlined,
                          size: store.fontSizeSelect <= 1
                              ? 25
                              : 25 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Colors.white),
                      title: Text(
                        "High Contrast",
                        style: TextStyle(
                          fontSize: store.fontSizeSelect <= 1
                              ? 15
                              : 15 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                      trailing: Switch(
                        value: store.highContrast,
                        onChanged: store.setHighContrast,
                        activeColor: store.highContrast == false
                            ? Colors.blue
                            : Color(0xFFFFFF00),
                        //activeTrackColor: Color(0xFFFFFF00),
                      ),
                    ),
                    ListTile(
                        //onTap: linkendlin,
                        leading: Icon(Icons.stacked_line_chart_rounded,
                            size: store.fontSizeSelect <= 1
                                ? 25
                                : 25 + 2.0 * store.fontSizeSelect,
                            color: store.highContrast == false
                                ? Colors.black
                                : Colors.white),
                        title: Text(
                          "Font Slider",
                          style: TextStyle(
                            fontSize: store.fontSizeSelect <= 1
                                ? 15
                                : 15 + 2.0 * store.fontSizeSelect,
                            color: store.highContrast == false
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: SizedBox(
                            width: store.fontSizeSelect <= 1
                                ? 100
                                : 100 + 2.0 * store.fontSizeSelect,
                            child: Slider(
                              value: store.fontSizeSelect,
                              min: 1,
                              max: 5,
                              divisions: 5,
                              //label: "${store.fontSizeSelect}",
                              activeColor: store.highContrast == false
                                  ? Colors.blue
                                  : Color(0xFFFFFF00),
                              onChanged: (value) =>
                                  store.setFontSizeSelect(value),
                            ),
                          ),
                        )
                        // Wrap(
                        //   children: [
                        //     IconButton(
                        //         icon: Icon(Icons.plus_one),
                        //         onPressed: () => store
                        //             .setFontSizeSelect(store.fontSizeSelect - 1)),
                        //     IconButton(
                        //         icon: Icon(Icons.plus_one),
                        //         onPressed: () => {
                        //               store.setFontSizeSelect(
                        //                   store.fontSizeSelect + 1),
                        //               print("AQUIUIII ${store.fontSizeSelect}")
                        //             }),
                        //   ],
                        // ),
                        ),
                    ListTile(
                      onTap: () async {
                        await launch("https://github.com/NityanandaBarbosa");
                      },
                      leading: Icon(
                        Icons.computer_outlined,
                        size: store.fontSizeSelect <= 1
                            ? 25
                            : 25 + 2.0 * store.fontSizeSelect,
                        color: store.highContrast == false
                            ? Colors.black
                            : Color(0xFFFFFF00),
                      ),
                      title: Text(
                        "GitHub",
                        style: TextStyle(
                          fontSize: store.fontSizeSelect <= 1
                              ? 15
                              : 15 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Color(0xFFFFFF00),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right,
                          size: store.fontSizeSelect <= 1
                              ? 25
                              : 25 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Color(0xFFFFFF00)),
                    ),
                    ListTile(
                      onTap: () async {
                        await launch(
                            "https://www.linkedin.com/in/nityananda-barbosa-45a5a018b/");
                      },
                      leading: Icon(
                        Icons.work_outline_outlined,
                        size: store.fontSizeSelect <= 1
                            ? 25
                            : 25 + 2.0 * store.fontSizeSelect,
                        color: store.highContrast == false
                            ? Colors.black
                            : Color(0xFFFFFF00),
                      ),
                      title: Text(
                        "LinkedIn",
                        style: TextStyle(
                          fontSize: store.fontSizeSelect <= 1
                              ? 15
                              : 15 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Color(0xFFFFFF00),
                        ),
                      ),
                      trailing: Icon(Icons.arrow_right,
                          size: store.fontSizeSelect <= 1
                              ? 25
                              : 25 + 2.0 * store.fontSizeSelect,
                          color: store.highContrast == false
                              ? Colors.black
                              : Color(0xFFFFFF00)),
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
