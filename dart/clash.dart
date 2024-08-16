import 'dart:io';

void main() {
  int a = int.parse(stdin.readLineSync()!, radix: 2);
  int b = int.parse(stdin.readLineSync()!, radix: 2);
  int c = a & b;
  String solution = c.toRadixString(2).padLeft(3,'0');
  print(solution.replaceAll(RegExp(r'^0+$'),'0'));
}
