part of messages;

class DataMessage extends Message {

  dynamic body;

  Map<String, dynamic> get data => {
    'type': 'msg',
    'id':   id,
    'body': body
  };

  bool confirmableFlag = true;
  bool volatileFlag = false;

  DataMessage({int id, var body}) {
    this.id = id;
    this.body = body;
  }

  factory DataMessage.fromMap(Map map) {
    return new DataMessage(id: map['id'], body: map['body']);
  }

  static matches(Map map) =>
    map['type'] == 'msg' &&
    map.containsKey('body') &&
    map.containsKey('id') &&
    (map['id'] is int || int.parse(map['id'], onError: (_) => false) != false);
}