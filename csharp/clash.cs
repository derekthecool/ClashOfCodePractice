using System.Collections.Generic;
using System;
using System.Linq;
using System.Text.RegularExpressions;

var input=Console.ReadLine();
int vowelCount = Regex.Matches(input.ToUpper(), @"[AEIOU]").Count();
for(int i = 0; i <vowelCount; i++){
     Console.WriteLine(input);
}
if (vowelCount == 0)
{
  Console.WriteLine($"NONE");
}

