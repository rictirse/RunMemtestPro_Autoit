 #include "Lang.au3"
#include <Misc.au3>
#RequireAdmin
#NoTrayIcon
#Region
#AutoIt3Wrapper_icon=no.ico
#AutoIt3Wrapper_Compression=5
#AutoIt3Wrapper_Res_Comment=StartMemTest
#AutoIt3Wrapper_Res_Description=StartMemTest
#AutoIt3Wrapper_Res_Fileversion=2.5.0.0
#AutoIt3Wrapper_Res_LegalCopyright=噹噹
#EndRegion

_Singleton ("StartMemTest")

Global $reg = "HKCU\Software\Dang\MenTest"
Global $MemCnt =RegRead ( $reg, "MemCnt")
Global $slptime = RegRead ( $reg, "slptime")
Global $MemSize = RegRead ( $reg, "MemSize")
Global $handle[1], $BTNText[1]
Global $MemtestLayers
Global $StartMem = MemGetStats();;記憶起始記憶體
Global $NowMem;;目前記憶體使用率
Global $UseMem = ($MemCnt*$MemSize)*2^10
Global $UseMemPercentage = Int ($UseMem/$StartMem[2]*100)
Global $WaitCnt = 0

If RegRead ( $reg, "MemtestLayers") = 0 Then
	$MemtestLayers = 1;;啟動排序
Else
	$MemtestLayers = 0;;不啟動排序
EndIf

Global $MemtestHIDE_Run
If RegRead ( $reg, "MemtestHIDE_Run") = 1 Then
	$MemtestHIDE_Run = 1;;隱藏啟動Memtest
Else
	$MemtestHIDE_Run = 0;;正常起動
EndIf

_GetyMemTestListPid()

Func _GetyMemTestListPid()
	$var = WinList()
	Local $j = 0
	Local $Pos

	Do
		$cnt = 0
		$var = WinList()
		For $i = 1 To $var[0][0]
		If StringCompare ( $var[$i][0], "[0 errors] MemTest  ",1) =  0 Then
				$cnt += 1
				sleep (50)
			EndIf
		Next
;~ 		ToolTip ($cnt)
	Until $cnt >= $MemCnt
	ReDim $handle[$cnt]
	ReDim $BTNText[$cnt]

	For $i = 1 To $var[0][0]
		If StringCompare ( $var[$i][0], "[0 errors] MemTest  ",1) =  0 Then
			$find = True
		Else
			$find = False
		EndIf

		If $find = True Then
			$handle[$j] =$var[$i][1];hwnd
			$BTNText[$j]=ControlGetText ( $handle[$j], "", "Button5");get num
			$j += 1
		EndIf
	Next

;~ 	MsgBox (0,"", "")

	For $i=0 to UBound($BTNText)-2
		$Pos = FindMinIndex ($BTNText, $i)
		Swap($BTNText[$i], $BTNText[$pos])
		Swap($handle[$i], $handle[$pos])
	Next

;~ 	Display ($BTNText)

	For $i = 0 To ($j-1)
		If $MemtestLayers = 1 And $MemtestHIDE_Run = 0 And 95 >= $UseMemPercentage Then WinActivate ($handle[$i]);;不啟動隱藏，記憶體使用率不達95%，自動整理排面
		ControlClick ( $handle[$i], "", "Button1")
	Next

	$begin = TimerInit()

	If $MemtestLayers = 1 And $MemtestHIDE_Run = 0 And $UseMemPercentage >= 96 Then

		While True
			ToolTip ( $WaitArrangement, 0, 0)
			Sleep (500)
			$NowMem = MemGetStats()
			If 99 >= $NowMem[2] Then ExitLoop

			$WaitCnt += 1
			If $WaitCnt > 25 Then ExitLoop
		WEnd

		While True
			$NowMem = MemGetStats()
			If $NowMem[2] >= 98 Then ExitLoop
			Sleep (500)
			$dif = TimerDiff ($begin)
			If ($dif/1000) > 90 Then ExitLoop;;120秒後自動整理
			ToolTip ( StringFormat ( $WaitArrangementString, ($dif/1000)), 0, 0)
		WEnd

		For $i = 0 To ($j-1)
			WinActivate ($handle[$i]);;自動整理排面
		Next

	EndIf

;~ 	If $slptime = 0 Then;確定開啟的數量 如果不開啟補償 少開一個
;~ 		For $i = 0 To ($j-1)
;~ 			If $MemtestLayers = 1 And $MemtestHIDE_Run = 0 Then WinActivate ($handle[$i])
;~ 			ControlClick ( $handle[$i], "", "Button1")
;~ 		Next
;~ 	Else
;~ 		For $i = 0 To ($j-1)
;~ 			If $i <> ($j-1) Then
;~ 				If $MemtestLayers = 1 And $MemtestHIDE_Run = 0 Then WinActivate ($handle[$i])
;~ 				ControlClick ( $handle[$i], "", "Button1")
;~ 			EndIf
;~ 		Next
;~ 	EndIf

EndFunc

Func Swap( ByRef $a, ByRef $b)
	Local $Tmp = $a
	$a = $b
	$b = $Tmp
EndFunc

Func FindMaxIndex(const $arr, const $Start_Pos)
	Local $Pos = $Start_Pos
	For $i=$Pos+1 to UBound($arr)-1
		If($arr[$i] > $arr[$Pos]) Then
			$Pos=$i
		EndIf
	Next
	return $Pos
EndFunc

Func FindMinIndex(const $arr, const $Start_Pos)
	Local $Pos = $Start_Pos
	For $i=$Pos+1 to UBound($arr)-1
		If($arr[$i] < $arr[$Pos]) Then
			$Pos=$i
		EndIf
	Next
	return $Pos
EndFunc

Func Display(const $data)
	Local $Msg=""
	For $i=0 to UBound($data)-1
		$Msg = $Msg & StringFormat("data[%d] = %d\n", $i, $data[$i])
	Next
	MsgBox(0, "Display data[10]", $Msg)
EndFunc
