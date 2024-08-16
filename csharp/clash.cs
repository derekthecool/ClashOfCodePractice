using System;
using System.Linq;
var o=Console.ReadLine();
var r=string.Concat(Enumerable.Reverse(o));
Console.WriteLine(o==r?"wins":"loses");
