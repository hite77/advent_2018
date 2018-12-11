import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_four.dart';
import './day_data.dart';


void main() {
  test('sorts correctly', () {
    expect(sort("""
[1518-05-27 00:42] falls asleep
[1518-05-27 00:33] falls asleep
[1518-09-22 00:10] falls asleep
[1518-10-27 00:55] wakes up
[1518-10-25 00:53] falls asleep"""),
[
'[1518-05-27 00:33] falls asleep',
'[1518-05-27 00:42] falls asleep',
'[1518-09-22 00:10] falls asleep',
'[1518-10-25 00:53] falls asleep',
'[1518-10-27 00:55] wakes up'
]
    );
  });
}
