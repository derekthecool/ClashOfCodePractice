import 'dart:io';
import 'dart:math';

String readLineSync() {
  String? s = stdin.readLineSync();
  return s == null ? '' : s;
}
void main() {
    int n = int.parse(readLineSync());
    var pie = '3141592653589793238462';
    print(pie.substring(0,n));
}
