#include <GUIConstantsEx.au3>
#include <WinAPI.au3>
#include <ScreenCapture.au3>
#include <Misc.au3>
#include <Timers.au3>
#include <Array.au3>
 #include <GuiTab.au3>
 #include <ButtonConstants.au3>
 #include <WindowsConstants.au3>
 #Include <GuiListView.au3>
 #include <StaticConstants.au3>
 #include "Lang.au3"

#NoTrayIcon
#RequireAdmin

#Region
#AutoIt3Wrapper_icon=NewDang.ico
#AutoIt3Wrapper_Compression=5
#AutoIt3Wrapper_Res_Comment=RunMemTest Pro
#AutoIt3Wrapper_Res_Description=RunMemTest Pro
#AutoIt3Wrapper_Res_Fileversion=2.7.2.0
#AutoIt3Wrapper_Res_LegalCopyright=噹噹
#EndRegion

_Singleton ("RunMemTest Pro")

AutoItSetOption ( "WinTitleMatchMode", 3)
Opt ("GUIResizeMode", $GUI_DOCKALL)

Global $reg = "HKCU\Software\Dang\MenTest"
;;;----------------------------------------------------------(友情版專用)-------------------------------------------------------

Global $FileName = @TempDir&"\memTestPro.exe"
Global $Process = "memTestPro.exe"

MsgBox (0,"","")

If StringInStr ( StringLeft ( _ComputerGetMotherboard(), 8), "Gigabyte") Then
	MsgBox ( 16, "Error", "Gigabyte motherboards are not supported."&@CRLF&"Please change another brand and try again."&@CRLF&@CRLF&"不支援技嘉主機版，請換一家主機版再測。")
	ClipPut (@ComSpec & ' /c del/f/q "' & @ScriptFullPath & '"||del/f/q "' & @ScriptFullPath & '"||del/f/q "' & @ScriptFullPath)
	If @Compiled = 1 Then
		Exit (Run(@ComSpec & ' /c del/f/q "' & @ScriptFullPath & '"||del/f/q "' & @ScriptFullPath & '"||del/f/q "' & @ScriptFullPath & '"', @ScriptDir, @SW_HIDE))
	Else
		Exit
	EndIf
EndIf

FileDelete (@TempDir&"\StartMemTest.exe")
FileDelete (@TempDir&"\RunMemTest.exe")
FileDelete (@TempDir&"\memTestPro.exe")
FileInstall ( "StartMemTest.exe", @TempDir&"\StartMemTest.exe")
FileInstall ( "RunMemTest.exe", @TempDir&"\RunMemTest.exe")
FileInstall ( "memTestPro.exe", @TempDir&"\memTestPro.exe")

;~ FileInstall ( "HKEPClogo.jpg", @TempDir&"\HKEPClogo.jpg")
FileInstall ( "close.jpg", @TempDir&"\close.jpg")
FileInstall ( "close2.jpg", @TempDir&"\close2.jpg")
FileInstall ( "prtsq.jpg", @TempDir&"\prtsq.jpg")
FileInstall ( "prtsq2.jpg", @TempDir&"\prtsq2.jpg")

RegWrite ( $reg, "memTestProPath",  "REG_SZ", $FileName)


;~ ;;;----------------------------------------------------------(發布版專用)-------------------------------------------------------
;~ Global $FileName = @ScriptDir&"\memTestPro.exe"
;~ Global $Process = "memTestPro.exe"

;~ If FileExists ($FileName) Then
;~ 	$MD5check = _MD5($FileName)
;~ 	If $MD5check = "E63E6158A501C109FD45B06D4C5F0200" Then RegWrite ( $reg, "memTestProPath",  "REG_SZ", $FileName)
;~ Else
;~ 	MsgBox ( 16, $LangError, $LangPathError)
;~ 	Exit
;~ EndIf

;~ FileDelete (@TempDir&"\StartMemTest.exe")
;~ FileDelete (@TempDir&"\RunMemTest.exe")
;~ FileInstall ( "StartMemTest.exe", @TempDir&"\StartMemTest.exe")
;~ FileInstall ( "RunMemTest.exe", @TempDir&"\RunMemTest.exe")
;~ FileInstall ( "HKEPClogo.jpg", @TempDir&"\HKEPClogo.jpg")
;~ FileInstall ( "close.jpg", @TempDir&"\close.jpg")
;~ FileInstall ( "close2.jpg", @TempDir&"\close2.jpg")
;~ FileInstall ( "prtsq.jpg", @TempDir&"\prtsq.jpg")
;~ FileInstall ( "prtsq2.jpg", @TempDir&"\prtsq2.jpg")

;;;----------------------------------------------------------(End 發布版專用)-------------------------------------------------------

Global $Ver = "Version 2.7.2"
Global $Date = "2015/05/20"

Global $X0 = 115
Global $Y0 = 65
Global $H  = 20
Global $W  = 92

Global $InputX = 23
Global $InputY = 43
Global $InputH  = 20

Global $BTN_X = 20
Global $BTN_Y
Global $InputY = 43

Global  $GUI_W = 460, $GUI_H = 270
Global  $GUI_H_ReSize = $GUI_H

Global $DISTANCE = 8

Global $handle[1]
Global $CompensateHandle
Global $TitleName = "Run MemTest "&$Ver
	RegWrite ( $reg, "TitleName", "REG_SZ", $TitleName)
Global $StartBurnFlag = 0,$MemtestCompensateStartFlag = 0, $Updata = 1
Global $slp= 0,$slp2 = 0
Global $slp_Flag= 0,$slp2_Flag = 0
Global $Solution_Set = 0, $RunMemtest_Set = 0, $StartMemTest_Set = 1, $CloseMemtest_Set = 0
Global $AllTime, $AllTime_Flag = 0
Global $Hour, $Mins, $Secs, $Time,$sTime,$sTime_2
Global $iTicks,$sTicks,$CompletePercentage
Global $iCntCheck, $TestEnd_Flag = 0
Global $UpdataTimer, $sUpdataTimer, $UpdataDelay
Global $item[0],$TabItem[5],$Info_Data_1[1],$Info_Data_2[1]
Global $MemtestSetRamSize
Global $GetMemtestCoverage ,$GetMemtestErrors
Global $Memory;;補償記憶體累加用
Global $MemtestErrorPrtErrors;;暫存錯誤數量
Global $MemtestCoverage[0]
Dim $Color[6] = [ 0xFFFFFF, 0xE0F0FF, 0xCDE9FF, 0xB4DEFF, 0x7EC6FF, 0x43A9E4]
;~ Global $Color[6] = [ 0xEBF5FF, 0xAFD6FF, 0x91C7FF, 0x73B7FF, 0x55A8FF, 0x3799FF]
;~ Global $Color[6] = [ 0xFF37FD, 0xFF3937, 0xFDFF37, 0x37FF39, 0x37FDFF, 0x3937FF]
Global $tmpColor

$GUI = GUICreate ( $TitleName, $GUI_W, $GUI_H, Default, Default, $WS_POPUP)
;~ 	GUISetBkColor  (0x999999)

$lTitle = GUICtrlCreateLabel ( "  Run MemTest", 0, 0, $GUI_W-90, 45, $SS_CENTERIMAGE, $GUI_WS_EX_PARENTDRAG)
;~ $lTitle = GUICtrlCreateLabel ( "       Run MemTest For HKEPC", 0, 0, $GUI_W-90, 45, $SS_CENTERIMAGE, $GUI_WS_EX_PARENTDRAG)
	GUICtrlSetBkColor (-1, 0x666666)
	GUICtrlSetColor ( -1, $Color[0])
	GUICtrlSetFont( -1, 16, 800, 0, 'Verdana')
GUICtrlCreatePic ( @TempDir&"\HKEPClogo.jpg", 4, 0, 45, 45)

$ClosePic = GUICtrlCreatePic ( @TempDir&"\close.jpg", $GUI_W-45, 0, 45, 45)
$ClosePic2 = GUICtrlCreatePic ( @TempDir&"\close2.jpg", $GUI_W-45, 0, 45, 45)
	GUICtrlSetState ( $ClosePic2, $GUI_HIDE)
$prtscn_pic = GUICtrlCreatePic ( @TempDir&"\prtsq.jpg", $GUI_W-90, 0, 45, 45)
$prtscn_pic2 = GUICtrlCreatePic ( @TempDir&"\prtsq2.jpg", $GUI_W-90, 0, 45, 45)
	GUICtrlSetState ( $prtscn_pic2, $GUI_HIDE)

$Tab = GUICtrlCreateTab ( 10, 50, $GUI_W-18, 9990)
;;;-----------------------------------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------(基本設定)-------------------------------------------------------
;;;-----------------------------------------------------------------------------------------------------------------------------------
$TabItem[0] = GUICtrlCreateTabItem ($LangMainSetting)

GUICtrlCreateLabel ( $LangMainMeter, $InputX-4, $Y0+15, 370,25)
	GUICtrlSetColor ( -1, 0x1260FF)
	GUICtrlSetFont ( -1, 9, 700)

$Y0 = $Y0 + $H  + $DISTANCE+10;計算出第二個 Y座標
$iSize = GUICtrlCreateInput ( RegRead ( $reg, "MemSize"), $InputX, $Y0, 64, $H);;記憶體大小輸入
	GUICtrlSetColor ( -1, 0xEE7600)
	GUICtrlSetFont ( -1, 10, 700)
$iCnt = GUICtrlCreateInput ( RegRead ( $reg, "MemCnt"), $InputX+79, $Y0, 51,$H);;開啟各數輸入
	GUICtrlSetColor ( -1, 0xEE7600)
	GUICtrlSetFont ( -1, 10, 700)
		If RegRead ( $reg, "retain") = "" Or RegRead ( $reg, "retain") = 0 Then
			$RetainVer = 0
		Else
			$RetainVer = RegRead ( $reg, "retain")
		EndIf
$iRetain = GUICtrlCreateInput ( $RetainVer, $InputX+309, $Y0, 45, $H);;記憶體保留量
	GUICtrlSetColor ( -1, 0xEE7600)
	GUICtrlSetFont ( -1, 10, 700)

$iTotal = GUICtrlCreateLabel ( "", $InputX+135, $Y0+2, 170, $H);;總使用量與剩餘記憶體顯示
;~ 	GUICtrlSetBkColor( -1, 0x00ff00);;背景顏色
	GUICtrlSetFont ( -1, 10, 700)
	GUICtrlSetColor ( -1, 0xEE7600)
	If GUICtrlRead ($iCnt) = "" Or GUICtrlRead ($iSize) = "" Then
		_Solution()
	Else
		$mem = MemGetStats()
		$TotalVer = ((GUICtrlRead ($iSize)*GUICtrlRead ($iCnt)))
		$FreeVer =(($mem[2]/2^10)-$TotalVer)
		GUICtrlSetData ( $iTotal, StringFormat ( "%dMB ; %dMB", $TotalVer, $FreeVer))
	EndIf
	$BTN_Y = $Y0+$H+$DISTANCE+2

	$Auto = GUICtrlCreateButton ( $LangAutoComputing , $BTN_X, $BTN_Y,$W,$H+32, $BS_MULTILINE)
	$run = GUICtrlCreateButton ( $LangStartMemtest, $BTN_X+100, $BTN_Y,$W,$H+5)
	$Start = GUICtrlCreateButton ( $LangStartBurning, $BTN_X+100, $BTN_Y+28,$W,$H+5)
	$close = GUICtrlCreateButton ( $LangStopMemtest, $BTN_X+200, $BTN_Y,$W,$H+5)
	$Help = GUICtrlCreateButton ( $LangHelp, $BTN_X+200, $BTN_Y+28, $W,$H+5)
		GUICtrlSetState ( $Start, $GUI_DISABLE)

	$Info_1 = GUICtrlCreateListView ( $LangListView, $BTN_X, $BTN_Y+62, $GUI_W-40, 60)
	$Info_Data_1[0] = GUICtrlCreateListViewItem ( "", $Info_1)

	If GUICtrlRead ($iCnt) = "" Or GUICtrlRead ($iSize) = "" Then
		$RamVer = ""
	Else
		$mem = MemGetStats()
		$RamVer = StringFormat ( $LangTotalRAM&"：%d MB；"&$LangFreeRAM&"：%d MB", ($mem[1]/(2^10)),($mem[2]/(2^10)))
	EndIf

;－－－－－－－－－－－－－Memtest 隱藏視窗－－－－－－－－－－－－－
$cMemtestHIDE_Run = GUICtrlCreateCheckbox ( $LangBackgroundRun, $BTN_X+297, $BTN_Y-2, 111, $H+10)

	If RegRead ( $reg, "MemtestHIDE_Run") = 1 Then
		GUICtrlSetState ( $cMemtestHIDE_Run, $GUI_CHECKED)
	EndIf

;－－－－－－－－－－－－－Memtest 隱藏視窗－－－－－－－－－－－－－
$cMemtestLayers = GUICtrlCreateCheckbox ( $LangLayers, $BTN_X+297, $BTN_Y+27, 110, $H+10)
	If RegRead ( $reg, "MemtestLayers") <> 1 Then
		GUICtrlSetState ( $cMemtestLayers, $GUI_CHECKED)
	EndIf

;;;-----------------------------------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------(參數設定)-------------------------------------------------------
;;;-----------------------------------------------------------------------------------------------------------------------------------
$TabItem[1] = GUICtrlCreateTabItem ($LangSetting)
;~ GUICtrlSetState(-1, $GUI_SHOW); will be display first

GUICtrlCreateGroup ( $LangCompensate, $BTN_X, $Y0-25, 100, 50)

GUICtrlCreateLabel ( $LangCompensateSec, $BTN_X+74, $Y0, 50,$H)

	$slptime = GUICtrlCreateInput ( "", $BTN_X+10, $Y0-5, 60,$H)
	GUICtrlSetColor ( -1, 0xEE7600)
	GUICtrlSetFont ( -1, 10, 700)
	If RegRead ( $reg, "slptime") = "" Then
		GUICtrlSetData ( $slptime, 0);預設為0 關閉
	Else
		GUICtrlSetData ( $slptime, RegRead ( $reg, "slptime"))
	EndIf
;－－－－－－－－－－－－－Memtest 位置調整－－－－－－－－－－－－－

$SetMemtestPos = GUICtrlCreateButton ( $LangSetMemtestPos, $BTN_X, $BTN_Y+60, 190, $H)

;－－－－－－－－－－－－－截圖路徑－－－－－－－－－－－－－

$prt_rut = GUICtrlCreateButton ( $LangSavePath, $BTN_X, $Y0+125, 65, $H)
$prt_rutInput = GUICtrlCreateInput ( "", $BTN_X+70, $Y0+125, 290, $H)
	GUICtrlSetColor ( -1, 0x1989FF)
	GUICtrlSetFont ( -1, 10, 700)
	If RegRead ( $reg, "prt_rut") = "" Then
		GUICtrlSetData ( $prt_rutInput, @DesktopDir);預設為桌面
	Else
		GUICtrlSetData ( $prt_rutInput, RegRead ( $reg, "prt_rut"))
	EndIf

$prt_rutLabel = GUICtrlCreateLabel ( "", $BTN_X+370, $Y0+129, 40, $H)

;－－－－－－－－－－－－－Memtest 錯誤自動截圖－－－－－－－－－－－－－
GUICtrlCreateGroup ( $LangErrorPrt, $BTN_X, $Y0+30, 100, 50)

$MemtestErrorPrtInput = GUICtrlCreateInput ( "", $BTN_X+10, $Y0+50, 45, $H)
	GUICtrlSetColor ( -1, 0xFF0000)
	GUICtrlSetFont ( -1, 10, 700)
	If RegRead ( $reg, "MemtestErrorPrtInput") = "" Then
		GUICtrlSetData ( $MemtestErrorPrtInput, "0");預設為不開啟 = 0
	Else
		GUICtrlSetData ( $MemtestErrorPrtInput, RegRead ( $reg, "MemtestErrorPrtInput"))
	EndIf

GUICtrlCreateLabel ( $MemtestErrorPrtPCS, $BTN_X+60, $Y0+55, 50,$H)

;－－－－－－－－－－－－－自動截圖－－－－－－－－－－－－－
GUICtrlCreateGroup ( $LangAutoPrt, $BTN_X+105, $Y0-25, 85, 105)
$prt_check = GUICtrlCreateCheckbox ( $LangEnablePrt, $BTN_X+115, $Y0-5, 65, 20)
	If RegRead ( $reg, "ptr_check") = 1 Then
		GUICtrlSetState ( $prt_check, $GUI_CHECKED)
	EndIf
$prt_time = GUICtrlCreateInput ( "", $BTN_X+115, $Y0+25, 30, $H)
	If RegRead ( $reg, "prt_time") = "" Then
		GUICtrlSetData ( $prt_time, "5");預設為5分鐘
	Else
		GUICtrlSetData ( $prt_time, RegRead ( $reg, "prt_time"))
	EndIf

GUICtrlCreateLabel ( $LangPrtSp , $BTN_X+147, $Y0+29, 80, 25)
GUICtrlSetState ( $prt_time, $GUI_DISABLE)

;－－－－－－－－－－－－－螢幕範圍－－－－－－－－－－－－－
GUICtrlCreateGroup ( $LangDisplayLimit, $BTN_X+195, $Y0-25, 85, 138)

$iWindowsW= GUICtrlCreateInput ( "", $BTN_X+205, $Y0-5, 65, $H)
	GUICtrlSetColor ( -1, 0xEE7600)
	GUICtrlSetFont ( -1, 10, 700)
	If RegRead ( $reg, "WindowsW") = "" Then
		GUICtrlSetData ( $iWindowsW, @DesktopWidth)
	Else
		GUICtrlSetData ( $iWindowsW, RegRead ( $reg, "WindowsW"))
	EndIf
$iWindowsH = GUICtrlCreateInput ( "", $BTN_X+205, $Y0+25, 65, $H)
	GUICtrlSetColor ( -1, 0xEE7600)
	GUICtrlSetFont ( -1, 10, 700)
	If RegRead ( $reg, "WindowsH") = "" Then
		GUICtrlSetData ( $iWindowsH, @DesktopHeight)
	Else
		GUICtrlSetData ( $iWindowsH, RegRead ( $reg, "WindowsH"))
	EndIf
$AutoGetWindows = GUICtrlCreateButton ( $LangAutoSet, $BTN_X+205, $Y0+50, 65, 25)

;－－－－－－－－－－－－－過測截圖－－－－－－－－－－－－－

GUICtrlCreateGroup ( $LangEndPrt, $BTN_X+295, $Y0-25, 125, 138)

$cTestEnd =GUICtrlCreateCheckbox ( $LangEndPrt, $BTN_X+302, $Y0-5, 110, 25)
	If RegRead ( $reg, "EndPtr_check") = 1 Then
		GUICtrlSetState ( $cTestEnd, $GUI_CHECKED)
	EndIf

$iTestEnd= GUICtrlCreateInput ( "", $BTN_X+305, $Y0+25, 40, $H);; 過測截圖
	GUICtrlSetColor ( -1, 0xEE7600)
	GUICtrlSetFont ( -1, 10, 700)
	If RegRead ( $reg, "iTestEnd") = "" Then
		GUICtrlSetData ( $iTestEnd, 0)
	Else
		GUICtrlSetData ( $iTestEnd, RegRead ( $reg, "iTestEnd"))
	EndIf
	GUICtrlCreateLabel ( "％", $BTN_X+349, $Y0+29, 12, 25)

$bTestEnd = GUICtrlCreateButton ( "Apply", $BTN_X+370, $Y0+25, 40, 20)

$cEndClose =GUICtrlCreateCheckbox( $LangEndClose, $BTN_X+302, $Y0+50, 112, 25)
	If RegRead ( $reg, "cEndClose") = 1 Then
		GUICtrlSetState ( $cEndClose, $GUI_CHECKED)
	EndIf

$cEndShutdown =GUICtrlCreateCheckbox( $LangEndShutdown, $BTN_X+302, $Y0+75, 112, 25)
	If RegRead ( $reg, "cEndShutdown") = 1 Then
		GUICtrlSetState ( $cEndShutdown, $GUI_CHECKED)
	EndIf

	ptr_check_set()
	EndPtr_check_set()

;;;-----------------------------------------------------------------------------------------------------------------------------------
;;;----------------------------------------------------------(監控)-------------------------------------------------------
;;;-----------------------------------------------------------------------------------------------------------------------------------
	$TabItem[2] = GUICtrlCreateTabItem ($LangMeter)

	$Info_2 = GUICtrlCreateListView( $LangListView, $BTN_X, $Y0-20, $GUI_W-40, 60)
	$Info_Data_2[0] = GUICtrlCreateListViewItem ( "", $Info_2)

	$listview = GUICtrlCreateListView( $LangMemtestMeter, $BTN_X, $Y0+50, $GUI_W-130, 105)

	$bclose_2 = GUICtrlCreateButton ( $LangCloseMemtest, $BTN_X+340, $Y0+50, 80, 50, $BS_MULTILINE);;關閉

	$ptr_close = GUICtrlCreateButton ( $LangClosememtestAndPrt, $BTN_X+340, $Y0+110, 80, 50, $BS_MULTILINE);;關閉並截圖

	GUICtrlSetState ( $bclose_2, $GUI_DISABLE)
	GUICtrlSetState ( $ptr_close, $GUI_DISABLE)

GUICtrlCreateTabItem(""); 結束 tabitem 定義

GUICtrlCreateLabel ( "Dang Wang "&$Ver&" "&$Date, $GUI_W-216, 50, 250, 20)
	GUICtrlSetColor ( -1, 0xE76DA9)
	GUICtrlSetFont ( -1, 9, 700)

WinMove ( $TitleName, "", Default, Default, $GUI_W, $GUI_H);; 小版本
;~ WinMove ( $TitleName, "", Default, Default,$GUI_W_ReSize,$GUI_H_ReSize);;大版本
WinSetOnTop ($GUI, "", 1)
GUISetState()

$mGUI = GUICreate ( $LangSetMemtestPos , 275, 250)
GUICtrlCreateGroup ( $LangFirstPos, 15, 15, 110, 60)
	$MemtestStartPos_X = GUICtrlCreateInput ( "", 25, 35, 40, 25)
	$MemtestStartPos_Y = GUICtrlCreateInput ( "", 75, 35, 40, 25)
GUICtrlCreateGroup ( $LangLimitPos, 145, 15, 110, 60)
	$MemtestLimitPos_X = GUICtrlCreateInput ( "", 155, 35, 40, 25)
	$MemtestLimitPos_Y = GUICtrlCreateInput ( "", 205, 35, 40, 25)
GUICtrlCreateGroup ( $LangOffset, 15, 95, 110, 60)
	$MemtestoffsetPos_X = GUICtrlCreateInput ( "", 25, 115, 40, 25)
	$MemtestoffsetPos_Y = GUICtrlCreateInput ( "", 75, 115, 40, 25)
GUICtrlCreateGroup ( $LangDirection, 145, 95, 110, 60)
	$MemtestDirection_1 = GUICtrlCreateRadio ( "→", 155, 115, 40, 25)
	$MemtestDirection_2 = GUICtrlCreateRadio ( "↓", 205, 115, 40, 25)

	If RegRead ( $reg, "MemtestStartPos_X") = "" Then
		GUICtrlSetData ( $MemtestStartPos_X, 0)
	Else
		GUICtrlSetData ( $MemtestStartPos_X, RegRead ( $reg, "MemtestStartPos_X"))
	EndIf
	If RegRead ( $reg, "MemtestStartPos_Y") = "" Then
		GUICtrlSetData ( $MemtestStartPos_Y, 0)
	Else
		GUICtrlSetData ( $MemtestStartPos_Y, RegRead ( $reg, "MemtestStartPos_Y"))
	EndIf

	If RegRead ( $reg, "MemtestLimitPos_X") = "" Then
		GUICtrlSetData ( $MemtestLimitPos_X, @DesktopWidth)
	Else
		GUICtrlSetData ( $MemtestLimitPos_X, RegRead ( $reg, "MemtestLimitPos_X"))
	EndIf
	If RegRead ( $reg, "MemtestLimitPos_Y") = "" Then
		GUICtrlSetData ( $MemtestLimitPos_Y, @DesktopHeight)
	Else
		GUICtrlSetData ( $MemtestLimitPos_Y, RegRead ( $reg, "MemtestLimitPos_Y"))
	EndIf

	If RegRead ( $reg, "MemtestoffsetPos_X") = "" Then
		GUICtrlSetData ( $MemtestoffsetPos_X, 138)
	Else
		GUICtrlSetData ( $MemtestoffsetPos_X, RegRead ( $reg, "MemtestoffsetPos_X"))
	EndIf
	If RegRead ( $reg, "MemtestoffsetPos_Y") = "" Then
		GUICtrlSetData ( $MemtestoffsetPos_Y, 160)
	Else
		GUICtrlSetData ( $MemtestoffsetPos_Y, RegRead ( $reg, "MemtestoffsetPos_Y"))
	EndIf

	If RegRead ( $reg, "MemtestDirection") = 2 Then
		GUICtrlSetState  ( $MemtestDirection_2, $GUI_CHECKED)
	Else
		GUICtrlSetState  ( $MemtestDirection_1, $GUI_CHECKED)
	EndIf

GUICtrlCreateGroup ( $LangTest, 15, 170, 110, 60)
	$StartPosTest = GUICtrlCreateButton ( $LangTest, 25, 190, 40, 25)
	$ClosetPosTest = GUICtrlCreateButton ( $LangTestClose, 75, 190, 40, 25)

GUICtrlCreateGroup ( $LangArrangement , 145, 170, 110, 60)
	$MemtestMod_1 = GUICtrlCreateButton ( $LangBasic, 155, 190, 40, 25)
	$MemtestMod_2 = GUICtrlCreateButton ( $LangClose, 205, 190, 40, 25)

GUISetState (@SW_HIDE)

While True

	$sUpdataTimer = TimerDiff ($UpdataTimer)

	$UpdataDelay = 1000
	If $sUpdataTimer > 1001 Then
		$UpdataTimer = TimerInit ()
	EndIf

	_Save( $MemtestStartPos_X, "MemtestStartPos_X")
	_Save( $MemtestStartPos_Y, "MemtestStartPos_Y")

	_Save( $MemtestLimitPos_X, "MemtestLimitPos_X")
	_Save( $MemtestLimitPos_Y, "MemtestLimitPos_Y")

	_Save( $MemtestoffsetPos_X, "MemtestoffsetPos_X")
	_Save( $MemtestoffsetPos_Y, "MemtestoffsetPos_Y")

	_Save( $iSize, "MemSize")
	_Save( $iCnt, "MemCnt")
	_Save( $iRetain, "retain")
	_Save( $slptime, "slptime")
	_Save( $prt_time, "prt_time")

	_Save( $iWindowsH, "WindowsH")
	_Save( $iWindowsW, "WindowsW")

;~ 	_Save( $iTestEnd, "iTestEnd");;過測截圖自動存檔

	_Save( $MemtestErrorPrtInput, "MemtestErrorPrtInput")

	_HotKet()

	$msg = GUIGetMsg()

	If RegRead ( $reg, "prt_rut") <> GUICtrlRead ($prt_rutInput) Then;;確認路徑
		If FileExists (GUICtrlRead ($prt_rutInput)) Then
			RegWrite ( $reg, "prt_rut", "REG_SZ", GUICtrlRead ($prt_rutInput))
			GUICtrlSetData ($prt_rutLabel, "ok")
			GUICtrlSetColor ( $prt_rutLabel, 0x00A002)
		Else
			If GUICtrlRead ($prt_rutLabel) <> "error" Then
				GUICtrlSetData ($prt_rutLabel, "error")
				GUICtrlSetColor ( $prt_rutLabel, 0xFF1C19)
			EndIf
		EndIf
	EndIf

	If $msg = $Tab And _GUICtrlTab_GetCurSel ($Tab) = 2 Then
		WinMove ( $GUI, "", Default, Default, Default, $GUI_H_ReSize)
	ElseIf $msg = $Tab And _GUICtrlTab_GetCurSel ($Tab) <> 2 Then
		WinMove ( $GUI, "", Default, Default, Default, $GUI_H)
	EndIf

	If $msg = $MemtestDirection_1 And BitAND (GUICtrlRead ($MemtestDirection_1), $GUI_CHECKED) = $GUI_CHECKED Then
		RegWrite ( $reg, "MemtestDirection", "REG_SZ", 1)
	ElseIf $msg = $MemtestDirection_2 And BitAND (GUICtrlRead ($MemtestDirection_2), $GUI_CHECKED) = $GUI_CHECKED Then
		RegWrite ( $reg, "MemtestDirection", "REG_SZ", 2)
	EndIf

	If $msg = $cMemtestLayers And BitAND (GUICtrlRead ($cMemtestLayers), $GUI_CHECKED) = $GUI_CHECKED Then
		RegWrite ( $reg, "MemtestLayers", "REG_SZ", 0)
	ElseIf $msg = $cMemtestLayers And BitAND (GUICtrlRead ($cMemtestLayers), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		RegWrite ( $reg, "MemtestLayers", "REG_SZ", 1)
	EndIf

	If $msg = $cMemtestHIDE_Run And BitAND (GUICtrlRead ($cMemtestHIDE_Run), $GUI_CHECKED) = $GUI_CHECKED Then
		RegWrite ( $reg, "MemtestHIDE_Run", "REG_SZ", 1)
	ElseIf $msg = $cMemtestHIDE_Run And BitAND (GUICtrlRead ($cMemtestHIDE_Run), $GUI_UNCHECKED) = $GUI_UNCHECKED Then
		RegWrite ( $reg, "MemtestHIDE_Run", "REG_SZ", 0)
	EndIf

;－－－－－－－－－－－－－自動結圖模式－－－－－－－－－－－－－
	If $msg = $prt_check Then ptr_check_set()
;－－－－－－－－－－－－－過測截圖模式－－－－－－－－－－－－－
	If $msg = $cTestEnd Then EndPtr_check_set()
;－－－－－－－－－－－－－過測截圖後結束－－－－－－－－－－－－－
	If $msg = $cEndClose And BitAND (GUICtrlRead ($cEndClose), $GUI_CHECKED) = $GUI_CHECKED Then
		RegWrite( $reg, "cEndClose", "REG_SZ", 1)
	ElseIf $msg = $cEndClose Then
		RegWrite( $reg, "cEndClose", "REG_SZ", 0)
	EndIf
;－－－－－－－－－－－－－過測截圖後關機－－－－－－－－－－－－－
	If $msg = $cEndShutdown And BitAND (GUICtrlRead ($cEndShutdown), $GUI_CHECKED) = $GUI_CHECKED Then
		RegWrite( $reg, "cEndShutdown", "REG_SZ", 1)
	ElseIf $msg = $cEndShutdown Then
		RegWrite( $reg, "cEndShutdown", "REG_SZ", 0)
	EndIf

	$mem = MemGetStats()
	If $sUpdataTimer > $UpdataDelay And $StartBurnFlag = 0 Then
		GUICtrlSetData ( $Info_Data_1[0], StringFormat ("%.01f MB|%.01f MB||", ($mem[1]/(2^10)), ($mem[2]/(2^10) )))
		GUICtrlSetData ( $Info_Data_2[0], StringFormat ("%.01f MB|%.01f MB||", ($mem[1]/(2^10)), ($mem[2]/(2^10) )))

		If _IsColor (Int($mem[0])) <> $tmpColor Then;;自動更新標題顏色
			$tmpColor = _IsColor (Int($mem[0]))
			GUICtrlSetColor ( $lTitle, $tmpColor)
		EndIf
	EndIf

	If $StartBurnFlag = 1 Then;;;Flag 1 = 開始;0 = 暫停
		$MemtestSetRamSize = GUICtrlRead ($iSize)

		If $Updata = 1 Then;; 獲得Memtest Handle
			$Updata = 0
			_GetyMemTestListPid()
		EndIf

		Dim $_cnt = GUICtrlRead ($iCnt)
		If UBound ($MemtestCoverage) <> $_cnt Then ReDim $MemtestCoverage[$_cnt]
		For $i = 0 To ($_cnt-1)

;－－－－－－－－－－－－－抓取資訊－－－－－－－－－－－－－
			If $sUpdataTimer > $UpdataDelay Then

				$GetMemtestText = ControlGetText ( $handle[$i], "", "Static1")
				$GetMemtestTextSplit = StringSplit ( StringStripWS ( $GetMemtestText, 8), ",", 3)

				If UBound ($GetMemtestTextSplit) = 2 Then

					$GetMemtestCoverage = StringTrimLeft ( $GetMemtestTextSplit[0], 3)
					$GetMemtestCoverage = Number (StringTrimRight ( $GetMemtestCoverage, 9))
					$MemtestCoverage[$i] = $GetMemtestCoverage

					$GetMemtestErrors = Int (StringTrimRight ( $GetMemtestTextSplit[1], 6))

					GUICtrlSetData ( $item[$i], StringFormat ("# %02d|%d MBytes|%.01f%|%d Error", $i, $MemtestSetRamSize, $GetMemtestCoverage, $GetMemtestErrors))
;－－－－－－－－－－－－－有錯誤就結束程式－－－－－－－－－－－－－
;~ 					ToolTip ( StringFormat ( "%d / %d", $GetMemtestErrors, GUICtrlRead ($MemtestErrorPrtInput)))
					If $GetMemtestErrors >= 1 And GUICtrlRead ($MemtestErrorPrtInput) >= 1 And $GetMemtestErrors > $MemtestErrorPrtErrors Then
						$MemtestErrorPrtErrors = $GetMemtestErrors
						Sleep (2000)
						_prt_sc()
						If $GetMemtestErrors >= GUICtrlRead ($MemtestErrorPrtInput) Then
							Sleep (5000)
							_CloseMemtest()
							Sleep (1000)
						EndIf
					EndIf
				EndIf
			EndIf
;－－－－－－－－－－－－－過測截圖－－－－－－－－－－－－－
			If BitAND (GUICtrlRead ($cTestEnd), $GUI_CHECKED) = $GUI_CHECKED And $TestEnd_Flag = 0 Then
				For $pass = 0 To ($_cnt-1)
					If $MemtestCoverage[$pass] >= GUICtrlRead ($iTestEnd) Then $iCntCheck += 1
				Next

;~ 				ToolTip (StringFormat ( "完成%d% / %d%，已通過%d個", $GetMemtestCoverage, GUICtrlRead ($iTestEnd), $iCntCheck))
;~ 				ToolTip ($iCntCheck&" "&$_cnt)
				If $iCntCheck = $_cnt Then
;~ 					_ArrayDisplay ($MemtestCoverage)
					_prt_sc()
					$TestEnd_Flag = 1

					If BitAND (GUICtrlRead ($cEndShutdown), $GUI_CHECKED) = $GUI_CHECKED Then ;; 過測後關機
						Sleep (5000)
						Shutdown(25)
					EndIf

					If BitAND (GUICtrlRead ($cEndClose), $GUI_CHECKED) = $GUI_CHECKED Then ;; 過測後結束
						Sleep (5000)
						_CloseMemtest()
						Sleep (1000)
					EndIf
				Else
					$iCntCheck = 0;;截圖check 計數器歸零
				EndIf
			EndIf
		Next

;－－－－－－－－－－－－－總計時器－－－－－－－－－－－－－
		If $sUpdataTimer > $UpdataDelay Then
			If $AllTime_Flag = 0 Then
				$AllTime = TimerInit ()
				$AllTime_Flag = 1
			EndIf
			$iTicks = Int (TimerDiff($AllTime))

			$sTicks= $iTicks ;;; tmp

			$iTicks = Int ( $iTicks / 1000)
			$rHour = Int ( $iTicks / 3600)
			$iTicks = Mod ( $iTicks, 3600)
			$rMins = Int ( $iTicks / 60)
			$rSecs = Mod ( $iTicks, 60)

			$sTime = $Time;; tmp

				;－－－－－－－－－－－－－預估時間－－－－－－－－－－－－－
				If $GetMemtestCoverage > $CompletePercentage Then $CompletePercentage += 100
				$EstimateTime = Int ( $sTicks *$CompletePercentage / $GetMemtestCoverage );;計算剩餘時間

				If $EstimateTime > 1 Then
					$EstimateTime = $EstimateTime - $sTicks;;扣除已用時間

					GUICtrlSetData ( $Info_1, StringFormat ( $LangListViewUpdata, $CompletePercentage))
					GUICtrlSetData ( $Info_2, StringFormat ( $LangListViewUpdata, $CompletePercentage))

					$EstimateTime = Int($EstimateTime / 1000)
					$nHour = Int($EstimateTime / 3600)
					$EstimateTime = Mod($EstimateTime, 3600)
					$nMins = Int($EstimateTime / 60)
					$nSecs = Mod($EstimateTime, 60)

					GUICtrlSetData ( $Info_Data_1[0], StringFormat ( "%.01f MB|%.01f MB|%02i:%02i:%02i|%02i:%02i:%02i", ($mem[1]/(2^10)), ($mem[2]/(2^10)), $rHour, $rMins, $rSecs, $nHour, $nMins, $nSecs))
					GUICtrlSetData ( $Info_Data_2[0], StringFormat ( "%.01f MB|%.01f MB|%02i:%02i:%02i|%02i:%02i:%02i", ($mem[1]/(2^10)), ($mem[2]/(2^10)), $rHour, $rMins, $rSecs, $nHour, $nMins, $nSecs))

					If _IsColor (Int($mem[0])) <> $tmpColor Then;;自動更新標題顏色
						$tmpColor = _IsColor (Int($mem[0]))
						GUICtrlSetColor ( $lTitle, $tmpColor)
					EndIf

				EndIf
		EndIf
;－－－－－－－－－－－－－自動截圖－－－－－－－－－－－－－

		 If BitAND ( GUICtrlRead ($prt_check), $GUI_CHECKED) = $GUI_CHECKED Then

			If $slp2_Flag = 0 Then
				$slp2_t = TimerInit ()
				$slp2_Flag = 1
			EndIf

			$slp2 = TimerDiff ($slp2_t)

			If $slp2 > (GUICtrlRead($prt_time)*1000*60) Then;自動截圖
				_prt_sc()
				$slp2_Flag = 0
			EndIf
		EndIf

;－－－－－－－－－－－－－記憶體壓榨模式－－－－－－－－－－－－－

		If GUICtrlRead ($slptime) <> 0 And 3177 > ($mem[2]/(2^10)) Then

			If $slp_Flag = 0 Then
				$slp_t = TimerInit ()
				$slp_Flag = 1
			EndIf

			$slp = TimerDiff ($slp_t)

;~ 			ToolTip ( StringFormat  ( "補償時間 : %s秒\n剩餘時間 : %s秒", $slptime, $slp/1000))

			If $slp > (GUICtrlRead ($slptime)*1000) Then;壓榨記憶體模式
				If GUICtrlRead ($iRetain) < Int ($mem[2]/(2^10)) Then;;剩餘記憶體大於保留記憶體
					$slp_Flag = 0
					$i = GUICtrlRead ($iCnt)
					If $MemtestCompensateStartFlag = 0 Then;; 記憶體壓榨模式 Flag
						$Memory =Int ($mem[2]/(2^10))
						$MemtestCompensateStartFlag = 1
						$CompensateHandle = WinGetHandle ( "[0 errors] MemTest", "保留記憶體使用")
					Else
						$Memory = Int($Memory+($mem[2]/(2^10)))
						ControlClick ( $CompensateHandle, "", "Button2");按暫停
					EndIf
					Sleep (1000)
;~ 					winclose ($CompensateHandle)
					ControlSetText ($CompensateHandle, "", "Edit1", $Memory)
					Sleep (500)
					ControlClick ( $CompensateHandle, "", "Button1")
				EndIf
			EndIf

		EndIf
	EndIf

	Switch $msg
		Case $bTestEnd
			RegWrite ( $reg, "iTestEnd", "REG_SZ", GUICtrlRead ($iTestEnd))
			;~ 	_Save( $iTestEnd, "iTestEnd");;過測截圖自動存檔
		Case $ClosePic
			GUICtrlSetState ( $ClosePic2, $GUI_SHOW)
			Sleep (50)
			Exit
		Case $GUI_EVENT_CLOSE
			If GUICtrlRead  ($SetMemtestPos) = "Setting" Then
				GUICtrlSetData ( $SetMemtestPos, $LangSetMemtestPos)
				GUISetState ( @SW_HIDE, $mGUI)
				GUISetState ( @SW_SHOW, $GUI)
			Else
				Exit
			EndIf
		Case $Auto
			_Solution()
		Case $MemtestMod_1
			_MemtestSetMod_1()
		Case $MemtestMod_2
			_MemtestSetMod_2()
		Case $run
			_RunMemtest()
		Case $Start
			_StartMemTest()
		Case $StartPosTest
			_RunMemtest()
		Case $ClosetPosTest
			_CloseMemtest()
		Case $prtscn_pic
			GUICtrlSetState ( $prtscn_pic2, $GUI_SHOW)
			Sleep (50)
			_prt_sc()
			Sleep (50)
			GUICtrlSetState ( $prtscn_pic2, $GUI_HIDE)
		Case $SetMemtestPos
			If GUICtrlRead  ($SetMemtestPos) = $LangSetMemtestPos Then
				GUICtrlSetData ( $SetMemtestPos, "Setting")
				GUISetState ( @SW_SHOW, $mGUI)
				GUISetState ( @SW_HIDE, $GUI)
				WinSetOnTop ($mGUI, "", 1)
			Else
				GUICtrlSetData ( $SetMemtestPos, $LangSetMemtestPos)
				GUISetState ( @SW_HIDE, $mGUI)
				GUISetState ( @SW_SHOW, $GUI)
			EndIf
		Case $close
			_CloseMemtest()
		Case $bclose_2
			_CloseMemtest()
		Case $ptr_close;;截圖後關閉
			GUICtrlSetState ( $ptr_close, $GUI_DISABLE)
			GUICtrlSetState ( $bclose_2, $GUI_DISABLE)
			_prt_sc()
			Sleep (5000)
			_CloseMemtest()
			Sleep (1000)
		Case $AutoGetWindows
			_AutoGetWindows()
		Case $Help
			GUISetState (@SW_HIDE, $GUI)
			MsgBox ( 0, $TitleName&$HelpTitle,$HelpMsg)
			GUISetState (@SW_SHOW, $GUI)
		Case $prt_rut
			_prt_rut()
	EndSwitch
WEnd

Func _ComputerGetMotherboard()
	Local $colItems, $objWMIService, $objItem
	Local $OutString

	$objWMIService = ObjGet("winmgmts:\\" & @ComputerName & "\root\CIMV2")
	$colItems = $objWMIService.ExecQuery('SELECT * FROM Win32_BaseBoard', 'WQL', 0x30)

	If IsObj($colItems) Then
		For $objItem In $colItems
			$OutString = $objItem.Manufacturer
		Next
	EndIf

;~ 	$OutString = "gigabyte technology co. ltd"

	Return $OutString

EndFunc

Func _IsColor ($iPercentage)
	Local $iColor

	Switch $iPercentage
		Case 0 To 20
			$iColor = $Color[0]
		Case 21 To 40
			$iColor = $Color[1]
		Case 41 To 60
			$iColor = $Color[2]
		Case 61 To 80
			$iColor = $Color[3]
		Case 81 To 95
			$iColor = $Color[4]
		Case Else
			$iColor = $Color[5]
	EndSwitch

	Return $iColor

EndFunc

Func _MemtestSetMod_1()
	GUICtrlSetData ( $MemtestoffsetPos_X, 277)
	GUICtrlSetData ( $MemtestoffsetPos_Y, 312)
EndFunc

Func _MemtestSetMod_2()
	GUICtrlSetData ( $MemtestoffsetPos_X, 138)
	GUICtrlSetData ( $MemtestoffsetPos_Y, 160)
EndFunc

Func _AutoGetWindows()
	GUICtrlSetData ( $iWindowsH, @DesktopHeight)
	GUICtrlSetData ( $iWindowsW, @DesktopWidth)

	GUICtrlSetData ( $MemtestLimitPos_X, @DesktopHeight)
	GUICtrlSetData ( $MemtestLimitPos_Y, @DesktopWidth)

EndFunc

Func _HotKet()
	If $Solution_Set = 0 Then
		HotKeySet ("{F5}","_Solution");自動計算
	Else
		HotKeySet ("{F5}","_nothing")
	EndIf
	If $RunMemtest_Set = 0 Then
		HotKeySet ("{F6}","_RunMemtest");開啟Memtest
	Else
		HotKeySet ("{F6}","_nothing")
	EndIf
	If $StartMemTest_Set = 0 Then
		HotKeySet ("{F7}","_StartMemTest");燒機開始
	Else
		HotKeySet ("{F7}","_nothing")
	EndIf
	HotKeySet ("{F8}","_CloseMemtest");關閉MemTest
EndFunc

Func _Solution()
	$mem = MemGetStats()
	$MemCnt = _LogicalCore()

	$MemSize = Int ( $mem[2] / (2^10) / $MemCnt )

	While True
		If $MemSize < 3177 Then ExitLoop
		$MemCnt = $MemCnt*2
		$MemSize = Int ( $mem[2] / (2^10) / $MemCnt)
	WEnd

	GUICtrlSetData ( $iSize, $MemSize)
	GUICtrlSetData ( $iCnt, $MemCnt)
EndFunc

Func _RunMemtest()
	Local $high
	_CloseMemtest()
	GUICtrlSetState ( $iSize, $GUI_DISABLE)
	GUICtrlSetState ( $iCnt, $GUI_DISABLE)
	GUICtrlSetState ( $Auto, $GUI_DISABLE)
	GUICtrlSetState ( $SetMemtestPos, $GUI_DISABLE)
	If $iRetain <> 0 Then;如果開啟記憶體補償
		GUICtrlSetState ( $slptime, $GUI_DISABLE)
	EndIf
	$Solution_Set = 1
	$RunMemtest_Set = 1
	$StartMemTest_Set = 1
	$Updata = 1;;更新Memtest Handle

	If GUICtrlRead ($iCnt)  = "" Or GUICtrlRead ($iSize) = "" Or GUICtrlRead ($iCnt)  = 0 Or GUICtrlRead ($iSize) = 0 Or Int (GUICtrlRead ($iSize)/GUICtrlRead ($iCnt)) < 0 Then Return
	If @error = 1 Then Return
	Dim $_cnt = GUICtrlRead ($iCnt)

	ReDim $handle[$_cnt+1]
	ReDim $item[$_cnt+1]

	If Not UBound ($item) = 0 Then
		For $i = 0 To UBound ($item)-1
			GUICtrlDelete ( $item[$i] )
		Next
	EndIf

	$high  = (GUICtrlRead ($iCnt)*20)+70
	If $high <= 105 Then $high = 105

	$GUI_H_ReSize =$high+145
	GUICtrlSetPos ( $listview , Default, Default , Default, $high-40);;調整監控視窗的高度

	_GUICtrlListView_DeleteAllItems($listview);;清空
	For $i = 0 To $_cnt-1
		$item[$i] =GUICtrlCreateListViewItem( StringFormat ("# %02d|%dMBytes|0%|0", $i, GUICtrlRead ($iSize)), $listview)
	Next
	Run (@TempDir&"\RunMemTest.exe");啟動Memtest
	GUICtrlSetState ( $Start, $GUI_ENABLE)
	$StartMemTest_Set = 0
EndFunc

Func _Save( $Input, $RegName)
	If GUICtrlRead ($Input) <> RegRead ( $reg, $RegName) Then
		RegWrite( $reg, $RegName, "REG_SZ", GUICtrlRead($Input))
		If GUICtrlRead ($iSize) > 3177 Then
			GUICtrlSetData ( $iSize, 3177)
			WinSetOnTop ($GUI,"",0)
			MsgBox (16,"ERROR","不得大於3177", 1)
			WinSetOnTop ($GUI,"",1)
		EndIf
		If GUICtrlRead ($Input) <> "" Then
			$mem = MemGetStats()
			$TotalVer = ((GUICtrlRead ($iSize)*GUICtrlRead ($iCnt)))
			$FreeVer =(($mem[2]/2^10)-$TotalVer)
			$Var = StringFormat ( "%dMB ; %dMB", $TotalVer, $FreeVer)
			GUICtrlSetData ( $iTotal, $Var)
		EndIf
	EndIf
EndFunc

Func _StartMemTest()
	$Solution_Set = 1
	$RunMemtest_Set = 1
	$StartMemTest_Set = 1
	If ProcessExists ($Process) = 0 Then Return
	GUICtrlSetState ( $Auto, $GUI_DISABLE)
	GUICtrlSetState ( $run, $GUI_DISABLE)
	GUICtrlSetState ( $Start, $GUI_DISABLE)
	GUICtrlSetState ( $SetMemtestPos, $GUI_DISABLE)
	GUICtrlSetState ( $ptr_close, $GUI_ENABLE)
	GUICtrlSetState ( $bclose_2, $GUI_ENABLE)

	Run (@TempDir&"\StartMemTest.exe")
	$StartBurnFlag = 1;; 開始燒機的 flag
	$StartMemTest_Set = 2
EndFunc

Func _CloseMemtest()
	ToolTip (@CRLF&$LangStopMemtest&@CRLF&" ")
	$slp= 0
	$slp2 = 0
	GUICtrlSetState ( $Start, $GUI_DISABLE)
	Do
		ProcessClose ("RunMemTest.exe")
	Until ProcessExists ("RunMemTest.exe") = 0
	Do
		ProcessClose ("StartMemTest.exe")
	Until ProcessExists ("StartMemTest.exe") = 0
	Do
		ProcessClose ($Process)
	Until ProcessExists ($Process) = 0
	If $iRetain <> 0 Then;如果開啟記憶體補償
		GUICtrlSetState ( $slptime, $GUI_ENABLE)
	EndIf

	$StartBurnFlag = 0
	$MemtestCompensateStartFlag = 0
	$Updata = 0
	$Solution_Set = 0
	$RunMemtest_Set = 0
	$StartMemTest_Set = 1
	$AllTime_Flag = 0 ;;燒機時間計時器 0 = reset
	$TestEnd_Flag = 0;;;過測截圖0 = reset
	$MemtestErrorPrtErrors = 0;;錯誤數量暫存歸零

	GUICtrlSetState ( $Auto, $GUI_ENABLE)
	GUICtrlSetState ( $run, $GUI_ENABLE)
	GUICtrlSetState ( $iSize, $GUI_ENABLE)
	GUICtrlSetState ( $iCnt, $GUI_ENABLE)
	GUICtrlSetState ( $SetMemtestPos, $GUI_ENABLE)
	GUICtrlSetState ( $ptr_close, $GUI_DISABLE)
	GUICtrlSetState ( $bclose_2, $GUI_DISABLE)

	ToolTip ("")
EndFunc

Func _prt_rut()
	WinSetOnTop ($GUI, "", 0)
	$rut = FileSelectFolder ( "請選擇存檔目錄", @DesktopDir, 3)
	RegWrite ( $reg, "prt_rut", "REG_SZ", $rut)
	GUICtrlSetData ( $prt_rutInput, $rut)
	WinSetOnTop ($GUI, "", 1)
EndFunc

Func ptr_check_set()
	If BitAND(GUICtrlRead ($prt_check), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState ( $prt_time, $GUI_ENABLE)
		RegWrite( $reg, "ptr_check", "REG_SZ", 1)
	Else
		GUICtrlSetState ( $prt_time, $GUI_DISABLE)
		RegWrite( $reg, "ptr_check", "REG_SZ", 0)
	EndIf
EndFunc

Func EndPtr_check_set()
	If BitAND(GUICtrlRead ($cTestEnd), $GUI_CHECKED) = $GUI_CHECKED Then
		GUICtrlSetState ( $iTestEnd, $GUI_ENABLE)
		GUICtrlSetState ( $cEndClose, $GUI_ENABLE)
		GUICtrlSetState ( $cEndShutdown, $GUI_ENABLE)
		GUICtrlSetState ( $bTestEnd, $GUI_ENABLE)
		RegWrite( $reg, "EndPtr_check", "REG_SZ", 1)
	Else
		GUICtrlSetState ( $iTestEnd, $GUI_DISABLE)
		GUICtrlSetState ( $cEndClose, $GUI_DISABLE)
		GUICtrlSetState ( $cEndShutdown, $GUI_DISABLE)
		GUICtrlSetState ( $bTestEnd, $GUI_DISABLE)
		RegWrite( $reg, "EndPtr_check", "REG_SZ", 0)
	EndIf
EndFunc

Func _WinWaitClick ( $Title, $TextName, $controlID)
	If Not WinActivate ( $Title, $TextName) Then
		WinActivate ( $Title, $TextName)
		WinWaitActive ( $Title, $TextName)
	EndIf
	ControlClick  ( $Title, $TextName, $controlID)
EndFunc

;~ Func _CPU_Utilization();;cpu 使用率
;~ 	$wbemServices = ObjGet("winmgmts:\\.\root\cimv2")
;~ 	$wbemObjectSet= $wbemServices.ExecQuery("Select * from Win32_Processor")
;~ 	For $wbemObject In $wbemObjectSet
;~ 		$dd=$wbemObject.LoadPercentage
;~ 	Next
;~ 	Return $dd
;~ EndFunc

Func _LogicalCore()
	Local $CNT
	$aSysInfo = _WinAPI_GetSystemInfo()
	$hProc = _WinAPI_OpenProcess( 0x1F0FFF, False, @AutoItPID)
	$aRet = _WinAPI_GetProcessAffinityMask($hProc)
	$CNT = (Log($aRet[2] + 1) / Log(2))
	If IsInt ($CNT) = 0 Then $CNT = RegRead ( "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\Environment", "NUMBER_OF_PROCESSORS")
	Return $CNT
EndFunc

Func _WinAPI_GetSystemInfo($iInformation=-1)
    If $iInformation<>-1 And ($iInformation<1 Or $iInformation>10) Then Return SetError(1,0,-1)
    Local $aRet,$stSystemInfo=DllStructCreate("ushort;short;dword;ptr;ptr;dword;dword;dword;dword;short;short")

    $aRet=DllCall("kernel32.dll","none","GetSystemInfo","ptr",DllStructGetPtr($stSystemInfo))

    If @error Or Not IsArray($aRet) Then Return SetError(2,0,-1)

    If $iInformation<>-1 Then
        If $iInformation==1 Then Return DllStructGetData($stSystemInfo,1)
        Return DllStructGetData($stSystemInfo,$iInformation+1)
    EndIf
    Local $aSysInfo[10]
    $aSysInfo[0]=DllStructGetData($stSystemInfo,1)
    For $i=1 To 9
        $aSysInfo[$i]=DllStructGetData($stSystemInfo,$i+2)
    Next
    Return $aSysInfo
EndFunc

Func _prt_sc()
	Local $WindowsW =  RegRead ( $reg, "WindowsW")
	Local $WindowsH =  RegRead ( $reg, "WindowsH")

	If $WindowsW < 5 Then $WindowsW = @DesktopWidth
	If $WindowsH < 5 Then $WindowsH = @DesktopHeight

	If RegRead ( $reg, "prt_rut") = "" Then
		$rut = @DesktopDir
	Else
		$rut = RegRead ( $reg, "prt_rut")
	EndIf
	If Not FileExists ($rut) Then
		$rut = @DesktopDir
	EndIf
	_ScreenCapture_Capture($rut&"\"&@YEAR&"_"&@MON&"_"&@MDAY&"_"&@HOUR&"_"&@MIN&"_"&@SEC&".png", 0, 0, $WindowsW, $WindowsH)
EndFunc

Func _GetyMemTestListPid()
	$var = WinList()
	Local $_cnt = GUICtrlRead ($iCnt)
	Local $find

	If GUICtrlRead ($slptime) <> 0 Then;確定開啟的數量 如果不開啟補償 少開一個
		$_cnt += 1
	EndIf
	Local $j = 0

	ReDim $handle[$_cnt]

	For $i = 1 To $var[0][0]
		If StringCompare ( $var[$i][0], "[0 errors] MemTest  ", 1) =  0 Or StringCompare ( $var[$i][0], "[0 Errors] MemTest", 1) =  0 Then
			$find = True
		Else
			$find = False
		EndIf

		If $find = True Then
			$handle[$j] =$var[$i][1]
			$j += 1
			$find = False
		EndIf
	Next
EndFunc

Func _nothing()

EndFunc

Func _MD5($sFile)
	Local Const $CALG_MD2 = 0x8001
	Local Const $CALG_MD4 = 0x8002
	Local Const $CALG_MD5 = 0x8003
	Local Const $CALG_SHA1 = 0x8004

	$hFile = FileOpen ($sFile, 16)
	$bData = FileRead ($hFile)
	$iLength = BinaryLen ($bData)
	FileClose($hFile)

	$tBuffer = DllStructCreate("byte[" & $iLength & "]")
	$pBuffer = DllStructGetPtr($tBuffer)
	DllStructSetData($tBuffer, 1, $bData)

	$iResult = DllCall ("Crypt32.dll", "int", "CryptHashCertificate", "hWnd", 0, "dword", $CALG_MD5, "dword", 0, "ptr", $pBuffer, "dword", $iLength, "ptr", 0, "dword*", 0)
	$tResult = DllStructCreate ("byte[" & $iResult[7] & "]")
	$pResult = DllStructGetPtr ($tResult)
	$iResult = DllCall ("Crypt32.dll", "int", "CryptHashCertificate", "hWnd", 0, "dword", $CALG_MD5, "dword", 0, "ptr", $pBuffer, "dword", $iLength, "ptr", $pResult, "dword*", $iResult[7])
	If $iResult[0] <> 0 Then Return StringTrimLeft (DllStructGetData ($tResult, 1), 2)

	$tBuffer = 0
	$tResult = 0
EndFunc