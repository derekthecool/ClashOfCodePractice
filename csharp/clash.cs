using System;
using System.Linq;

Enumerable.Range(0, int.Parse(Console.ReadLine()))
.Select(_ =>
        Convert.ToString(int.Parse(Console.ReadLine()), 2)
        .SkipWhile(x => x == '0')
        .Count()
)
.ToList()
.ForEach(Console.WriteLine);
