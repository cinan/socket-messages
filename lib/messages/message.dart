part of messages;

abstract class Message {

  Map<String, dynamic> get data => {};

  static bool matches(Map message) => false;

  String toString() => new JsonObject.fromMap(data).toString();
}