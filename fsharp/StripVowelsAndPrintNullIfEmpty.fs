open System
open System.Text.RegularExpressions
Regex.Replace(Console.ReadLine().ToUpper(),"[AEIOUY]","")
|> fun x ->
    match x.Trim().Length with
    |0 -> "null"
    |_ -> x
|> printfn "%s"
