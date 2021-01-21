Attribute VB_Name = "Module2"
Option Explicit

Public Sub ShuffleGridE16_E20()
Attribute ShuffleGridE16_E20.VB_ProcData.VB_Invoke_Func = "S\n14"
  

  Dim rngSelected As Range
  Set rngSelected = Application.Range("E16:E20")

  Dim horizontalLength As Long
  Dim verticalLength As Long

  horizontalLength = rngSelected.Columns.Count
  verticalLength = rngSelected.Rows.Count

  Dim i As Long
  Dim j As Long

  For i = verticalLength To 1 Step -1
    For j = horizontalLength To 1 Step -1
      Dim rndRow As Long
      Dim rndColumn As Long
      rndRow = Application.WorksheetFunction.RoundDown(verticalLength * Rnd + 1, 0)
      rndColumn = Application.WorksheetFunction.RoundDown(horizontalLength * Rnd + 1, 0)

      Dim temp As String
      Dim tempColor As Long
      Dim tempFontColor As Long

      temp = rngSelected.Cells(i, j).Formula
      tempColor = rngSelected.Cells(i, j).Interior.Color
      tempFontColor = rngSelected.Cells(i, j).Font.Color

      rngSelected.Cells(i, j).Formula = rngSelected.Cells(rndRow, rndColumn).Formula
      rngSelected.Cells(i, j).Interior.Color = rngSelected.Cells(rndRow, rndColumn).Interior.Color
      rngSelected.Cells(i, j).Font.Color = rngSelected.Cells(rndRow, rndColumn).Font.Color

      rngSelected.Cells(rndRow, rndColumn).Formula = temp
      rngSelected.Cells(rndRow, rndColumn).Interior.Color = tempColor
      rngSelected.Cells(rndRow, rndColumn).Font.Color = tempFontColor
    Next j
  Next i

End Sub
