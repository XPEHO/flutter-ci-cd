import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercicd/utils.dart';

void main() {
  test('sum function testing', () {
    final result = sum(36, 6);

    expect(result, 42);
  });
}
