using System;
using System.Linq;
var a=Console.ReadLine();
Enumerable.Range(0, a.Length%2==0?a.Length/2:a.Length/2+1)
.Select(i  => $"{a.Substring(i, (i-2))}")
.ToList()
.ForEach(Console.WriteLine);


