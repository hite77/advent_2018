count(List<String> generations, int negativeOffset) {
  int counter = 0;
  String line = generations.last;
    for (int i=0; i<line.length; i++) {
      if (line[i] == '#') {
        counter += negativeOffset+i;
      }
    }
  return counter;
}

parseRules(String rulesString) {
  List<List<String>> rules = new List();
  for (final item in rulesString.split('\n')) {
    rules.add([item.split(' ')[0],item.split(' ')[2]]);
  }
  return rules;
}

String calculateCompareTo(int position, String wholeString) {
  if (position == 0) {
    return '..' + wholeString.substring(0, 3);
  } else if (position == 1) {
    return '.' + wholeString.substring(0, 4);
  } else if (position == wholeString.length-1) {
    return wholeString.substring(position-2) + '..';
  } else if (position == wholeString.length-2) {
    return wholeString.substring(position-2) + '.';
  } else {
    return wholeString.substring(position-2, position+3);
  }
}


String matchingPlantOrNot(int position, String wholeString, List<List<String>> rules) {
  String compareTo = calculateCompareTo(position, wholeString);
  for (final rule in rules) {
    if (rule[0] == compareTo) {
      return rule[1];
    }
  }
  return '.';
}

String solveGeneration(String previousGeneration, List<List<String>> rules) {
  String nextGeneration = '';
  for (int position = 0; position < previousGeneration.length; ++position) {
    nextGeneration += matchingPlantOrNot(position, previousGeneration, rules);
  }
  return nextGeneration;
}

solve(String initial, String rulesString) {
  List<List<String>> rules = parseRules(rulesString);
  int negativeOffset = 0;
  List<String> allGenerations = new List();
  List<Object> returnValue = wrapIndots(initial, negativeOffset);

  initial = returnValue[0];
  negativeOffset= returnValue[1];
  print(initial);
  allGenerations.add(initial);
  for (int generation = 1; generation<= 50000000000; generation++) {
    List<Object> returnValue = wrapIndots(allGenerations[generation-1], negativeOffset);
    negativeOffset = returnValue[1];
    allGenerations.add(solveGeneration(returnValue[0], rules));
    print(50000000000-generation);
    print(allGenerations);
    print(count(allGenerations, negativeOffset));
//    print(allGenerations[generation]);
  }
  print(negativeOffset);
  return count(allGenerations, negativeOffset);
}

wrapIndots(String allGeneration, int negativeOffset) {
  while (!allGeneration.startsWith('...............')) {
    allGeneration = '.' + allGeneration;
    negativeOffset -= 1;
//    print('>>>>>>negative');
  }
  while(!allGeneration.endsWith('...............')) {
    allGeneration = allGeneration + '.';
  }
 return [allGeneration, negativeOffset];
}

