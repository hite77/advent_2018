sort(String activity) {
  List<String> items = new List();
  for (final item in activity.split('\n')) {
    items.add(item);
  }
  items.sort();
  return items;
}