Attribute VB_Name = "Module1"
Function randNrBetweenWithException(lowerBound As Integer, upperBound As Integer, ParamArray excludedNrs() As Variant) As Integer
    ' makes the function act like the Excel random functions
    ' as a result it will be re-calculated every time the worksheet is calculated
    Application.Volatile
    
    Dim flagRandNrSameAsExcluded As Boolean
    
    Do
        flagRandNrSameAsExcluded = False
        ' get a random number between the upper and lower bounds parameters
        randNrBetweenWithException = Int(lowerBound + Rnd() * (upperBound - lowerBound + 1))
        
        For i = 0 To UBound(excludedNrs())
            If (randNrBetweenWithException = excludedNrs(i)) Then
                flagRandNrSameAsExcluded = True
            End If
        Next i
        
    Loop While (flagRandNrSameAsExcluded = True)
End Function

