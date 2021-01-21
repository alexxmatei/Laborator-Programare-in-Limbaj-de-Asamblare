Attribute VB_Name = "Module4"
Sub saveRangeAsTextToPath()
    Dim fileName As String, filePath As String, lineText As String
    Dim myrng As Range, i, j
    globalVariable = globalVariable + 1
    
    fileName = "Sub_" & Format(globalVariable, "00") & ".asm"
    ' Final folder in path, Colocviu, must exist, if not it will not be saved
    filePath = folderPath & fileName
    
    Open filePath For Output As #1
    
    Set myrng = Range("C3:C112")
    
    For i = 1 To myrng.Rows.Count
        For j = 1 To myrng.Columns.Count
            lineText = IIf(j = 1, "", lineText & ",") & myrng.Cells(i, j)
        Next j
        Print #1, lineText
    Next i
    
    Close #1
End Sub


