using System.Collections.Generic;
using System;
using System.Linq;
using System.Text.RegularExpressions;

string[] inputs = Console.ReadLine().Split(' ');
float width = float.Parse(inputs[0]);
float height = float.Parse(inputs[1]);
float coef = float.Parse(Console.ReadLine());

int Answer = Math.Round(Math.Sqrt(width*width + height*height)*coef);
Console.WriteLine($"{}");
