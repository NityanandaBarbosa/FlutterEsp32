// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$failureAtom = Atom(name: 'HomeStoreBase.failure');

  @override
  Option<ConnectionFailure> get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Option<ConnectionFailure> value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  final _$bottomNavIndexAtom = Atom(name: 'HomeStoreBase.bottomNavIndex');

  @override
  int get bottomNavIndex {
    _$bottomNavIndexAtom.reportRead();
    return super.bottomNavIndex;
  }

  @override
  set bottomNavIndex(int value) {
    _$bottomNavIndexAtom.reportWrite(value, super.bottomNavIndex, () {
      super.bottomNavIndex = value;
    });
  }

  final _$connectedAtom = Atom(name: 'HomeStoreBase.connected');

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  final _$espPinListAtom = Atom(name: 'HomeStoreBase.espPinList');

  @override
  List<Pin> get espPinList {
    _$espPinListAtom.reportRead();
    return super.espPinList;
  }

  @override
  set espPinList(List<Pin> value) {
    _$espPinListAtom.reportWrite(value, super.espPinList, () {
      super.espPinList = value;
    });
  }

  final _$fontSizeSelectAtom = Atom(name: 'HomeStoreBase.fontSizeSelect');

  @override
  double get fontSizeSelect {
    _$fontSizeSelectAtom.reportRead();
    return super.fontSizeSelect;
  }

  @override
  set fontSizeSelect(double value) {
    _$fontSizeSelectAtom.reportWrite(value, super.fontSizeSelect, () {
      super.fontSizeSelect = value;
    });
  }

  final _$highContrastAtom = Atom(name: 'HomeStoreBase.highContrast');

  @override
  bool get highContrast {
    _$highContrastAtom.reportRead();
    return super.highContrast;
  }

  @override
  set highContrast(bool value) {
    _$highContrastAtom.reportWrite(value, super.highContrast, () {
      super.highContrast = value;
    });
  }

  final _$tryToConnectAsyncAction = AsyncAction('HomeStoreBase.tryToConnect');

  @override
  Future<dynamic> tryToConnect() {
    return _$tryToConnectAsyncAction.run(() => super.tryToConnect());
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic setEspReturn(List<Pin> value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setEspReturn');
    try {
      return super.setEspReturn(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBottomNavIndex(int value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setBottomNavIndex');
    try {
      return super.setBottomNavIndex(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFontSizeSelect(double value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setFontSizeSelect');
    try {
      return super.setFontSizeSelect(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setHighContrast(bool value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setHighContrast');
    try {
      return super.setHighContrast(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
failure: ${failure},
bottomNavIndex: ${bottomNavIndex},
connected: ${connected},
espPinList: ${espPinList},
fontSizeSelect: ${fontSizeSelect},
highContrast: ${highContrast}
    ''';
  }
}
