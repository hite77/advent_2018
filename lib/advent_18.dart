solution18_1(String data) {
  String state = calculate(data, 10);
  return (countTrees(state)*countLumberYards(state));
}

solution18_2(String data) {
  int count = 1000000000;
  String next = '';
  while(count > 0) {
    next = calculate(data, 10);
    count -= 10;
    print('Count: ' + count.toString() + ' score: ' +
        (countTrees(next) * countLumberYards(next)).toString());
    data = next;
  }
}

calculate(String data, int minutes) {
  List<String> current = new List();
  data.split('\n').forEach((item) => current.add(item));


//  open ground (.), trees (|), or a lumberyard (#)
//  An open acre will become filled with trees if three or more adjacent acres contained trees. Otherwise, nothing happens.
//  An acre filled with trees will become a lumberyard if three or more adjacent acres were lumberyards. Otherwise, nothing happens.
//  An acre containing a lumberyard will remain a lumberyard if it was adjacent to at least one other lumberyard and at least one acre containing trees. Otherwise, it becomes open.
  List<String> next;

  while (minutes >= 1) {
    next = new List();
    current.forEach((item) => next.add(''));

    for (int x = 0; x < current[0].length; x++) {
      for (int y = 0; y < current.length; y++) {
        next[x] += calculateCell(current, x, y);
      }
    }
    current = new List();
    next.forEach((item) => current.add(item));
    minutes -= 1;
  }
  String out = output(next);
  return out.substring(0,out.length-1);
}

calculateCell(List<String> current, int x,int y) {
  String cells = cellsAround(current, x, y);
  if ((current[x][y] == '.') && (countTrees(cells) >= 3)) { // open ground
    return '|';
  } else if ((current[x][y] == '|') && (countLumberYards(cells) >= 3)) { // trees
    return '#';
  } else if (current[x][y] == '#') {
      if ((countLumberYards(cells) >= 1) && (countTrees(cells) >= 1)) { //lumber maintain
        return '#';
      } else  { // lumber clearing
        return '.';
      }
  }
  return current[x][y]; // no change
}

int countLumberYards(String cells) {
  return (cells.length - cells.replaceAll('#', '').length);
}

int countTrees(String cells) {
  return (cells.length - cells.replaceAll('|', '').length);
}

String cellsAround(List<String> current, int x, int y) {
  // go around x, and y -- but call index check to not go out of bounds
  return boundsCheck(current, x-1,y-1)+boundsCheck(current, x, y-1)+boundsCheck(current, x+1, y-1) +
         boundsCheck(current, x-1,y  )+                             boundsCheck(current, x+1, y  ) +
         boundsCheck(current, x-1,y+1)+boundsCheck(current, x, y+1)+boundsCheck(current, x+1, y+1);
}

String boundsCheck(List<String> current, int x, int y) {
  if ((y < 0) || (y>current.length-1) || (x<0) || (x>current[y].length-1)) {
    return '';
  }
  return current[x][y];
}

output(List<String> map) {
  String out = '';
  map.forEach((item) => out += item += '\n');
  return out;
}
