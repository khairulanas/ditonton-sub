import 'dart:io';
import 'package:path/path.dart' as p;

String readJson(String name) {
  var dir = Directory.current.path;
  print(dir);
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll(p.join('/test'), '');
  }
  if (dir.endsWith('/core') || dir.endsWith('\core')) {
    return File(p.join(dir, 'test', name)).readAsStringSync();
  }
  return File(p.join(dir, 'core', 'test', name)).readAsStringSync();
}
