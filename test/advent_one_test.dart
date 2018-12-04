import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app/advent_one.dart';
import './day_data.dart';

void main() {
  test('first example', () {
    expect(calculateFrequency("""
+1
-2
+3
+1"""), 3);
  });

  test('second example', () {
    expect(calculateFrequency("""
+1
+1 
+1"""), 3);
  });

  test('third example', () {
    expect(calculateFrequency("""
+1
+1
-2"""), 0);
  });
test('set', () {
  expect(calculateFrequency(data1()), 445);
});

  test('repeat 1', () {
    expect(findDouble("""
+1
-2
+3
+1"""), 2);
  });

  test('repeat 2', () {
    expect(findDouble("""
+1
-1"""), 1);
  });

  test('repeat 3', () {
    expect(findDouble("""
+3 
+3 
+4 
-2 
-4"""), 10);
  });

  test('double value', () {
    expect(findDouble(data1()), 219);
  });
}

