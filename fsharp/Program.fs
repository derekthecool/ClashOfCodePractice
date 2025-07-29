open System
open System.Text.RegularExpressions
let a=Console.ReadLine
Regex.Matches(a(),@"\d")
|>Seq.cast<Match>
|>Seq.map(fun x->x.Value)
|>fun x->String.Join(a(),x)
|>printfn"%s"
