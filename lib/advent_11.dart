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
  List<List<int>> battery = initializePowerForGridSerial(gridSerial);
  return coordsAndPower(battery);
}

day11_2(int gridSerial) {
  List<List<int>> battery = initializePowerForGridSerial(gridSerial);
  return coordsAndPowerAnySize(battery);
}

coordsAndPowerAnySize(List<List<int>> battery) {
  List<int> maxPower = [0, 0, 0, -10000];
  for(int size=1; size<=300; size++) {
    print('size:'+size.toString());
    for (int x = 1; x <= 300 - size + 1; x++) {
      for (int y = 1; y <= 300 - size + 1; y++) {
        int currentPower = sumPowerForSize(x,y,size, battery);
        if (currentPower > maxPower[3]) {
          maxPower[0] = x;
          maxPower[1] = y;
          maxPower[2] = size;
          maxPower[3] = currentPower;
        }
      }
    }
  }
  return maxPower;
}

int sumPowerForSize(int x, int y, int size, List<List<int>> battery) {
  int currentPower = 0;
  for (int ix=x; ix<=x+size-1; ix++) {
    for (int iy=y; iy<=y+size-1; iy++) {
      currentPower += battery[ix][iy];
    }
  }
  return currentPower;
}


List<List<int>> initializePowerForGridSerial(int gridSerial) {
  List<List<int>> battery = new List();
  buildUpArrayIgnoreZeroCoord(battery);
  battery = fillInPowers(battery, gridSerial);
  return battery;
}

coordsAndPower(List<List<int>> battery) {
  List<int> maxPower = [0, 0, -10000];
  for(int x=1; x<=298; x++) {
    for(int y=1; y<=298; y++) {
        int currentPower = sumPowerForSize(x, y, 3, battery);
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

