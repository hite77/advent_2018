calculateFrequency(String frequencyChanges) {
  int accumulate = 0;
  frequencyChanges.split('\n').forEach((frequency) => accumulate+= int.parse(frequency));
//  frequencyChanges.replaceAll('+', '').split('\n').map((frequency) => print(frequency));// accumulate += frequency);

  return accumulate;
}