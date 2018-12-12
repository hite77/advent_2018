import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_11.dart';



//300x300
//
//X(horizontal)
//Y(vertical)
//
//top left is 1,1
//top right is 300,1
//
//select a 3x3
//
//For grid serial number 18, the largest total 3x3 square has a top-left corner of 33,45 (with a total power of 29);
//
//For grid serial number 42, the largest 3x3 square's top-left is 21,61 (with a total power of 30)
main() {
  test('first power calculations', () {
    expect(power(3,5,8), 4);
    expect(power(122,79,57), -5);
    expect(power(217,196,39), 0);
    expect(power(101,153,71), 4);
  });

  test('keep only hundreds less than a hundred', () {
    expect(keepOnlyHundredsZeroIfNoHundreds(99), 0);
  });

  test('keep only hundred 100+', () {
    expect(keepOnlyHundredsZeroIfNoHundreds(123), 1);
  });

  test('way over but still get 100s', () {
    expect(keepOnlyHundredsZeroIfNoHundreds(102345), 3);
  });

  test('calculate coord and power of highest 3x3', () {
    expect(day11(18), [33,45,29]);
    expect(day11(42), [21,61,30]);
  });

//  print(day11(3214));

//  For grid serial number 18, the largest total square (with a total power of 113) is 16x16 and has a top-left corner of 90,269, so its identifier is 90,269,16.
//  For grid serial number 42, the largest total square (with a total power of 119) is 12x12 and has a top-left corner of 232,251, so its identifier is 232,251,12.
//  takes nearly 3 minutes to solve for these two and the print.
//  test('part 2 any size square', () {
//    expect(day11_2(18), [90,269,16,113]);
//    expect(day11_2(42), [232,251,12,119]);
//  });

//  List<int> answer = day11_2(3214);
//  print('Answer day 11 part 2: ['+answer[0].toString()+','+answer[1].toString()+','+answer[2].toString()+']');
//  print('power:'+answer[3].toString());
//
  //result for above: after 740 ms
//  Answer day 11 part 2: [230,212,13]
//  power:85
}
