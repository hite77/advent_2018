render(String starVelocity, time) {
  List<List<int>> points = new List();
  String output = '';
  parseOutPoints(starVelocity, points);
  for(int i=0; i<points.length; i++) {
    List<int> current = points[i];
    points[i] = [current[0]+time*current[2], current[1]+time*current[3], current[2], current[3]];
  }
  List<int> extents = minMax(points);

  // output either ., or #
  for (int y=extents[2]; y<=extents[3]; ++y) {
    String line = '';
    for (int x=extents[0]; x<=extents[1]; ++x) {
      bool match=false;
      for (final item in points) {
        if ((item[0] == x) && (item[1] == y)) {
          line+= '#';
          match=true;
          break;
        }
      }
      if (!match) {
        line+= '.';
      }
    }
    output += line + '\n';
  }
  output = output.substring(0, output.length - 1);
  return output;
}



findSmallestTime(String starVelocity) {
  List<List<int>> points = new List();
  parseOutPoints(starVelocity, points);
  int currentSize = size(points);
  int time = 1;
  bool found = false;
  while (!found) {
    movePoints(points);
    int calculateSize = size(points);
    if (calculateSize > currentSize) {
      time -= 1;
      found = true;
    }
    else {
      currentSize = calculateSize;
      time += 1;
    }
  }
  return time;
}

void movePoints(List<List<int>> points) {
  for(int i=0; i<points.length; i++) {
    List<int> current = points[i];
    points[i] = [current[0]+current[2], current[1]+current[3], current[2], current[3]];
  }
}

void parseOutPoints(String starVelocity, List<List<int>> points) {
  for(final item in starVelocity.split('\n')) {
    points.add(parsePointVector(item));
  }
}

size(List<List<int>> points) {
  List<int> extents = minMax(points);
  return (extents[1] - extents[0]) * (extents[3] - extents[2]);
}

minMax(List<List<int>> points) {
  // left, right, top, bottom
  // set left and right to first entry
  // set top and bottom to first entry
  int left = points[0][0];
  int right = points[0][0];
  int top = points[0][1];
  int bottom = points[0][1];
  for(int i=1; i<points.length; i++) {
    List<int> current = points[i];
    if (current[0] < left) {
      left = current[0];
    } else if (current[0] > right) {
      right = current[0];
    }
    if (current[1] < top) {
      top = current[1];
    } else if (current[1] > bottom) {
      bottom = current[1];
    }
  }
  return [left, right, top, bottom];
}

//position=< 9,  1> velocity=< 0,  2>
parsePointVector(String item) {
  String coords = item.split('<')[1].split('>')[0];
  String velocity = item.split('<')[2].split('>')[0];
  return [int.parse(coords.split(',')[0]), int.parse(coords.split(',')[1]),
          int.parse(velocity.split(',')[0]), int.parse(velocity.split(',')[1])];
}