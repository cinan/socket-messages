part of messages;

class PongMessage extends Message {

  Map<String, dynamic> get data => {
      'type': 'pong',
  };

  static matches(Map map) => map['type'] == 'pong';
}