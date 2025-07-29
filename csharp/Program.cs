using System;
using System.Collections.Generic;
using System.Linq;
var b=string.Join("",Enumerable.Range(0,Convert.ToInt32(Console.ReadLine())).Select(x => (char)Convert.ToInt32(Console.ReadLine(), 16)));
if (b.Length%2!=0)
{
var c = b.ToCharArray();
Array.Reverse(c);
b=new string(c);
}

Console.WriteLine(b);
