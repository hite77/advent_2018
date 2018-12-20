class GuardData {
  int id;
  int totalMinutes = 0;
  List<int> minutes = new List.filled(60, 0);

  fillMinutes(int start, int end) {
    for(int i=start; i<end; i++) {
      minutes[i] += 1;
      totalMinutes += 1;
    }
  }

  getMostMinutes() {
    int minute=0;
    int value=0;
    for(int i=0; i<60; i++) {
      if (minutes[i] > value) {
        minute = i;
        value = minutes[i];
      }
    }
    return minute;
  }
}


sort(String activity) {
  List<String> items = new List();
  activity.split('\n').forEach((item) => items.add(item));
  items.sort();
  return items;
}

GuardData findGuardWithMostTime(List<GuardData> data) {
  int index=0;
  int value=0;
  for(int i=0; i<data.length; i++) {
    if (data[i].totalMinutes > value) {
      index = i;
      value = data[i].totalMinutes;
    }
  }
  return data[index];
}

int findGuardById(List<GuardData> data, int id) {
  for(int i=0; i<data.length; i++) {
    if (id == data[i].id) {
      return i;
    }
  }
  data.add(GuardData());
  data[data.length-1].id = id;
  return data.length-1;
}

day4_1solve(String activity) {
  List<GuardData> data = parseAndSetupGuardData(activity);

  GuardData guard = findGuardWithMostTime(data);
  return (guard.getMostMinutes()*guard.id);
}

day4_2solve(String activity) {
  List<GuardData> data = parseAndSetupGuardData(activity);

  int minute=0;
  int times=0;
  int index=0;

  for(int i=0; i<data.length; i++) {
    int currentMinute = data[i].getMostMinutes();
    int currentTimes = data[i].minutes[currentMinute];
    if (currentTimes > times) {
      times = currentTimes;
      minute = currentMinute;
      index=i;
    }
  }
  return (data[index].id*minute);
}

List<GuardData> parseAndSetupGuardData(String activity) {
  List<String> items = sort(activity);
  List<GuardData> data = new List();
  int currentGuard=0;
  int startMinute=0;
  int endMinute=0;

  for(int i=0; i<items.length; i++) {
    String item = items[i];
    if (item.contains('Guard')) {
      currentGuard = parseGuard(item);
    } else if (item.contains('falls')) {
      startMinute = parseMinute(item);
    } else if (item.contains('wakes up')) {
      endMinute = parseMinute(item);
      int selected = findGuardById(data, currentGuard);
      data[selected].fillMinutes(startMinute, endMinute);
    }
  }
  return data;
}

parseMinute(String string) {
  return int.parse(string.split(':')[1].split(']')[0]);
}

parseGuard(String string) {
  return int.parse(string.split('Guard #')[1].split(' begins')[0]);
}


// sum of guard minutes asleep
// list of minutes with duplicate count
// for guard with most sleep, pick the minute most repeated

// only minute portion is valid
// return minute by guard #
// [ Guard #, minutes asleep, [[minute #, times],] ]
