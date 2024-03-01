import 'dart:io';
void main() {
var n=int.parse(stdin.readLineSync()!);
var a=print;
if(n<32){a('January');}
else if(n<61){a('February');}
else if(n<92){a('March');}
else if(n<122){a('April');}
else if(n<153){a('May');}
else if(n<183){a('June');}
else if(n<213){a('July');}
else if(n<244){a('August');}
else if(n<274){a('September');}
else if(n<305){a('October');}
else if(n<335){a('November');}
else {a('December');}
}
