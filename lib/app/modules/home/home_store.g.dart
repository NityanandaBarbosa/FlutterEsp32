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

  final _$espReturnAtom = Atom(name: 'HomeStoreBase.espReturn');

  @override
  String get espReturn {
    _$espReturnAtom.reportRead();
    return super.espReturn;
  }

  @override
  set espReturn(String value) {
    _$espReturnAtom.reportWrite(value, super.espReturn, () {
      super.espReturn = value;
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
  dynamic setEspReturn(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.setEspReturn');
    try {
      return super.setEspReturn(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
failure: ${failure},
connected: ${connected},
espReturn: ${espReturn}
    ''';
  }
}
