import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

Widget btnNavigator(store) {
  return Observer(builder: (_) {
    return BottomNavigationBar(
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      selectedFontSize:
          store.fontSizeSelect <= 1 ? 14 : 14 + 2.0 * store.fontSizeSelect,
      unselectedItemColor:
          store.highContrast == false ? Colors.white : Color(0xFFFFFF00),
      backgroundColor:
          store.highContrast == false ? Colors.blue : Color(0xFF333333),
      //ype: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.keyboard_control),
          label: 'Main',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Settings',
        ),
      ],
      currentIndex: store.bottomNavIndex,
      onTap: store.setBottomNavIndex,
    );
  });
}
