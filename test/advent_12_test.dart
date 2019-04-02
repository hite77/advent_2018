import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_12.dart';

String rulesString = """
..#.. => .
..#.# => .
#.#.. => .
.#..# => .
#.... => .
....# => .
.#.#. => #
#.### => .
####. => .
..... => .
.#... => #
##### => #
.#### => .
#..#. => #
#...# => #
.###. => .
###.# => #
...## => #
#.##. => #
.#.## => #
##.#. => #
...#. => .
..### => #
###.. => #
##... => .
..##. => .
.##.# => .
##.## => .
.##.. => .
##..# => #
#.#.# => .
#..## => #""";

main() {
//  test('count the #', () {
//    List<String> generations = new List();
//    generations.add('...#..#.#..##......###...###...........');
//    generations.add('...#...#....#.....#..#..#..#...........');
//    generations.add('...##..##...##....#..#..#..##..........');
//    generations.add('..#.#...#..#.#....#..#..#...#..........');
//    generations.add('...#.#..#...#.#...#..#..##..##.........');
//    generations.add('....#...##...#.#..#..#...#...#.........');
//    generations.add('....##.#.#....#...#..##..##..##........');
//    generations.add('...#..###.#...##..#...#...#...#........');
//    generations.add('...#....##.#.#.#..##..##..##..##.......');
//    generations.add('...##..#..#####....#...#...#...#.......');
//    generations.add('..#.#..#...#.##....##..##..##..##......');
//    generations.add('...#...##...#.#...#.#...#...#...#......');
//    generations.add('...##.#.#....#.#...#.#..##..##..##.....');
//    generations.add('..#..###.#....#.#...#....#...#...#.....');
//    generations.add('..#....##.#....#.#..##...##..##..##....');
//    generations.add('..##..#..#.#....#....#..#.#...#...#....');
//    generations.add('.#.#..#...#.#...##...#...#.#..##..##...');
//    generations.add('..#...##...#.#.#.#...##...#....#...#...');
//    generations.add('..##.#.#....#####.#.#.#...##...##..##..');
//    generations.add('.#..###.#..#.#.#######.#.#.#..#.#...#..');
//    generations.add('.#....##....#####...#######....#.#..##.');
//    expect(count(generations, -3), 264);
//  });

  test('rules parsing', () {
    List<List<String>> actual = parseRules(rulesString);
    expect(actual.length, 32);
    expect(actual[0], ['..#..','.']);
    expect(actual[actual.length-1], ['#..##','#']);
  });

//  test('matchingPlantOrNot', () {
//    List<List<String>> rules = parseRules(rulesString);
//    expect(matchingPlantOrNot('##.#.', rules), '#');
//    expect(matchingPlantOrNot('##...', rules), '.');
//  });

  test('solve generation', () {
    String previousGeneration = '#.#.#.#';
    //..#.#  1 => .
    //.#.#.  2 => #
    //#.#.#  3 => .
    //.#.#.  4 => #
    //#.#.#  5 => .
    //.#.#.  6 => #
    //#.#..  7 => .
    String nextGeneration = '.#.#.#.';
    List<List<String>> rules = parseRules(rulesString);
    expect(solveGeneration(previousGeneration, rules).length, previousGeneration.length);
    expect(solveGeneration(previousGeneration, rules), nextGeneration);
  });


//  test('solve', () {
//    expect(solve('#..#.#..##......###...###',"""
//..## => #
//..#.. => #
//.#... => #
//.#.#. => #
//.#.## => #
//.##.. => #
//.#### => #
//#.#.# => #
//#.### => #
//##.#. => #
//##.## => #
//###.. => #
//###.# => #
//####. => #"""),325);
//  });

  //test that solve will take a list of "rules" and parse across
  //strip newlines, and make a list of the rules with resulting plant.
  //if it finds a rule that fits, add the string to the generation.
  //count at the end, and return it.

  print('plants='+solve('##.#..#.#..#.####.#########.#...#.#.#......##.#.#...##.....#...#...#.##.#...##...#.####.##..#.#..#.', """
..#.. => .
..#.# => .
#.#.. => .
.#..# => .
#.... => .
....# => .
.#.#. => #
#.### => .
####. => .
..... => .
.#... => #
##### => #
.#### => .
#..#. => #
#...# => #
.###. => .
###.# => #
...## => #
#.##. => #
.#.## => #
##.#. => #
...#. => .
..### => #
###.. => #
##... => .
..##. => .
.##.# => .
##.## => .
.##.. => .
##..# => #
#.#.# => .
#..## => #""").toString());

  solve2(String initial, String rulesString) {
    List<List<String>> rules = parseRules(rulesString);
    int negativeOffset = 0;
    List<String> allGenerations = new List();
    List<Object> returnValue = wrapIndots(initial, negativeOffset);

    initial = returnValue[0];
    negativeOffset= returnValue[1];
//  var file = new File('file.txt');
//  var sink = file.openWrite();
//  sink.write(initial+'\n');
    allGenerations.add(initial);
    int lastValue = count(allGenerations,negativeOffset);
    for (int generation = 1; generation<= 200; generation++) {
//    for (int generation = 1; generation<= 50000000000; generation++) {
      List<Object> returnValue = wrapIndots(allGenerations[generation-1], negativeOffset);
      negativeOffset = returnValue[1];
      allGenerations.add(solveGeneration(returnValue[0], rules));
      int nextValue = count(allGenerations,negativeOffset);
      print('difference:'+(nextValue-lastValue).toString());
//      sink.write(generation.toString()+ allGenerations[generation]+'\n');
//    print(count(allGenerations, negativeOffset));
//    print(allGenerations[generation]);
    }
    print(negativeOffset);
//  sink.close();
    return count(allGenerations, negativeOffset);
  }

  print('part2='+solve2('##.#..#.#..#.####.#########.#...#.#.#......##.#.#...##.....#...#...#.##.#...##...#.####.##..#.#..#.', """
..#.. => .
..#.# => .
#.#.. => .
.#..# => .
#.... => .
....# => .
.#.#. => #
#.### => .
####. => .
..... => .
.#... => #
##### => #
.#### => .
#..#. => #
#...# => #
.###. => .
###.# => #
...## => #
#.##. => #
.#.## => #
##.#. => #
...#. => .
..### => #
###.. => #
##... => .
..##. => .
.##.# => .
##.## => .
.##.. => .
##..# => #
#.#.# => .
#..## => #""").toString());
}
