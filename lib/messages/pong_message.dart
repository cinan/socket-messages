part of messages;

class PongMessage extends Message {

  Map<String, dynamic> get data => {
      'type': 'pong',
  };

  bool confirmableFlag = false;
  bool volatileFlag = true;

  PongMessage();

  factory PongMessage.fromMap(Map map) {
    return new PongMessage();
  }

  static matches(Map map) => map['type'] == 'pong';
}