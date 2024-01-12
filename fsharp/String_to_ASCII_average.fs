open System
Console.ReadLine()
|> Seq.map float
|> Seq.average
|> fun x -> printfn "%A" (int x)
