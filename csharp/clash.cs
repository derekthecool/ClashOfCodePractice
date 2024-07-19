using System;
using System.Text.RegularExpressions;
var a=Int64.Parse(Console.ReadLine());
var b=Int64.Parse(Console.ReadLine());
Console.WriteLine(Regex.Replace($"{a-b}{a*b}{a+b}","^0+$","0"));
