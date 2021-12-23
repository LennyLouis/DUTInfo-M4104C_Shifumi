import 'dart:math';

class Party {
  late String code;
  late String host;
  late String visitor;
  late int round;
  late int time;

  Party(this.host, this.visitor, this.round, this.time) {
    code = getRandomString(7);
  }

  Party.withCode(this.code, this.host, this.visitor, this.round, this.time) {
    code = getRandomString(7);
  }

  Party.empty() {
    code = "";
    host = "";
    visitor = "";
    round = 0;
    time = 0;
  }

  Party.fromJson(Map<dynamic, dynamic> json)
      : host = json['host'] as String,
        visitor = json['visitor'] as String,
        round = json['round'] as int,
        time = json['time'] as int;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'host': host,
        'visitor': visitor,
        'round': round,
        'time': time,
      };

  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}
