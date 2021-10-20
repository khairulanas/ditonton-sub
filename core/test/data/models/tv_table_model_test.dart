import 'package:flutter_test/flutter_test.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  final Map<String, dynamic> tvTableJson = {
    'id': 1,
    'name': 'name',
    'posterPath': 'posterPath',
    'overview': 'overview',
  };

  test('should return json correctly', () {
    final result = testTvTable.toJson();
    expect(result, tvTableJson);
  });
}
