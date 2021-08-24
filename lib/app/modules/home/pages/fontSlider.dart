import 'package:flutter/material.dart';
import 'package:flutter_esp32/app/modules/home/home_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FontSlider extends StatefulWidget {
  const FontSlider({Key key}) : super(key: key);

  @override
  _FontSliderState createState() => _FontSliderState();
}

class _FontSliderState extends State<FontSlider> {
  final HomeStore _homeStore = Modular.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            _homeStore.highContrast == false ? Colors.blue : Color(0xFF333333),
        title: Text('Font Slider'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: _homeStore.highContrast == false
              ? Colors.white
              : Color(0xFF000000),
        ),
        child: Observer(builder: (_) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.07,
                      color: _homeStore.highContrast == false
                          ? Colors.white
                          : Color(0xFF333333),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(
                              Icons.remove,
                              color: _homeStore.highContrast == false
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            //height: MediaQuery.of(context).size.height * 0.05,
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 1.0,
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 10.0),
                                thumbColor: _homeStore.highContrast == false
                                    ? Colors.blue
                                    : Color(0xFFFFFF00),
                                activeTrackColor:
                                    _homeStore.highContrast == false
                                        ? Colors.blue
                                        : Color(0xFFFFFF00).withOpacity(0.3),
                              ),
                              child: Slider(
                                value: _homeStore.fontSizeSelect,
                                min: -3,
                                max: 3,
                                divisions: 6,
                                onChanged: (value) =>
                                    _homeStore.setFontSizeSelect(value),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Icon(
                              Icons.add,
                              color: _homeStore.highContrast == false
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Flexible(
                      child: Text(
                        "Chose your app font size.",
                        style: TextStyle(
                            color: _homeStore.highContrast == false
                                ? Colors.black
                                : Colors.white.withOpacity(0.80),
                            fontSize: 14 + 2.0 * _homeStore.fontSizeSelect),
                        // ? 14
                        // : 14 + 2.0 * _homeStore.fontSizeSelect),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: _homeStore.fontSizeSelect == 0
                                  ? MaterialStateProperty.all(Colors.grey)
                                  : _homeStore.highContrast == false
                                      ? MaterialStateProperty.all(Colors.blue)
                                      : MaterialStateProperty.all(
                                          Color(0xFFFFFF00))),
                          onPressed: _homeStore.fontSizeSelect != 0
                              ? () => {_homeStore.setFontSizeSelect(0)}
                              : null,
                          child: Text(
                            "Restore default size",
                            style: TextStyle(
                                color: _homeStore.highContrast == false
                                    ? Colors.white
                                    : _homeStore.fontSizeSelect != 0
                                        ? Colors.black.withOpacity(0.75)
                                        : Colors.white,
                                fontSize: 16 + 2.0 * _homeStore.fontSizeSelect),
                            // ? 16
                            // : 16 + 2.0 * _homeStore.fontSizeSelect),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
