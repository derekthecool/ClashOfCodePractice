Module Solution
Sub Main ()
Dim t=Console.ReadLine()
Dim n as Integer=Console.ReadLine(),s=0
For i=1 To n
If i Mod 2=0 Then
If t="even" Then
s=s+i
End If
else
If t="odd" Then
s=s+i
End If
End If
Next
Console.WriteLine(s)
End Sub
End Module
