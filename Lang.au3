#include-once
If @OSLang = 0404 Then
	Global $Langprtscn_btn = "ºI¹Ï"

	Global $LangError = "¿ù»~"
	Global $LangPathError = "§ä¤£¨ìmemTestPro"&@CRLF&"½Ğ±NmemTestPro¸m¤J¦P¤@¥Ø¿ı¤º¡C"

	Global $LangMainSetting = "°ò¥»³]©w"
	Global $LangMainMeter = "(°O¾ĞÅé¤j¤p X ¶}±Ò­Ó¼Æ) = Á`¨Ï¥Î¶q ; ³Ñ¾l°O¾ĞÅé¡@ «O¯d°O¾ĞÅé"
	Global $LangAutoComputing = "¦Û°Ê­pºâ"
	Global $LangStartMemtest = "±Ò°ÊMemTest"
	Global $LangStartBurning = "¶}©l¿N¾÷"
	Global $LangStopMemtest = "Ãö³¬MemTest"
	Global $LangHelp = "¨Ï¥Î»¡©ú"
	Global $LangListView = "Á`°O¾ĞÅé  |¥i¥Î°O¾ĞÅé  |°õ¦æ®É¶¡  |³Ñ¾l®É¶¡          "
	Global $LangListViewUpdata = "Á`°O¾ĞÅé   |¥i¥Î°O¾ĞÅé   |°õ¦æ®É¶¡   |%d% ³Ñ¾l®É¶¡          "
	Global $LangTotalRAM = "Á`°O¾ĞÅé¬°"
	Global $LangFreeRAM = "¥i¥Î°O¾ĞÅé¬°"

	Global $LangBackgroundRun = "­I´º°õ¦æ"
	Global $LangLayers = "¦Û°Ê½Õ¾ã¶¶§Ç"
	Global $LangSetting = "°Ñ¼Æ³]©w"
	Global $LangCompensate = "¸ÉÀv©µ¿ğ(¬í)"
	Global $LangCompensateSec = "¬í"
	Global $MemtestErrorPrtPCS = "­Ó¿ù»~"
	Global $LangSetMemtestPos = "¦Û­q¶}±Ò¦ì¸m"
	Global $LangErrorPrt = "¿ù»~¦Û°ÊºI¹Ï"
	Global $LangAutoPrt = "¦Û°ÊºI¹Ï"
	Global $LangEnablePrt = "±Ò°ÊºI¹Ï"
	Global $LangPrtSp = "¤ÀÄÁ/±i"
	Global $LangSavePath = "¦sÀÉ¸ô®|"
	Global $LangDisplayLimit = "ºI¹Ï½d³ò"
	Global $LangAutoSet = "¥ş¿Ã¹õ"
	Global $LangEndPrt = "§¹¦¨´ú¸ÕºI¹Ï"
	Global $LangEndClose = "§¹¦¨´ú¸Õµ²§ô"
	Global $LangEndShutdown= "§¹¦¨´ú¸ÕÃö¾÷"

	Global $LangMeter = "ºÊ±±"
	Global $LangMemtestMeter = "#     | °O¾ĞÅé¨Ï¥Î¶q | §¹¦¨¦Ê¤À¤ñ | ¿ù»~   "
	Global $LangCloseMemtest = $LangStopMemtest
	Global $LangClosememtestAndPrt = "ºI¹Ï¨ÃÃö³¬memtest"
	Global $LangFirstPos = "°_©l¦ì¸m"
	Global $LangLimitPos = "Ãä¬É±ø¥ó"
	Global $LangOffset = "¶¡¹j¶ZÂ÷"
	Global $LangDirection = "±Æ¦C¤è¦V"
	Global $LangTest = "´ú¸Õ"
	Global $LangTestClose = "Ãö³¬"
	Global $LangArrangement = "±Æ¦C¤è¦¡"
	Global $LangBasic = "¤@¯ë"
	Global $LangClose = "ºò±K"

	Global $HelpTitle = "¨Ï¥Î±Ğ¾Ç"
	Global $HelpMsg = "1. ¦Û°Ê­pºâ¤½¦¡¬° ( °õ¦æºü¼Æ¶q / Á`°O¾ĞÅé )"&@CRLF& _
							"¡@¤j©ó3117MB«h¦h¶}¤@­¿°õ¦æºü¡C"&@CRLF&@CRLF& _
							"2. §Ö³tÁä¡G"&@CRLF& _
							"¡@¡@F5 ¡÷ ¦Û°Ê­pºâ"&@CRLF& _
							"¡@¡@F6 ¡÷ ¶}±ÒMemTest"&@CRLF& _
							"¡@¡@F7 ¡÷ ¿N¾÷"&@CRLF& _
							"¡@¡@F8 ¡÷ Ãö³¬¥ş³¡MemTest "&@CRLF& _
							"¡@¡@¡°½Ğ·R¥Î§Ö³tÁä¡A¤ÏÀ³³t«×¤ñ¸û§Ö¡°"&@CRLF&@CRLF& _
							"3. ¿N¾÷«á (³Ñ¾l°O¾ĞÅé) ¤j©ó («O¯d°O¾ĞÅé) ·|±Ò°Ê (¦Û°Ê¸ÉÀv)¡A"&@CRLF& _
							"¡@(¦Û°Ê¸ÉÀv) ·|§â³Ñ¾l°O¾ĞÅé¥ş³¡©ñ¦b«O¯d°O¾ĞÅéªºMem¤º¡A"&@CRLF& _
							"¡@³]©w®É¶¡ 0 «h¤£±Ò°Ê¡A¹w³]¸ÉÀv®É¶¡0¬í¡A¤£±Ò°Ê¡C"&@CRLF&@CRLF& _
							"4. ºI¹Ï¹w³]¸ô®|¬°®à­±¡C"&@CRLF&@CRLF& _
							"5. ¹L´úºI¹Ï¡G³]©w¤@­Ó¿N¾÷ªùÂe(¦Ê¤À¤ñ)¡A¶W¹LªùÂe«á·|¦Û°ÊºI¹Ï¡C"&@CRLF&@CRLF& _
							"6. ¹L´úµ²§ô¡G¹L´úºI¹Ï§¹¦¨«á¦Û°Êµ²§ôMemtest ´ú¸Õ¡C"&@CRLF&@CRLF& _
							"7. ­I´º°õ¦æ¡GÁôÂÃ¶}±ÒMemTest¡C"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120¬í¡A©Î°O¾ĞÅéÄÀ¨Ï¥Î²v§C©ó98%¡A¦Û°Ê¾ã²z±Æ§Ç"
	Global $WaitArrangementString="%03d/120¬í¡A©Î°O¾ĞÅéÄÀ¨Ï¥Î²v§C©ó98%¡A¦Û°Ê¾ã²z±Æ§Ç"

	Global $RunMemtestText = "\n¡@¡@¡@¤w§¹¦¨%s / %s¡A³Ñ¾l%s­Ó\n\n¡@¡@±Ò°ÊMemTest¤¤¡A½Ğµyµ¥ . . .¡@¡@\n\n¡@"
ElseIf @OSLang = 0804 Then;;Â²Åé¤¤¤å
;~ ElseIf @OSLang = 0404 Then;;Â²Åé¤¤¤å
	Global $Langprtscn_btn = "ºI†¶"

	Global $LangError = "‰}‡R"
	Global $LangPathError = "§ä¤£¨ìmemTestPro"&@CRLF&"ˆ[’âmemTestPro¸m¤J¦P¤@¥Ø‰£X¡C"

	Global $LangMainSetting = "°ò¥»„¦©w"
	Global $LangMainMeter = "(¤º¦s¤j¤p X …{„Qƒª‡Û) = ŠK¨Ï¥Î¶q ; ³Ñ§E¤º¦s¡@ «O¯d¤º¦s"
	Global $LangAutoComputing = "¦Ûƒğƒyºâ"
	Global $LangStartMemtest = "„QƒğMemTest"
	Global $LangStartBurning = "…{©lˆøÉó"
	Global $LangStopMemtest = "‹×„¸MemTest"
	Global $LangHelp = "¨Ï¥Î‡S©ú"
	Global $LangListView = "ŠK¤º¦s       |¥i¥Î¤º¦s      |ƒù¦æƒº…}    |³Ñ§Eƒº…}           "
	Global $LangListViewUpdata = "ŠK¤º¦s      |¥i¥Î¤º¦s      |ƒù¦æƒº…}   |%d% ³Ñ§Eƒº…}           "
	Global $LangTotalRAM = "ŠK¤º¦sƒo"
	Global $LangFreeRAM = "¥i¥Î¤º¦sƒo"

	Global $LangBackgroundRun = "¦Z¥x†b¦æ"
	Global $LangLayers = "¦Ûƒğˆ`¾ã…¦§Ç"
	Global $LangSetting = "ƒò‡Û„¦©w"
	Global $LangCompensate = "†D‰È©µ‰v(¬í)"
	Global $LangCompensateSec = "¬í"
	Global $MemtestErrorPrtPCS = "ƒª‰}‡R"
	Global $LangSetMemtestPos = "¦Ûƒz…{„Q¦ì¸m"
	Global $LangErrorPrt = "‰}‡R¦ÛƒğºI†¶"
	Global $LangAutoPrt = "¦ÛƒğºI†¶"
	Global $LangEnablePrt = "„QƒğºI†¶"
	Global $LangPrtSp = "¤ÀŒ]/„E"
	Global $LangSavePath = "¦s‰ã¸ô’¦"
	Global $LangDisplayLimit = "ºI†¶­S„Ï"
	Global $LangAutoSet = "¥ş«Ì¹õ"
	Global $LangEndPrt = "§¹¦¨„ò†IºI†¶"
	Global $LangEndClose = "§¹¦¨„ò†I…C§ô"
	Global $LangEndShutdown= "§¹¦¨„ò†I‹×Éó"

	Global $LangMeter = "†ê±±"
	Global $LangMemtestMeter = "#     | ¤º¦s¨Ï¥Î¶q      | §¹¦¨¦Ê¤À¤ñ  | ‰}‡R "
	Global $LangCloseMemtest = $LangStopMemtest
	Global $LangClosememtestAndPrt = "ºI†¶¦}‹×„¸memtest"
	Global $LangFirstPos = "°_©l¦ì¸m"
	Global $LangLimitPos = "‹Ê¬É„W¥ó"
	Global $LangOffset = "…}¹j¶ZÖÃ"
	Global $LangDirection = "±Æ¦C¤è¦V"
	Global $LangTest = "„ò†I"
	Global $LangTestClose = "‹×„¸"
	Global $LangArrangement = "±Æ¦C¤è¦¡"
	Global $LangBasic = "¤@¯ë"
	Global $LangClose = "†ú±K"

	Global $HelpTitle = "¨Ï¥Î±ĞˆÔ"
	Global $HelpMsg = "1. ¦Ûƒğƒyºâ¤½¦¡ƒo ( ƒù¦æ‡C‡Û¶q / ŠK¤º¦s )"&@CRLF& _
							"¡@¤j¤_3117MBƒh¦h…{¤@­¿ƒù¦æ‡C¡C"&@CRLF&@CRLF& _
							"2. §Ö³tŠ~¡G"&@CRLF& _
							"¡@¡@F5 ¡÷ ¦Ûƒğƒyºâ"&@CRLF& _
							"¡@¡@F6 ¡÷ …{„QMemTest"&@CRLF& _
							"¡@¡@F7 ¡÷ ˆøÉó"&@CRLF& _
							"¡@¡@F8 ¡÷ ‹×„¸¥ş³¡MemTest "&@CRLF& _
							"¡@¡@¡°ˆ[…Æ¥Î§Ö³tŠ~¡A¤Ï‰Ø³t«×¤ñ†]§Ö¡°"&@CRLF&@CRLF& _
							"3. ˆøÉó¦Z (³Ñ§E¤º¦s) ¤j¤_ («O¯d¤º¦s) …Ñ„Qƒğ (¦Ûƒğ†D‰È)¡A"&@CRLF& _
							"¡@(¦Ûƒğ†D‰È) …Ñ§â³Ñ§E¤º¦s¥ş³¡©ñ¦b«O¯d¤º¦sªºMemX¡A"&@CRLF& _
							"¡@„¦©wƒº…} 0 ƒh¤£„Qƒğ¡A†{„¦†D‰Èƒº…}0¬í¡A¤£„Qƒğ¡C"&@CRLF&@CRLF& _
							"4. ºI†¶†{„¦¸ô’¦ƒo®à­±¡C"&@CRLF&@CRLF& _
							"5. †e„òºI†¶¡G„¦©w¤@ƒªˆøÉóƒdŠÍ(¦Ê¤À¤ñ)¡A¶W†eƒdŠÍ¦Z…Ñ¦ÛƒğºI†¶¡C"&@CRLF&@CRLF& _
							"6. †e„ò…C§ô¡G†e„òºI†¶§¹¦¨¦Z¦Ûƒğ…C§ôMemtest „ò†I¡C"&@CRLF&@CRLF& _
							"7. ­I´ºƒù¦æ¡GŠ­ÂÃ…{„QMemTest¡C"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120¬í¡A©Î¤º¦sŒ\¨Ï¥Î²v§C¤_98%¡A¦Ûƒğ¾ã²z±Æ§Ç"
	Global $WaitArrangementString="%03d/120¬í¡A©Î¤º¦sŒ\¨Ï¥Î²v§C¤_98%¡A¦Ûƒğ¾ã²z±Æ§Ç"

	Global $RunMemtestText = "\n¡@¡@¡@¤w§¹¦¨%s / %s¡A³Ñ§E%sƒª\n\n¡@¡@„QƒğMemTest¤¤¡Aˆ[µyµ¥ . . .¡@¡@\n\n¡@"
ElseIf @OSLang = 0411 Then;;¤é¤åª©
;~ ElseIf @OSLang = 0404 Then;;¤é¤åª©*

	Global $Langprtscn_btn = "Ç³ÇãÇ¿ÇÄ"

	Global $LangError = "Ç¤ÇåÆã"
	Global $LangPathError = "memTestProÆò¨£ÇKÆñÇpÇQÆê"&@CRLF&"memTestProÇy¦PÆşÇÑÇ{Ç~ÇçÇR¸mÆêÇMÆõÇGÆûÆê¡C"

	Global $LangMainSetting = "³]©w"
	Global $LangMainMeter = "(ÇİÇŞÇæ X ÇÓÇéÇ·Çµ) = Ç©ÇßÇ¿Ç³Çá’ÆÇf ; §Q¥Î¥i¯à¡@ªÅÆóÇİÇŞÇæ"
	Global $LangAutoComputing = "¦Û°Ê­pºâ"
	Global $LangStartMemtest = "MemTest¶}©l"
	Global $LangStartBurning = "ÇÌÆãÇïÇ~ÇïÇ@Çr"
	Global $LangStopMemtest = "MemTest°±¤î"
	Global $LangHelp = "‘u©ú"
	Global $LangListView = "¦X­p          |§Q¥Î¥i¯à       |°_°Ê®É¶¡   |’ÏÇq®É¶¡           "
;~ 	Global $LangListView = "Á`°O¾ĞÅé  |¥i¥Î°O¾ĞÅé  |°õ¦æ®É¶¡  |³Ñ¾l®É¶¡          "
	Global $LangListViewUpdata = "¦X­p           |§Q¥Î¥i¯à      |°_°Ê®É¶¡   |%d% ’ÏÇq®É¶¡           "
;~ 	Global $LangListViewUpdata = "Á`°O¾ĞÅé  |¥i¥Î°O¾ĞÅé  |°õ¦æ®É¶¡  |%d% ³Ñ¾l®É¶¡          "

	Global $LangTotalRAM = "ª«²zÇİÇŞÇæ¶q"
	Global $LangFreeRAM = "§Q¥Î¥i¯àÇİÇŞÇæ"

	Global $LangBackgroundRun = "ÇÌÇ¿Ç«Ç¬ÇåÇ¢ÇïÇÅ"
	Global $LangLayers = "¶¶µf½Õ¾ã"
	Global $LangSetting = "Ç¦ÇÓÇ³ÇãÇï"
	Global $LangCompensate = "¸É¥¿®É¶¡¡]¬í)"
	Global $LangCompensateSec = "¬í"
	Global $MemtestErrorPrtPCS = "Ç¤ÇåÆã"
	Global $LangSetMemtestPos = "Ç¢Ç~ÇïÇÅÇ¢³]¸m"
	Global $LangErrorPrt = "Ç¤ÇåÆãÇ³ÇãÇ¿ÇÄ"
	Global $LangAutoPrt = "Ç¦ÆãÇÄÇ³ÇãÇ¿ÇÄ"
	Global $LangEnablePrt = "Ç³ÇãÇ¿ÇÄÇ³ÇµÇÂÇÜ°_°Ê"
	Global $LangPrtSp = "¤À/ªT"
	Global $LangSavePath = "«O¦s¥ı"
	Global $LangDisplayLimit = "ÇµÇ«ÇæÆãÇï½d’C"
	Global $LangAutoSet = "Ç¦ÆãÇÄÇ·Ç¿ÇÄ"
	Global $LangEndPrt = "§¹¦¨Ç³ÇãÇ¿ÇÄ"
	Global $LangEndClose = "ÇÓÇéÇ·Çµ²×¤F"
	Global $LangEndShutdown= "ÇÓÇéÇ·Çµ‹×Éó"

	Global $LangMeter = "ºÊµø"
	Global $LangMemtestMeter = "#     |¨Ï¥ÎÇİÇŞÇæ        | Ç§ÇÌÆã½d’C  | Ç¤ÇåÆã "
;~ 	Global $LangMemtestMeter = "# | °O¾ĞÅé¨Ï¥Î¶q | §¹¦¨¦Ê¤À¤ñ | ¿ù»~"
	Global $LangCloseMemtest = "Memtest²×¤F"
	Global $LangClosememtestAndPrt = "  Ç«ÇéÆãÇµ +  ÇÓÇæÇïÇÄÇµÇ«ÇæÆãÇï  Memtest"
	Global $LangFirstPos = "©lÇhÇr¦ì¸m"
	Global $LangLimitPos = "­­¬É½d’C"
	Global $LangOffset = "¶¡¹j¶ZÂ÷"
	Global $LangDirection = "§Ç¦C¤è¦V"
	Global $LangTest = "ÇÂÇµÇÄ"
	Global $LangTestClose = "ÇÂÇµÇÄ²×¤F"
	Global $LangArrangement = "§Ç¦C¤èªk"
	Global $LangBasic = "ÇÕÆãÇ³Ç¿Ç«"
	Global $LangClose = "Ç«ÇéÆãÇµ"

	Global $HelpTitle = "‘u©ú"
	Global $HelpMsg = "1. ¦Û°Ê­pºâ¤½¦¡ÇV ( ÇµÇèÇ¿ÇÅ‡Û / ÇİÇŞÇæ )"&@CRLF& _
							"¡@3117MBÇy¶VÆîÇrÇOÇµÇèÇ¿ÇÅ¶qÇy­¿ÇRÇ@Çr¡C"&@CRLF&@CRLF& _
							"2. Ç³ÇãÆãÇÄÇ§Ç¿ÇÄÇ©Æã¡G"&@CRLF& _
							"¡@¡@F5 ¡÷ ¦Û°Ê­pºâ"&@CRLF& _
							"¡@¡@F6 ¡÷ MemTest°_°Ê"&@CRLF& _
							"¡@¡@F7 ¡÷ ÇÌÆãÇïÇ~Çï"&@CRLF& _
							"¡@¡@F8 ¡÷ MemTest¥ş²×¤F "&@CRLF& _
							"¡@¡@¡°Ç³ÇãÆãÇÄÇ§Ç¿ÇÄÇ©ÆãÇy·R¥ÎÆıÇMÆõÇGÆûÆê¡C¡°"&@CRLF&@CRLF& _
							"3. ÇÌÆãÇïÇ~Çï«á (’ÏÇqÇİÇŞÇæ) ¡Ö (Ç©ÆãÇÓÇİÇŞÇæ) ÇU³õ¦X¡B¦Û°ÊªºÇR (ÇİÇŞÇæ¸É¥¿)Çy¦æÆì¡A"&@CRLF& _
							"¡@(ÇİÇŞÇæ¸É¥¿) ÇV’ÏÇqÇİÇŞÇæÇyÇ©ÆãÇÓÇİÇŞÇæÇUMemÇR¸mÆóÇeÇ@¡A"&@CRLF& _
							"¡@³]©w®É¶¡ 0 ÇU³õ¦XÇV°_°ÊÆıÇQÆê¡A¬J©w‚©ÇV0¬í¡A°_°ÊÆıÇQÆê¡C"&@CRLF&@CRLF& _
							"4. ÇµÇ«ÇæÆãÇïÇ³ÇãÇ¿ÇÄÇU¬J©w«O¦s¥ıÇVÇÃÇµÇ«ÇÄÇ¿ÇÓ¡C"&@CRLF&@CRLF& _
							"5. ÇÓÇéÇ·Çµ§¹¦¨Ç³ÇãÇ¿ÇÄ¡GÇÌÆãÇïÇ~ÇïÇRÆèÇr‡Û¦rÇy³]¸mÆı(¢H)¡A‡Û¦rÇy¶VÆîÇrÇO¦Û°ÊªºÇRÇ³ÇãÇ¿ÇÄÇ@Çr¡C"&@CRLF&@CRLF& _
							"6. ÇÓÇéÇ·Çµ²×¤F¡GÇÓÇéÇ·Çµ§¹¦¨Ç³ÇãÇ¿ÇÄÇyÇ«ÇæÇ|Ç@ÇrÇO¦Û°ÊªºÇRMemtestÇy²×¤FÇ@Çr¡C"&@CRLF&@CRLF& _
							"7. ÇÌÇ¿Ç«Ç¬ÇåÇ¢ÇïÇÅ¡GMemTestÇU°_°ÊÇy­I´º§@·~ÇRÇ@Çr¡C"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120¬í¡A©ÎÆêÇVÇİÇŞÇæ¨Ï¥Î²vÆò98%¥H¤UÇU³õ¦X¡A¦Û°ÊªºÇR§Ç¦C¶¶µfÇy“Ä§ó"
	Global $WaitArrangementString="%03d/120¬í¡A©ÎÆêÇVÇİÇŞÇæ¨Ï¥Î²vÆò98%¥H¤UÇU³õ¦X¡A¦Û°ÊªºÇR§Ç¦C¶¶µfÇy“Ä§ó"

	Global $RunMemtestText = "\n¡@¡@¡@¶i«×%s / %s¡A’ÏÇq%s­Ó\n\n¡@¡@MemTestÇy°_°Ê¤¤¡AÆıÇWÇpÆõÆğ«İÇHÆõÇGÆûÆê . . .¡@¡@\n\n¡@"
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
							"¡@Open double threads when Memory over 3117MB"&@CRLF&@CRLF& _
							"2. Shortcut Key¡G"&@CRLF& _
							"¡@¡@F5 ¡÷ Automatic calculation"&@CRLF& _
							"¡@¡@F6 ¡÷ Start MemTest"&@CRLF& _
							"¡@¡@F7 ¡÷ Start Burning"&@CRLF& _
							"¡@¡@F8 ¡÷ Cloese All MemTest"&@CRLF& _
							"¡@¡@¡°Keep Using Shortcut keys,Keep Faster Response¡°"&@CRLF&@CRLF& _
							"3. If after Burning (Free Memory) larger than Retain memory?Keeping memory?,"&@CRLF& _
							"¡@Delay Compensate will be enable."&@CRLF& _
							"¡@Delay Compensate will put all free memory?available memory into Retain memory"&@CRLF&@CRLF& _
							"¡@If setting time or default compensate time are zero, Memtest will not enabled."&@CRLF&@CRLF& _
							"4. Default screen capture path is Desktop"&@CRLF&@CRLF& _
							"5. Over Target Screen Caption: Set a target(percentage). When burning over the targe(percentage),automatic screen capture"&@CRLF&@CRLF& _
							"6. End Over Target: Close Memtest when burning over target(percentage)"&@CRLF&@CRLF& _
							"7. Running in background : Hidden Memtest"&@CRLF&@CRLF& _
							""
	Global $WaitArrangement = "120sec, or used memory is less than 98%, automatic sorting."
	Global $WaitArrangementString="%03d/120sec, or used memory is less than 98%, automatic sorting."

	Global $RunMemtestText = "\n¡@¡@Complete %s / %s¡ARemainder %s\n\n¡@¡@Starting MemTest¡APlease wait . . .¡@¡@\n\n¡@"
EndIf


