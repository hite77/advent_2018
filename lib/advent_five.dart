String react(String input) {
  bool found = true;
  while(found) {
    found = false;

    int lower = "a".codeUnitAt(0);
    int Upper = "A".codeUnitAt(0);
    int lowerend = "z".codeUnitAt(0);

    while (lower <= lowerend) {
      int length = input.length;

      String lowerChar = new String.fromCharCode(lower);
      String upperChar = new String.fromCharCode(Upper);

      input = input.replaceAll(lowerChar+upperChar, '');
      input = input.replaceAll(upperChar+lowerChar, '');

      if (length != input.length) {
        found = true;
      }

      lower++;
      Upper++;
    }

  }
  return input;
}

int count(String input) {
  return react(input).length;
}

int compress(String input) {
  int shortest=count(react(input));

  int lower = "a".codeUnitAt(0);
  int Upper = "A".codeUnitAt(0);
  int lowerend = "z".codeUnitAt(0);

  while (lower <= lowerend) {
    String lowerChar = new String.fromCharCode(lower);
    String upperChar = new String.fromCharCode(Upper);

    String replaced = input.replaceAll(lowerChar, '');
    replaced = replaced.replaceAll(upperChar, '');

    int newLength = count(replaced);
    if (newLength < shortest) {
      shortest = newLength;
    }

    lower++;
    Upper++;
  }

  return shortest;
}