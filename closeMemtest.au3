#Region
#AutoIt3Wrapper_icon=104.ico
#AutoIt3Wrapper_Compression=5
#AutoIt3Wrapper_Res_Comment=CloseMemtest
#AutoIt3Wrapper_Res_Description=CloseMemtest
#AutoIt3Wrapper_Res_Fileversion=2.5.0.0
#AutoIt3Wrapper_Res_LegalCopyright=¾´¾´
#EndRegion

_CloseMemtest()

Func _CloseMemtest()
	ToolTip (@CRLF&"¡@µ²§ôMemTest¡@"&@CRLF&" ")

	Do
		ProcessClose ("RunMemTest.exe")
	Until ProcessExists ("RunMemTest.exe") = 0
	Do
		ProcessClose ("StartMemTest.exe")
	Until ProcessExists ("StartMemTest.exe") = 0
	Do
		ProcessClose ("memTestPro.exe")
	Until ProcessExists ("memTestPro.exe") = 0

	ToolTip ("")
EndFunc