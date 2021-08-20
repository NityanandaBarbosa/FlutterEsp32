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
          height: MediaQuery.of(ctx).size.height * 0.25,
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
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Icon(
                    pin.state == 1
                        ? Icons.power_settings_new
                        : Icons.power_off_sharp,
                    size: 40,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                  child: Text(
                    "G${pin.door}",
                    style: TextStyle(
                        color: store.highContrast == false
                            ? Colors.black
                            : Colors.black87,
                        fontSize: 20),
                  ),
                ),
                Text(
                  pin.state == 0 ? "Off" : "On",
                  style: TextStyle(
                      color: store.highContrast == false
                          ? Colors.black
                          : Colors.black87,
                      fontSize: 18),
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
