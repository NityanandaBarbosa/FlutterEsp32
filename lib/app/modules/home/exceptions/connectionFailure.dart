class ConnectionFailure implements Exception {}

class NotConnectedToEsp extends ConnectionFailure {
  final String error;
  NotConnectedToEsp(this.error);
}

class WrongEspDoor extends ConnectionFailure {
  final String error;
  WrongEspDoor(this.error);
}
