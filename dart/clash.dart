import'dart:io';void main(){print(stdin.readLineSync()!.toLowerCase().replaceAll(RegExp('[^a-z]'),'').codeUnits.map((e)=>e-96).fold(0,(int a,int b)=>a!+b));}
