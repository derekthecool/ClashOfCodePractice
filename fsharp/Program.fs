open System
let a=Console.ReadLine
let m=a()|>int
let y=a()|>int
Console.WriteLine(DateTime.DaysInMonth(y,m))
