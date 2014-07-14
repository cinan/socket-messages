part of messages;

class PingMessage extends Message {

  Map<String, dynamic> get data => {
      'type': 'ping',
  };

  bool confirmableFlag = false;
  bool volatileFlag = true;

  PingMessage();

  factory PingMessage.fromMap(Map map) {
    return new PingMessage();
  }

  static matches(Map map) => map['type'] == 'ping';
}