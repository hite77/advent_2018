findOverlaps(String squares) {
  List<List<int>> fabricArray = new List();
  for(int i=0; i<1000; i++)
  {
      fabricArray.add(new List<int>.filled(1000, 0));
  }

  for(final square in squares.split('\n')) {
    applySquares(square, fabricArray);
  }

  return countOverlap(fabricArray);
}

void applySquares(String square, List<List<int>> fabricArray) {
  List<int> coords = parseValues(square);
  int left = coords[0];
  int top = coords[1];
  int width = coords[2];
  int height = coords[3];

  for (int i=0; i < width; i++) {
    for (int j=0; j < height; j++) {
      if (fabricArray[left+i][top+j] == 1) {
        fabricArray[left+i][top+j] = 2;
      }
      else if (fabricArray[left+i][top+j] == 0) {
        fabricArray[left+i][top+j] = 1;
      }
    }
  }
}

int countOverlap(List<List<int>> fabricArray) {
  int countOverlap = 0;
  for (int i=0; i<1000; i++) {
    for (int j=0; j<1000; j++) {
      if (fabricArray[i][j] == 2) {
        countOverlap += 1;
      }
    }
  }
  return countOverlap;
}

parseValues(String square) {
  List<String> split = square.trim().split(' ');
  List<String> leftTop = split[2].split(':')[0].split(',');
  List<String> widthHeight = split[3].split('x');
  return [int.parse(leftTop[0]), int.parse(leftTop[1]), int.parse(widthHeight[0]), int.parse(widthHeight[1])];
}