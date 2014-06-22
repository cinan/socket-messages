part of messages;

class MessageContainer implements Iterable<Message> {

  List<Message> _messages = new List<Message>();

  JsonObject get wrapped {
    JsonObject obj = new JsonObject();
    obj['messages'] = [];

    forEach((Message message) {
      obj['messages'].add(message.data);
    });

    return obj;
  }

  void clear() {
    _messages = new List<Message>();
  }

  void add(Message message) {
    _messages.add(message);
  }

  Message get first => _messages.first;

  Message get last => _messages.last;

  Message get single => _messages.single;

  bool get isEmpty => _messages.isEmpty;

  bool get isNotEmpty => _messages.isNotEmpty;

  Iterator<Message> get iterator => _messages.iterator;

  int get length => _messages.length;

  Iterable map(f(Message element)) => _messages.map(f);

  Iterable<Message> where(bool f(Message element)) => _messages.where(f);

  Iterable expand(Iterable f(Message element)) => _messages.expand(f);

  bool contains(Message element) => _messages.contains(element);

  Message reduce(Message combine(Message value, Message element)) => _messages.reduce(combine);

  bool every(bool f(Message element)) => _messages.every(f);

  void forEach(void f(Message element)) => _messages.forEach(f);

  String join([String separator]) => _messages.join(separator);

  bool any(bool f(Message element)) => _messages.any(f);

  Iterable<Message> take(int n) => _messages.take(n);

  Iterable<Message> takeWhile(bool test(Message value)) => _messages.takeWhile(test);

  Iterable<Message> skip(int n) => _messages.skip(n);

  Iterable<Message> skipWhile(bool test(Message value)) => _messages.skipWhile(test);

  Message fold(initialValue, dynamic combine(a,b)) => _messages.fold(initialValue, combine);

  Message elementAt(int index) => _messages.elementAt(index);

  List<dynamic> toList({ bool growable: truMessage }) => _messages.toList(growable:growable);

  Set<dynamic> toSet() => _messages.toSet();

  Message firstWhere(bool test(Message element), {bool orElse(Message element)})  => _messages.firstWhere(test, orElse:orElse);
  Message lastWhere(bool test(Message element), {bool orElse(Message element)})   => _messages.firstWhere(test, orElse:orElse);
  Message singleWhere(bool test(Message element), {bool orElse(Message element)}) => _messages.firstWhere(test, orElse:orElse);

}