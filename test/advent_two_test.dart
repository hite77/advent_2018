import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_two.dart';
import './day_data.dart';


void main() {
  test('first example', () {
    expect(findChecksum("""
abcdef
bababc
abbcde
abcccd
aabcdd
abcdee
ababab"""), 12);
  });

  test('real set', () {
    expect(findChecksum(data2()), 5681);
  });
}