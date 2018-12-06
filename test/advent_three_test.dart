import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_three.dart';
import './day_data.dart';


void main() {
  test('test parse function', () {
    expect(parseValues('#1 @ 1,3: 4x4'), [1,3,4,4]);
    expect(parseValues('#2 @ 3,1: 4x4'), [3,1,4,4]);
    expect(parseValues('#3 @ 5,5: 2x2'), [5,5,2,2]);
  });


  test('first example', () {
    expect(findOverlaps("""
#1 @ 1,3: 4x4
#2 @ 3,1: 4x4
#3 @ 5,5: 2x2"""), 4);
  });

  test('dataset', () {
    expect(findOverlaps(day3()),107663);
  });

}
