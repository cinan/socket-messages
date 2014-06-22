part of messages;

class PingMessage extends Message {

  Map<String, dynamic> get data => {
      'type': 'ping',
  };

  static matches(Map map) => map['type'] == 'ping';
}