import 'package:flutter_test/flutter_test.dart';
import 'package:fluttercicd/utils.dart';

void main() {
  group('Multiply function testing', () {
    test('Simple multiplication', () {
      final result = multiply(6, 7);

      expect(result, 42, reason: 'Regular multiplication should work');
    });

    test('Ensure correct handling of zero', () {
      final result = multiply(13, 0);

      expect(result, 0, reason: 'Multiple with zero should be zero');
    });
  });
}
