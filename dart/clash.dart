import 'dart:io';

main() {
  var N = stdin.readLineSync()!;
  var n = int.parse(N);
  print(n ~/ N.length);
}
