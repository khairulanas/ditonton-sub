import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/tv_series/test')) {
    dir = dir.replaceAll('/tv_series/test', '');
  }
  return File('$dir/tv_series/test/$name').readAsStringSync();
}
