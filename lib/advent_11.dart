power(int x, y, gridSerial) {
  int rackId = x+10;
  int power = (rackId*y+gridSerial)*rackId;
  return keepOnlyHundredsZeroIfNoHundreds(power) - 5;
}

keepOnlyHundredsZeroIfNoHundreds(int amount) {
  if (amount < 100) {
    return 0;
  }
  String strAmount = amount.toString();
  return int.parse(strAmount.substring(strAmount.length-3,strAmount.length-2));
}

day11(int gridSerial) {
  List<List<int>> battery = new List();
  buildUpArrayIgnoreZeroCoord(battery);
  battery = fillInPowers(battery, gridSerial);
  return coordsAndPower(battery);
}

coordsAndPower(List<List<int>> battery) {
  List<int> maxPower = [0, 0, -10000];
  for(int x=1; x<=298; x++) {
    for(int y=1; y<=298; y++) {
      int currentPower = battery[x][y]+battery[x+1][y]+battery[x+2][y]+
                     battery[x][y+1]+battery[x+1][y+1]+battery[x+2][y+1]+
                     battery[x][y+2]+battery[x+1][y+2]+battery[x+2][y+2];
      if (currentPower > maxPower[2]) {
        maxPower[0] = x;
        maxPower[1] = y;
        maxPower[2] = currentPower;
      }
    }
  }
  return maxPower;
}

void buildUpArrayIgnoreZeroCoord(List<List<int>> powers) {
  for (int i=0; i<=300; i++) {
    powers.add(new List<int>(301));
  }
}

fillInPowers(List<List<int>> battery, int gridSerial) {
  for (int x=1; x<=300; x++) {
    for(int y=1; y<=300; y++) {
      battery[x][y]= power(x,y,gridSerial);
    }
  }
  return battery;
}

