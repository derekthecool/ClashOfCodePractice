using System;
using System.Text.RegularExpressions;
using System.Linq;

Regex.Matches(Console.ReadLine(), @"\d")
           .Select(m => int.Parse(m.Value))
           .Where(n => n != 0)
           .Select(n => String.Join("", Enumerable.Repeat(n, n)))
           .ToList()
           .ForEach(Console.Write);
