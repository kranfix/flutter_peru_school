import 'dart:ui';
import 'dart:math' show Random;

Color randomColor() {
  final rnd = Random();
  final a = rnd.nextInt(256);
  final r = rnd.nextInt(256);
  final g = rnd.nextInt(256);
  final b = rnd.nextInt(256);
  return Color.fromARGB(a, r, g, b);
}
