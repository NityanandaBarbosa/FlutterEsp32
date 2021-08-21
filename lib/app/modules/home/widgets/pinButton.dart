import 'package:flutter/material.dart';
import 'package:flutter_esp32/app/modules/home/model/pin.dart';

Widget pinButton(Pin pin, ctx, store) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      child: InkWell(
        onTap: () => store.tapButton(pin),
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(ctx).size.width * 0.35,
          height: MediaQuery.of(ctx).size.height * 0.26,
          padding: const EdgeInsets.all(25.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            shape: BoxShape.rectangle,
            color:
                store.highContrast == false ? Colors.white : Color(0xFFFFFF00),
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  child: Icon(
                    pin.state == 1
                        ? Icons.power_settings_new
                        : Icons.power_off_sharp,
                    size: store.fontSizeSelect <= 1
                        ? 32
                        : 32 + 2.0 * store.fontSizeSelect,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Flexible(
                    child: Text(
                      "G${pin.door}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: store.highContrast == false
                              ? Colors.black
                              : Colors.black87,
                          fontSize: store.fontSizeSelect <= 1
                              ? 15
                              : 15 + 2.0 * store.fontSizeSelect),
                    ),
                  ),
                ),
                Flexible(
                  child: Text(
                    pin.state == 0 ? "Off" : "On",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: store.highContrast == false
                            ? Colors.black
                            : Colors.black87,
                        fontSize: store.fontSizeSelect <= 1
                            ? 16
                            : 16 + 2.0 * store.fontSizeSelect),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      color: store.highContrast == false ? Colors.black : Color(0xFFFFFF00),
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
