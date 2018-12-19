import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_18.dart';
import './day_data.dart';


example() {
  return """
.#.#...|#.
.....#|##|
.|..|...#.
..|#.....#
#.#|||#|#|
...#.||...
.|....|...
||...#|.#|
|.||||..|.
...#.|..|.""";
}

minute1() {
  return """
.......##.
......|###
.|..|...#.
..|#||...#
..##||.|#|
...#||||..
||...|||..
|||||.||.|
||||||||||
....||..|.""";
}

minute2() {
  return """
.......#..
......|#..
.|.|||....
..##|||..#
..###|||#|
...#|||||.
|||||||||.
||||||||||
||||||||||
.|||||||||""";
}

minute3() {
  return """
.......#..
....|||#..
.|.||||...
..###|||.#
...##|||#|
.||##|||||
||||||||||
||||||||||
||||||||||
||||||||||""";
}

minute4() {
  return """
.....|.#..
...||||#..
.|.#||||..
..###||||#
...###||#|
|||##|||||
||||||||||
||||||||||
||||||||||
||||||||||""";
}

minute5() {
  return """
....|||#..
...||||#..
.|.##||||.
..####|||#
.|.###||#|
|||###||||
||||||||||
||||||||||
||||||||||
||||||||||""";
}

minute6() {
  return """
...||||#..
...||||#..
.|.###|||.
..#.##|||#
|||#.##|#|
|||###||||
||||#|||||
||||||||||
||||||||||
||||||||||""";
}

minute7() {
  return """
...||||#..
..||#|##..
.|.####||.
||#..##||#
||##.##|#|
|||####|||
|||###||||
||||||||||
||||||||||
||||||||||""";
}

minute8() {
  return """
..||||##..
..|#####..
|||#####|.
||#...##|#
||##..###|
||##.###||
|||####|||
||||#|||||
||||||||||
||||||||||""";
}

minute9() {
  return """
..||###...
.||#####..
||##...##.
||#....###
|##....##|
||##..###|
||######||
|||###||||
||||||||||
||||||||||""";
}

minute10() {
  return """
.||##.....
||###.....
||##......
|##.....##
|##.....##
|##....##|
||##.####|
||#####|||
||||#|||||
||||||||||""";
}


main() {
  //  An open acre will become filled with trees if three or more adjacent acres contained trees. Otherwise, nothing happens.
//  An acre filled with trees will become a lumberyard if three or more adjacent acres were lumberyards. Otherwise, nothing happens.
//  An acre containing a lumberyard will remain a lumberyard if it was adjacent to at least one other lumberyard and at least one acre containing trees. Otherwise, it becomes open.


  test('testing empty', () {
    expect(calculateCell(
        ['...',
         '...',
         '...'], 1, 1),'.');
    expect(calculateCell(
      ['|||',
       '...',
       '...'],1,1),'|');
  });

  test('testing tree', () {

  });

  test('calculates 1 minute', () {
    expect(calculate(example(),1),minute1());
  });

  test('calculates 2 minute', () {
    expect(calculate(example(),2),minute2());
  });

  test('calculates 3 minute', () {
    expect(calculate(example(),3),minute3());
  });

  test('calculates 4 minute', () {
    expect(calculate(example(),4),minute4());
  });

  test('calculates 5 minute', () {
    expect(calculate(example(),5),minute5());
  });

  test('calculates 6 minute', () {
    expect(calculate(example(),6),minute6());
  });

  test('calculates 7 minute', () {
    expect(calculate(example(),7),minute7());
  });

  test('calculates 8 minute', () {
    expect(calculate(example(),8),minute8());
  });

  test('calculates 9 minute', () {
    expect(calculate(example(),9),minute9());
  });

  test('calculates 10 minute', () {
    expect(calculate(example(),10),minute10());
  });

  test('gets score', () {
    expect(solution18_1(example()),1147);
  });

  print('Solution 18_1:'+solution18_1(day18()).toString());

//  Solution 18_1:360720
  //printed the patterns, tried picking counts that would be close to the multiple needed.  And typed in the values, it gave higher and lower, and found it.
//  print('Solution 18_2:'+solution18_2(day18()).toString());
}
