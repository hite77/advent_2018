findChecksum(String labels) {
  int countOfTwo = 0;
  int countOfThree = 0;

  for(var label in labels.split('\n'))
  {
    bool foundCountOfTwo = false;
    bool foundCountOfThree = false;

    while(label.length > 0) {
      int originalLength = label.length;
      label = label.replaceAll(label[0], '');
      int newLength = label.length;
      if ((originalLength-newLength == 2) && !foundCountOfTwo) {
        foundCountOfTwo = true;
        countOfTwo += 1;
      } else if ((originalLength-newLength == 3) && !foundCountOfThree) {
        foundCountOfThree = true;
        countOfThree += 1;
      }
    }

  }

  return countOfTwo*countOfThree;
}

findCommonLetters(String labels) {
  List<String> boxes= new List();
  for(var label in labels.split('\n')) {
    boxes.add(label);
  }
  int box1 = 0;
  int box2 = 1;
  while (box1 < boxes.length) {
    while (box2 < boxes.length) {
      if (compare(boxes[box1], boxes[box2]) == 1) {
        return extract(boxes[box1], boxes[box2]);
      }
      box2 += 1;
      if (box1 == box2) {
        box2 += 1;
      }
    }
    box1 += 1;
    box2 = 0;
  }
}

compare(String one, String two) {
  int differences = 0;
  for(int i=0; i<one.length ; i++){
    if (one[i] != two[i]) {
      differences += 1;
    }
  }
  return differences;
}

extract(String one, String two) {
  String sameString = "";
  for (int i = 0; i < one.length; i++) {
    if (one[i] == two[i]) {
      sameString += one[i];
    }
  }
  return sameString;
}