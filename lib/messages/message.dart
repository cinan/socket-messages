part of messages;

abstract class Message {

  int id;

  Map<String, dynamic> get data => {};

  static bool matches(Map message) => false;

  Message();

  factory Message.fromMap(Map _) {
  }

  bool confirmableFlag = false;
  bool volatileFlag = false;

  bool pending = false;

  String toString() => new JsonObject.fromMap(data).toString();
}