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
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: _homeStore.highContrast == false
                  ? Colors.white
                  : Color(0xFFFFFF00),
            ),
            onPressed: () => Modular.to.pop(),
          ),
          backgroundColor: _homeStore.highContrast == false
              ? Colors.blue
              : Color(0xFF333333),
          title: Text(
            'Font Slider',
            style: TextStyle(
              fontSize: 20 + 2.0 * _homeStore.fontSizeSelect,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: _homeStore.highContrast == false
                ? Colors.white
                : Color(0xFF000000),
          ),
          child: Padding(
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
                            child: Text(
                              "A",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.75,
                            //height: MediaQuery.of(context).size.height * 0.05,
                            child: SliderTheme(
                              data: SliderThemeData(
                                trackHeight: 2,
                                overlayColor: _homeStore.highContrast == false
                                    ? Colors.blue.withOpacity(.1)
                                    : Colors.white.withOpacity(.1),
                                thumbColor: _homeStore.highContrast == false
                                    ? Colors.blue
                                    : Color(0xFFFFFF00),
                                activeTrackColor: Colors.grey,
                                inactiveTrackColor: Colors.grey,
                                activeTickMarkColor: Colors.grey,
                                inactiveTickMarkColor: Colors.grey,
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
                            child: Text(
                              "A",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
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
          ),
        ),
      ),
    );
  }
}