 #include "Lang.au3"
#include <Misc.au3>
#RequireAdmin
#NoTrayIcon
#Region
#AutoIt3Wrapper_icon=no.ico
#AutoIt3Wrapper_Compression=5
#AutoIt3Wrapper_Res_Comment=RunMemTest
#AutoIt3Wrapper_Res_Description=RunMemTest
#AutoIt3Wrapper_Res_Fileversion=2.5.0.0
#AutoIt3Wrapper_Res_LegalCopyright=噹噹
#EndRegion

_Singleton ("RunMemTest")

Global $reg = "HKCU\Software\Dang\MenTest"
Global $TitleName = RegRead ( $reg, "TitleName")

Global $MemtestLimitPos_Y, $MemtestLimitPos_X
Global $X, $Y

$MemtestStartPos_X = RegRead ( $reg, "MemtestStartPos_X")
$MemtestStartPos_Y = RegRead ( $reg, "MemtestStartPos_Y")

If Not StringIsDigit ($MemtestStartPos_X) Then $MemtestStartPos_X = 0
If Not StringIsDigit ($MemtestStartPos_Y) Then $MemtestStartPos_Y = 0

$MemtestLimitPos_X = RegRead ( $reg, "MemtestLimitPos_X")
$MemtestLimitPos_Y = RegRead ( $reg, "MemtestLimitPos_Y")

If Not StringIsDigit ($MemtestLimitPos_X) Then $MemtestLimitPos_X = @DesktopWidth
If Not StringIsDigit ($MemtestLimitPos_Y) Then $MemtestLimitPos_Y = @DesktopHeight

$MemtestoffsetPos_X = RegRead ( $reg, "MemtestoffsetPos_X")
$MemtestoffsetPos_Y = RegRead ( $reg, "MemtestoffsetPos_Y")

If Not StringIsDigit ($MemtestoffsetPos_X) Then $MemtestoffsetPos_X = 277
If Not StringIsDigit ($MemtestoffsetPos_Y) Then $MemtestoffsetPos_Y = 312

$FileName = RegRead ( $reg, "memTestProPath")
$Process = "memTestPro.exe"

Global $MemCnt = RegRead ( $reg, "MemCnt")
Global $MemSize = RegRead ( $reg, "MemSize")
Global $slptime = RegRead ( $reg, "slptime")
If $slptime = 0 Then;確定開啟的數量 如果不開啟補償 少開一個
	$MemCnt -= 1
EndIf
Global $handle[1]
Global $pid[$MemCnt]

For $i = 0 To $MemCnt
	If Run ($FileName) = 0 Then
		WinSetOnTop ( $TitleName, "", 0)
		MsgBox ( 16, $TitleName,"找不到 "&$FileName)
		WinSetOnTop ( $TitleName, "", 1)
		Exit
	EndIf
Next

_GetyMemTestListPid()

For $i = 0 To $MemCnt
	If RegRead ( $reg, "MemtestHIDE_Run") = 1 Then;;背景執行
		ToolTip (StringFormat ( $RunMemtestText, $i, $MemCnt, ($MemCnt-$i)), (@DesktopWidth/2)-(216/2), (@DesktopHeight/2)-(95/2))
		WinSetState ( $handle[$i], "", @SW_HIDE)
	Else
		If RegRead ( $reg, "MemtestDirection") = 2 Then;;橫
			If $i = 0 Then
				$X = $MemtestStartPos_X
				$Y = $MemtestStartPos_Y
				WinMove ( $handle[$i], "", $X, $Y)
				$Y = $MemtestStartPos_Y+$MemtestoffsetPos_Y
			Else
				WinMove ( $handle[$i], "", $X, $Y)
				$Y = $Y+$MemtestoffsetPos_Y
				If $MemtestLimitPos_Y < $Y+(301/2) Then
					$X = $X+$MemtestoffsetPos_X
					$Y = $MemtestStartPos_Y
				EndIf
			EndIf
		Else;;直
			If $i = 0 Then
				$X = $MemtestStartPos_X
				$Y = $MemtestStartPos_Y
				WinMove ( $handle[$i],"", $X, $Y)
				$X = $MemtestStartPos_X+$MemtestoffsetPos_X
			Else
				WinMove ($handle[$i],"", $X, $Y)
				$X = $X+$MemtestoffsetPos_X
				If $MemtestLimitPos_X < $X+(267/2) Then
					$X = $MemtestStartPos_X
					$Y = $Y+$MemtestoffsetPos_Y
				EndIf
			EndIf
		EndIf
	EndIf
Next
ToolTip ("")


Func _GetyMemTestListPid()

	$var = WinList()
	Local $j = 0
	Do
		$cnt = 0
		$var = WinList()
		For $i = 1 To $var[0][0]
		If StringCompare ( $var[$i][0], "[0 errors] MemTest  ", 1) =  0 Then
				$cnt += 1
				sleep (50)
			EndIf
		Next
;~ 		ToolTip ($cnt)
	Until $cnt > $MemCnt

	ReDim $handle[$cnt]

	For $i = 1 To $var[0][0]
		If StringCompare ( $var[$i][0], "[0 errors] MemTest  ",1) =  0 Then
			$find = True
		Else
			$find = False
		EndIf

		If $find = True Then
			$handle[$j] = $var[$i][1]
			$j += 1
		EndIf
	Next

	For $i = 0 To $j-1
		If $slptime <> 0 And  $i = ($j - 1)Then;確定開啟的數量 如果不開啟補償 少開一個
			WinSetTitle ( $handle[$i], "", "[0 errors] MemTest")
			ControlSetText  ( $handle[$i], "", "Button5", "保留記憶體使用")
		Else
			ControlSetText  ( $handle[$i], "", "Button5", $i)
		EndIf
		ControlMove ( $handle[$i], "", "Button5", 9999, 9999)
		ControlSetText  ( $handle[$i], "", "Edit1", $MemSize)
	Next
EndFunc