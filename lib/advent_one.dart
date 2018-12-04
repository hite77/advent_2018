calculateFrequency(String frequencyChanges) {
  int accumulate = 0;
  frequencyChanges.split('\n').forEach((frequency) => accumulate+= int.parse(frequency));
  return accumulate;
}


findDouble(String frequencyChanges) {
  Set<int> pastValues = new Set();
  int accumulate = 0;
  while (true) {
    for(final frequency in frequencyChanges.split('\n')) {
      accumulate += int.parse(frequency);
      if (pastValues.contains(accumulate)) {
        return accumulate;
      }
      pastValues.add(accumulate);
    }
  }
}
