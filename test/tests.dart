import 'package:unittest/unittest.dart';
import 'package:json_object/json_object.dart';

import '../lib/messages.dart';

main() {
  group('message constructor (message type) tests', () {
    DataMessage m;

    test('setting message body', () {
      int id = 3;
      m = new DataMessage(id);

      var body = {'example': 'body'};
      m.body = body;

      expect(m.body, equals(body));
      expect(m.data['type'], equals('msg'));
      expect(m.data['id'], equals(id));
      expect(m.data['body'], equals(body));
    });

    test('matching map object', () {
      Map map = {
        'type': 'msg',
        'id':   '123',
        'body': {}
      };

      expect(DataMessage.matches(map), isTrue);
    });
  });

  group('message constructor (confirmation type) tests', () {
    ConfirmationMessage m;

    test('setting confirmation ID', () {
      int msgID = 4;
      int confirmID = 22;

      m = new ConfirmationMessage(msgID);

      m.confirmID = confirmID;

      expect(m.confirmID, equals(confirmID));
      expect(m.data['type'], equals('confirm'));
      expect(m.data['id'], equals(msgID));
      expect(m.data['body']['confirmID'], equals(confirmID));
    });

    test('matching map object', () {
      Map map = {
          'type': 'confirm',
          'id':   77,
          'body': {
            'confirmID': 78
          }
      };

      expect(ConfirmationMessage.matches(map), isTrue);
    });
  });

  group('message constructor (ping type) tests', () {
    PingMessage m;

    setUp(() {
      m = new PingMessage();
    });

    test('message type is set to `ping`', () {
      expect(m.data['type'], equals('ping'));
    });

    test('matching map object', () {
      Map map = {
          'type': 'ping'
      };

      expect(PingMessage.matches(map), isTrue);
    });
  });

  group('message constructor (pong type) tests', () {
    PongMessage m;

    setUp(() {
      m = new PongMessage();
    });

    test('message type is set to `ping`', () {
      expect(m.data['type'], equals('pong'));
    });

    test('matching map object', () {
      Map map = {
          'type': 'pong'
      };

      expect(PongMessage.matches(map), isTrue);
    });
  });

  group('container tests', () {
    MessageContainer c;

    setUp(() {
      c = new MessageContainer();
    });

    test('add messages to container', () {
      DataMessage m1 = new DataMessage(1);
      ConfirmationMessage m2 = new ConfirmationMessage(2);
      PingMessage m3 = new PingMessage();

      c..add(m1)..add(m2)..add(m3);

      expect(c.length, equals(3));
    });

    test('container is iterable', () {
      PingMessage m1 = new PingMessage();
      PongMessage m2 = new PongMessage();
      c..add(m1)..add(m2);

      int i = 0;

      for (var m in c) {
        if (i == 0) {
          expect(m is PingMessage, isTrue);
        } else {
          expect(m is PongMessage, isTrue);
        }

        i++;
      }
    });

    solo_test('wrap all messages', () {
      for (int i in [1,2,3,4,5]) {
        c.add(new PingMessage());
      }

      JsonObject wrapped = c.wrapped;
      expect(wrapped is Map, isTrue);
      expect(wrapped.containsKey('messages'), isTrue);
      expect(wrapped.first, hasLength(5));
      expect(wrapped.toString(), contains('type'));
    });

    test('clear all', () {
      for (int i in [1,2,3]) {
        c.add(new PingMessage());
      }

      expect(c, hasLength(3));
      c.clear();
      expect(c, hasLength(0));
    });
  });
}