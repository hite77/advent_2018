import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_six.dart';
import './day_data.dart';

example() {
  return """
1, 1
1, 6
8, 3
3, 4
5, 5
8, 9""";
}

void main() {
  test('example', () {
    expect(distance(example()),17);
  });
//  test('example', () {
//    expect(react("aA"),"");
//    expect(react("abBA"), "");
//    expect(react("abAB"), "abAB");
//    expect(react("aabAAB"), "aabAAB");
//    expect(react("dabAcCaCBAcCcaDA"), "dabCBAcaDA");
//    expect(count("dabAcCaCBAcCcaDA"), 10);
//    expect(compress("dabAcCaCBAcCcaDA"), 4);
//  });
//
//  print('day5_1: '+count(day5()).toString());
//  print('day5_2: '+compress(day5()).toString());
}
