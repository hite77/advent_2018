import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_four.dart';
import './day_data.dart';


//day4

example() {
  return """
[1518-11-01 23:58] Guard #99 begins shift
[1518-11-02 00:40] falls asleep
[1518-11-02 00:50] wakes up
[1518-11-03 00:05] Guard #10 begins shift
[1518-11-03 00:24] falls asleep
[1518-11-03 00:29] wakes up
[1518-11-04 00:02] Guard #99 begins shift
[1518-11-01 00:00] Guard #10 begins shift
[1518-11-01 00:05] falls asleep
[1518-11-01 00:25] wakes up
[1518-11-01 00:30] falls asleep
[1518-11-01 00:55] wakes up
[1518-11-04 00:36] falls asleep
[1518-11-04 00:46] wakes up
[1518-11-05 00:03] Guard #99 begins shift
[1518-11-05 00:45] falls asleep
[1518-11-05 00:55] wakes up""";
}

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

  test('example result', () {
    expect(day4_1solve(example()),240);
    expect(day4_2solve(example()),4455);
  });

  print('day4_1:'+day4_1solve(day4()).toString());
  print('day4_2:'+day4_2solve(day4()).toString());
}
