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