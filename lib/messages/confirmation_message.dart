part of messages;

class ConfirmationMessage extends Message {

  int confirmID;

  bool confirmableFlag = false;
  bool volatileFlag = false;

  Map<String, dynamic> get data => {
      'type': 'confirm',
      'id':   id,
      'body': {
        'confirmID': confirmID
      }
  };

  ConfirmationMessage([int id]) {
    this.id = id;
  }

  factory ConfirmationMessage.fromMap(Map map) {
    ConfirmationMessage message = new ConfirmationMessage(map['id']);
    message.confirmID = map['body']['confirmID'];
    return message;
  }

  static matches(Map map) =>
    map['type'] == 'confirm' &&
    (map['id'] is int || int.parse(map['id'], onError: (_) => false) != false) &&
    map['body'] is Map &&
    (map['body']['confirmID'] is int || int.parse(map['body']['confirmID'], onError: (_) => false) != false);
}