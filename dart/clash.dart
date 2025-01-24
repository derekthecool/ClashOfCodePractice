import 'dart:io';
import 'dart:math';

main() {
  final lines = 6;
  var c = 1;
  stderr.writeln('Lines: $lines, c: $c');

  print(List.generate(lines, (x) => List.generate(x + 1, (_) => c++).join(' '))
      .join('\n'));

  print(
    Iterable.generate(lines)
        .map((x) => List.generate(x + 1, (_) => c++).join(' '))
        .join('\n'),
  );

  print(
      [for(int x = 0; x < 10; x++) x]
      );

  var x = List.generate(5, (x) => x);
  var y = Iterable.generate(5).toList();
  print(x.runtimeType);
  print(y.runtimeType);

  print(
      Iterable.generate( 100)
    );

  print([
    for (int x = 0; x < lines; x++) [for (int _ = 0; _ <= x; _++) c++].join(' ')
  ].join('\n'));
}
