import 'dart:io';
main(){
var W=stdin.readLineSync()!.split(' ').map(int.parse).toList();
var s=(W[0]+W[1])*4,c=2,x=W.reduce((a,b)=>a+b*++c);
print('$s $x ${s-x>9?"No":"Yes"}');
}
