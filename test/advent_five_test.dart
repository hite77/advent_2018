import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_five.dart';
import './day_data.dart';



void main() {
  test('example', () {
    expect(react("aA"),"");
    expect(react("abBA"), "");
    expect(react("abAB"), "abAB");
    expect(react("aabAAB"), "aabAAB");
    expect(react("dabAcCaCBAcCcaDA"), "dabCBAcaDA");
    expect(count("dabAcCaCBAcCcaDA"), 10);
    expect(compress("dabAcCaCBAcCcaDA"), 4);
  });

  print('day5_1: '+count(day5()).toString());
  print('day5_2: '+compress(day5()).toString());
}
