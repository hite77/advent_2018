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

//  The boxes will have IDs which differ by exactly one character at the same position in both strings. For example, given the following box IDs:
//
//  abcde
//  fghij
//  klmno
//  pqrst
//  fguij
//  axcye
//  wvxyz
//  The IDs abcde and axcye are close, but they differ by two characters (the second and fourth). However, the IDs fghij and fguij differ by exactly one character, the third (h and u). Those must be the correct boxes.
//
//  What letters are common between the two correct box IDs? (In the example above, this is found by removing the differing character from either ID, producing fgij.)

  test('helper method to compare', () {
    expect(compare('fghij', 'fguij'), 1);
    expect(compare('abcde', 'axcye'), 2);
  });

  test('helper method to extract', () {
    expect(extract('fghij', 'fguij'), 'fgij');
    expect(extract('abcde', 'axcye'), 'ace');
  });


  test('find common letters', () {
      expect(findCommonLetters("""
abcde
fghij
klmno
pqrst
fguij
axcye
wvxyz"""), 'fgij');
  });

  test('find common on the dataset', () {
    expect(findCommonLetters(data2()),'uqyoeizfvmbistpkgnocjtwld');
  });
}