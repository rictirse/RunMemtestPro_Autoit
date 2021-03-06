#include-once
If @OSLang = 0404 Then
	Global $Langprtscn_btn = "截圖"

	Global $LangError = "錯誤"
	Global $LangPathError = "找不到memTestPro"&@CRLF&"請將memTestPro置入同一目錄內。"

	Global $LangMainSetting = "基本設定"
	Global $LangMainMeter = "(記憶體大小 X 開啟個數) = 總使用量 ; 剩餘記憶體　 保留記憶體"
	Global $LangAutoComputing = "自動計算"
	Global $LangStartMemtest = "啟動MemTest"
	Global $LangStartBurning = "開始燒機"
	Global $LangStopMemtest = "關閉MemTest"
	Global $LangHelp = "使用說明"
	Global $LangListView = "總記憶體  |可用記憶體  |執行時間  |剩餘時間          "
	Global $LangListViewUpdata = "總記憶體   |可用記憶體   |執行時間   |%d% 剩餘時間          "
	Global $LangTotalRAM = "總記憶體為"
	Global $LangFreeRAM = "可用記憶體為"

	Global $LangBackgroundRun = "背景執行"
	Global $LangLayers = "自動調整順序"
	Global $LangSetting = "參數設定"
	Global $LangCompensate = "補償延遲(秒)"
	Global $LangCompensateSec = "秒"
	Global $MemtestErrorPrtPCS = "個錯誤"
	Global $LangSetMemtestPos = "自訂開啟位置"
	Global $LangErrorPrt = "錯誤自動截圖"
	Global $LangAutoPrt = "自動截圖"
	Global $LangEnablePrt = "啟動截圖"
	Global $LangPrtSp = "分鐘/張"
	Global $LangSavePath = "存檔路徑"
	Global $LangDisplayLimit = "截圖範圍"
	Global $LangAutoSet = "全螢幕"
	Global $LangEndPrt = "完成測試截圖"
	Global $LangEndClose = "完成測試結束"
	Global $LangEndShutdown= "完成測試關機"

	Global $LangMeter = "監控"
	Global $LangMemtestMeter = "#     | 記憶體使用量 | 完成百分比 | 錯誤   "
	Global $LangCloseMemtest = $LangStopMemtest
	Global $LangClosememtestAndPrt = "截圖並關閉memtest"
	Global $LangFirstPos = "起始位置"
	Global $LangLimitPos = "邊界條件"
	Global $LangOffset = "間隔距離"
	Global $LangDirection = "排列方向"
	Global $LangTest = "測試"
	Global $LangTestClose = "關閉"
	Global $LangArrangement = "排列方式"
	Global $LangBasic = "一般"
	Global $LangClose = "緊密"

	Global $HelpTitle = "使用教學"
	Global $HelpMsg = "1. 自動計算公式為 ( 執行緒數量 / 總記憶體 )"&@CRLF& _
							"　大於3117MB則多開一倍執行緒。"&@CRLF&@CRLF& _
							"2. 快速鍵："&@CRLF& _
							"　　F5 → 自動計算"&@CRLF& _
							"　　F6 → 開啟MemTest"&@CRLF& _
							"　　F7 → 燒機"&@CRLF& _
							"　　F8 → 關閉全部MemTest "&@CRLF& _
							"　　※請愛用快速鍵，反應速度比較快※"&@CRLF&@CRLF& _
							"3. 燒機後 (剩餘記憶體) 大於 (保留記憶體) 會啟動 (自動補償)，"&@CRLF& _
							"　(自動補償) 會把剩餘記憶體全部放在保留記憶體的Mem內，"&@CRLF& _
							"　設定時間 0 則不啟動，預設補償時間0秒，不啟動。"&@CRLF&@CRLF& _
							"4. 截圖預設路徑為桌面。"&@CRLF&@CRLF& _
							"5. 過測截圖：設定一個燒機門檻(百分比)，超過門檻後會自動截圖。"&@CRLF&@CRLF& _
							"6. 過測結束：過測截圖完成後自動結束Memtest 測試。"&@CRLF&@CRLF& _
							"7. 背景執行：隱藏開啟MemTest。"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120秒，或記憶體釋使用率低於98%，自動整理排序"
	Global $WaitArrangementString="%03d/120秒，或記憶體釋使用率低於98%，自動整理排序"

	Global $RunMemtestText = "\n　　　已完成%s / %s，剩餘%s個\n\n　　啟動MemTest中，請稍等 . . .　　\n\n　"
ElseIf @OSLang = 0804 Then;;簡體中文
;~ ElseIf @OSLang = 0404 Then;;簡體中文
	Global $Langprtscn_btn = "截��"

	Global $LangError = "�}�R"
	Global $LangPathError = "找不到memTestPro"&@CRLF&"�[�滵emTestPro置入同一目���X。"

	Global $LangMainSetting = "基本�扣w"
	Global $LangMainMeter = "(內存大小 X �{�Q����) = �K使用量 ; 剩余內存　 保留內存"
	Global $LangAutoComputing = "自���y算"
	Global $LangStartMemtest = "�Q�癐emTest"
	Global $LangStartBurning = "�{始�釂�"
	Global $LangStopMemtest = "���碉emTest"
	Global $LangHelp = "使用�S明"
	Global $LangListView = "�K內存       |可用內存      |�蠾����}    |剩余���}           "
	Global $LangListViewUpdata = "�K內存      |可用內存      |�蠾����}   |%d% 剩余���}           "
	Global $LangTotalRAM = "�K內存�o"
	Global $LangFreeRAM = "可用內存�o"

	Global $LangBackgroundRun = "后台�b行"
	Global $LangLayers = "自���`整�戍�"
	Global $LangSetting = "�����扣w"
	Global $LangCompensate = "�D��延�v(秒)"
	Global $LangCompensateSec = "秒"
	Global $MemtestErrorPrtPCS = "���}�R"
	Global $LangSetMemtestPos = "自�z�{�Q位置"
	Global $LangErrorPrt = "�}�R自�虩I��"
	Global $LangAutoPrt = "自�虩I��"
	Global $LangEnablePrt = "�Q�虩I��"
	Global $LangPrtSp = "分�]/�E"
	Global $LangSavePath = "存�蓁���"
	Global $LangDisplayLimit = "截�雁S��"
	Global $LangAutoSet = "全屏幕"
	Global $LangEndPrt = "完成���I截��"
	Global $LangEndClose = "完成���I�C束"
	Global $LangEndShutdown= "完成���I�訰�"

	Global $LangMeter = "�穇�"
	Global $LangMemtestMeter = "#     | 內存使用量      | 完成百分比  | �}�R "
	Global $LangCloseMemtest = $LangStopMemtest
	Global $LangClosememtestAndPrt = "截�隋}���置emtest"
	Global $LangFirstPos = "起始位置"
	Global $LangLimitPos = "�坌��W件"
	Global $LangOffset = "�}隔距离"
	Global $LangDirection = "排列方向"
	Global $LangTest = "���I"
	Global $LangTestClose = "����"
	Global $LangArrangement = "排列方式"
	Global $LangBasic = "一般"
	Global $LangClose = "��密"

	Global $HelpTitle = "使用教��"
	Global $HelpMsg = "1. 自���y算公式�o ( �蠾��C�蛚q / �K內存 )"&@CRLF& _
							"　大于3117MB�h多�{一倍�蠾��C。"&@CRLF&@CRLF& _
							"2. 快速�~："&@CRLF& _
							"　　F5 → 自���y算"&@CRLF& _
							"　　F6 → �{�QMemTest"&@CRLF& _
							"　　F7 → �釂�"&@CRLF& _
							"　　F8 → ���艇�部MemTest "&@CRLF& _
							"　　※�[�ぁ峓硈t�~，反�堻t度比�]快※"&@CRLF&@CRLF& _
							"3. �釂韟Z (剩余內存) 大于 (保留內存) ���Q�� (自���D��)，"&@CRLF& _
							"　(自���D��) �悝滼悝E內存全部放在保留內存的Mem�X，"&@CRLF& _
							"　�扣w���} 0 �h不�Q�臐A�{���D�����}0秒，不�Q�臐C"&@CRLF&@CRLF& _
							"4. 截���{�次����o桌面。"&@CRLF&@CRLF& _
							"5. �e�罊I�間G�扣w一���釂��d��(百分比)，超�e�d�穻Z�悁��虩I�間C"&@CRLF&@CRLF& _
							"6. �e���C束：�e�罊I�陽髡谷Z自���C束Memtest ���I。"&@CRLF&@CRLF& _
							"7. 背景�蠾獢G�倦��{�QMemTest。"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120秒，或內存�\使用率低于98%，自�蟛蓂z排序"
	Global $WaitArrangementString="%03d/120秒，或內存�\使用率低于98%，自�蟛蓂z排序"

	Global $RunMemtestText = "\n　　　已完成%s / %s，剩余%s�歿n\n　　�Q�癐emTest中，�[稍等 . . .　　\n\n　"
ElseIf @OSLang = 0411 Then;;日文版
;~ ElseIf @OSLang = 0404 Then;;日文版*

	Global $Langprtscn_btn = "ЁъЧЬ"

	Global $LangError = "リьみ"
	Global $LangPathError = "memTestProゎ見コろヘスゆ"&@CRLF&"memTestProメ同ェиャユюズ置ゆサゑクイゆ。"

	Global $LangMainSetting = "設定"
	Global $LangMainMeter = "(фхэ X к①ЙЗ) = ワцЧЁш�っf ; 利用可能　空わфхэ"
	Global $LangAutoComputing = "自動計算"
	Global $LangStartMemtest = "MemTest開始"
	Global $LangStartBurning = "дみ⑦ユ⑦エペ"
	Global $LangStopMemtest = "MemTest停止"
	Global $LangHelp = "�u明"
	Global $LangListView = "合計          |利用可能       |起動時間   |�珌q時間           "
;~ 	Global $LangListView = "總記憶體  |可用記憶體  |執行時間  |剩餘時間          "
	Global $LangListViewUpdata = "合計           |利用可能      |起動時間   |%d% �珌q時間           "
;~ 	Global $LangListViewUpdata = "總記憶體  |可用記憶體  |執行時間  |%d% 剩餘時間          "

	Global $LangTotalRAM = "物理фхэ量"
	Global $LangFreeRAM = "利用可能фхэ"

	Global $LangBackgroundRun = "дЧヱヲьヨ⑦Э"
	Global $LangLayers = "順番調整"
	Global $LangSetting = "レкЁъ⑦"
	Global $LangCompensate = "補正時間（秒)"
	Global $LangCompensateSec = "秒"
	Global $MemtestErrorPrtPCS = "リьみ"
	Global $LangSetMemtestPos = "ヨユ⑦Эヨ設置"
	Global $LangErrorPrt = "リьみЁъЧЬ"
	Global $LangAutoPrt = "レみЬЁъЧЬ"
	Global $LangEnablePrt = "ЁъЧЬЁЗЪу起動"
	Global $LangPrtSp = "分/枚"
	Global $LangSavePath = "保存先"
	Global $LangDisplayLimit = "Зヱэみ⑦範�C"
	Global $LangAutoSet = "レみЬЙЧЬ"
	Global $LangEndPrt = "完成ЁъЧЬ"
	Global $LangEndClose = "к①ЙЗ終了"
	Global $LangEndShutdown= "к①ЙЗ�訰�"

	Global $LangMeter = "監視"
	Global $LangMemtestMeter = "#     |使用фхэ        | ロдみ範�C  | リьみ "
;~ 	Global $LangMemtestMeter = "# | 記憶體使用量 | 完成百分比 | 錯誤"
	Global $LangCloseMemtest = "Memtest終了"
	Global $LangClosememtestAndPrt = "  ヱ①みЗ +  кэ⑦ЬЗヱэみ⑦  Memtest"
	Global $LangFirstPos = "始バペ位置"
	Global $LangLimitPos = "限界範�C"
	Global $LangOffset = "間隔距離"
	Global $LangDirection = "序列方向"
	Global $LangTest = "ЪЗЬ"
	Global $LangTestClose = "ЪЗЬ終了"
	Global $LangArrangement = "序列方法"
	Global $LangBasic = "мみЁЧヱ"
	Global $LangClose = "ヱ①みЗ"

	Global $HelpTitle = "�u明"
	Global $HelpMsg = "1. 自動計算公式ゾ ( ЗяЧЭ�� / фхэ )"&@CRLF& _
							"　3117MBメ越りペシЗяЧЭ量メ倍ズエペ。"&@CRLF&@CRLF& _
							"2. ЁъみЬロЧЬワみ："&@CRLF& _
							"　　F5 → 自動計算"&@CRLF& _
							"　　F6 → MemTest起動"&@CRLF& _
							"　　F7 → дみ⑦ユ⑦"&@CRLF& _
							"　　F8 → MemTest全終了 "&@CRLF& _
							"　　※ЁъみЬロЧЬワみメ愛用ウサゑクイゆ。※"&@CRLF&@CRLF& _
							"3. дみ⑦ユ⑦後 (�珌qфхэ) ＞ (ワみкфхэ) ソ場合、自動的ズ (фхэ補正)メ行よ，"&@CRLF& _
							"　(фхэ補正) ゾ�珌qфхэメワみкфхэソMemズ置わネエ，"&@CRLF& _
							"　設定時間 0 ソ場合ゾ起動ウスゆ，既定�怪V0秒，起動ウスゆ。"&@CRLF&@CRLF& _
							"4. Зヱэみ⑦ЁъЧЬソ既定保存先ゾЫЗヱЬЧк。"&@CRLF&@CRLF& _
							"5. к①ЙЗ完成ЁъЧЬ：дみ⑦ユ⑦ズやペ�萓rメ設置ウ(％)，�萓rメ越りペシ自動的ズЁъЧЬエペ。"&@CRLF&@CRLF& _
							"6. к①ЙЗ終了：к①ЙЗ完成ЁъЧЬメヱэヤエペシ自動的ズMemtestメ終了エペ。"&@CRLF&@CRLF& _
							"7. дЧヱヲьヨ⑦Э：MemTestソ起動メ背景作業ズエペ。"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120秒，或ゆゾфхэ使用率ゎ98%以下ソ場合，自動的ズ序列順番メ�藹�"
	Global $WaitArrangementString="%03d/120秒，或ゆゾфхэ使用率ゎ98%以下ソ場合，自動的ズ序列順番メ�藹�"

	Global $RunMemtestText = "\n　　　進度%s / %s，�珌q%s個\n\n　　MemTestメ起動中，ウタヘゑれ待グゑクイゆ . . .　　\n\n　"
Else
	Global $Langprtscn_btn = "PrtScn"

	Global $LangError = "Error"
	Global $LangPathError = "memTestPro not found. "
	Global $LangMainSetting = "Setting"
	Global $LangMainMeter = "(Memory  X Num of Memtest) = Memory Used; Available Memory"
	Global $LangAutoComputing = "Automatic Calculate"
	Global $LangStartMemtest = "Start Memtest"
	Global $LangStartBurning = "Start Burning"
	Global $LangStopMemtest = "Stop Memtest"
	Global $LangHelp = "Help"
	Global $LangListView = "Total RAM   |Free RAM   |Run time   |Time left           "
	Global $LangListViewUpdata = "Total RAM |Using RAM |Run time |%d% Time left "
	Global $LangTotalRAM = "Total Memory"
	Global $LangFreeRAM = "Free Memory"

	Global $LangBackgroundRun = "Run in Background"
	Global $LangLayers = "Change Sorting"
	Global $LangSetting = "Advanced"
	Global $LangCompensate = "Delay Compensate"
	Global $LangCompensateSec = "Sec"
	Global $MemtestErrorPrtPCS = "Errors"
	Global $LangSetMemtestPos = "Customize window location"
	Global $LangErrorPrt = "Capture Error"
	Global $LangAutoPrt = "Auto PrtScn"
	Global $LangEnablePrt = "Start Screen Capture"
	Global $LangPrtSp = "Min/P"
	Global $LangSavePath = "Save Path"
	Global $LangDisplayLimit = "Screen area"
	Global $LangAutoSet = "Full screem"
	Global $LangEndPrt = "Over Target PrtScn"
	Global $LangEndClose = "End Over Target "
	Global $LangEndShutdown= "End Over Shutdown"

	Global $LangMeter = "Monitor"
	Global $LangMemtestMeter = "#     |Used memory | Coverage | Errors "
	Global $LangCloseMemtest = "Close Memtest"
	Global $LangClosememtestAndPrt = "  Close +    Prt Scn Memtest"
	Global $LangFirstPos = "Strat Position"
	Global $LangLimitPos = "Border size"
	Global $LangOffset = "Separation spacing"
	Global $LangDirection = "Sort by Direction"
	Global $LangTest = "Test"
	Global $LangTestClose = "Close"
	Global $LangArrangement = "Arrangement"
	Global $LangBasic = "Normal"
	Global $LangClose = "Close"

	Global $HelpTitle = "How to Use? User Guide"

	Global $HelpMsg = "1. Automatic calculation Formula(Threads /Total memory)"&@CRLF& _
							"　Open double threads when Memory over 3117MB"&@CRLF&@CRLF& _
							"2. Shortcut Key："&@CRLF& _
							"　　F5 → Automatic calculation"&@CRLF& _
							"　　F6 → Start MemTest"&@CRLF& _
							"　　F7 → Start Burning"&@CRLF& _
							"　　F8 → Cloese All MemTest"&@CRLF& _
							"　　※Keep Using Shortcut keys,Keep Faster Response※"&@CRLF&@CRLF& _
							"3. If after Burning (Free Memory) larger than Retain memory?Keeping memory?,"&@CRLF& _
							"　Delay Compensate will be enable."&@CRLF& _
							"　Delay Compensate will put all free memory?available memory into Retain memory"&@CRLF&@CRLF& _
							"　If setting time or default compensate time are zero, Memtest will not enabled."&@CRLF&@CRLF& _
							"4. Default screen capture path is Desktop"&@CRLF&@CRLF& _
							"5. Over Target Screen Caption: Set a target(percentage). When burning over the targe(percentage),automatic screen capture"&@CRLF&@CRLF& _
							"6. End Over Target: Close Memtest when burning over target(percentage)"&@CRLF&@CRLF& _
							"7. Running in background : Hidden Memtest"&@CRLF&@CRLF& _
							""
	Global $WaitArrangement = "120sec, or used memory is less than 98%, automatic sorting."
	Global $WaitArrangementString="%03d/120sec, or used memory is less than 98%, automatic sorting."

	Global $RunMemtestText = "\n　　Complete %s / %s，Remainder %s\n\n　　Starting MemTest，Please wait . . .　　\n\n　"
EndIf


