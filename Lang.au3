#include-once
If @OSLang = 0404 Then
	Global $Langprtscn_btn = "�I��"

	Global $LangError = "���~"
	Global $LangPathError = "�䤣��memTestPro"&@CRLF&"�бNmemTestPro�m�J�P�@�ؿ����C"

	Global $LangMainSetting = "�򥻳]�w"
	Global $LangMainMeter = "(�O����j�p X �}�ҭӼ�) = �`�ϥζq ; �Ѿl�O����@ �O�d�O����"
	Global $LangAutoComputing = "�۰ʭp��"
	Global $LangStartMemtest = "�Ұ�MemTest"
	Global $LangStartBurning = "�}�l�N��"
	Global $LangStopMemtest = "����MemTest"
	Global $LangHelp = "�ϥλ���"
	Global $LangListView = "�`�O����  |�i�ΰO����  |����ɶ�  |�Ѿl�ɶ�          "
	Global $LangListViewUpdata = "�`�O����   |�i�ΰO����   |����ɶ�   |%d% �Ѿl�ɶ�          "
	Global $LangTotalRAM = "�`�O���鬰"
	Global $LangFreeRAM = "�i�ΰO���鬰"

	Global $LangBackgroundRun = "�I������"
	Global $LangLayers = "�۰ʽվ㶶��"
	Global $LangSetting = "�ѼƳ]�w"
	Global $LangCompensate = "���v����(��)"
	Global $LangCompensateSec = "��"
	Global $MemtestErrorPrtPCS = "�ӿ��~"
	Global $LangSetMemtestPos = "�ۭq�}�Ҧ�m"
	Global $LangErrorPrt = "���~�۰ʺI��"
	Global $LangAutoPrt = "�۰ʺI��"
	Global $LangEnablePrt = "�ҰʺI��"
	Global $LangPrtSp = "����/�i"
	Global $LangSavePath = "�s�ɸ��|"
	Global $LangDisplayLimit = "�I�Ͻd��"
	Global $LangAutoSet = "���ù�"
	Global $LangEndPrt = "�������պI��"
	Global $LangEndClose = "�������յ���"
	Global $LangEndShutdown= "������������"

	Global $LangMeter = "�ʱ�"
	Global $LangMemtestMeter = "#     | �O����ϥζq | �����ʤ��� | ���~   "
	Global $LangCloseMemtest = $LangStopMemtest
	Global $LangClosememtestAndPrt = "�I�Ϩ�����memtest"
	Global $LangFirstPos = "�_�l��m"
	Global $LangLimitPos = "��ɱ���"
	Global $LangOffset = "���j�Z��"
	Global $LangDirection = "�ƦC��V"
	Global $LangTest = "����"
	Global $LangTestClose = "����"
	Global $LangArrangement = "�ƦC�覡"
	Global $LangBasic = "�@��"
	Global $LangClose = "��K"

	Global $HelpTitle = "�ϥαо�"
	Global $HelpMsg = "1. �۰ʭp�⤽���� ( ������ƶq / �`�O���� )"&@CRLF& _
							"�@�j��3117MB�h�h�}�@��������C"&@CRLF&@CRLF& _
							"2. �ֳt��G"&@CRLF& _
							"�@�@F5 �� �۰ʭp��"&@CRLF& _
							"�@�@F6 �� �}��MemTest"&@CRLF& _
							"�@�@F7 �� �N��"&@CRLF& _
							"�@�@F8 �� ��������MemTest "&@CRLF& _
							"�@�@���зR�Χֳt��A�����t�פ���֡�"&@CRLF&@CRLF& _
							"3. �N���� (�Ѿl�O����) �j�� (�O�d�O����) �|�Ұ� (�۰ʸ��v)�A"&@CRLF& _
							"�@(�۰ʸ��v) �|��Ѿl�O���������b�O�d�O���骺Mem���A"&@CRLF& _
							"�@�]�w�ɶ� 0 �h���ҰʡA�w�]���v�ɶ�0��A���ҰʡC"&@CRLF&@CRLF& _
							"4. �I�Ϲw�]���|���ୱ�C"&@CRLF&@CRLF& _
							"5. �L���I�ϡG�]�w�@�ӿN�����e(�ʤ���)�A�W�L���e��|�۰ʺI�ϡC"&@CRLF&@CRLF& _
							"6. �L�������G�L���I�ϧ�����۰ʵ���Memtest ���աC"&@CRLF&@CRLF& _
							"7. �I������G���ö}��MemTest�C"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120��A�ΰO�������ϥβv�C��98%�A�۰ʾ�z�Ƨ�"
	Global $WaitArrangementString="%03d/120��A�ΰO�������ϥβv�C��98%�A�۰ʾ�z�Ƨ�"

	Global $RunMemtestText = "\n�@�@�@�w����%s / %s�A�Ѿl%s��\n\n�@�@�Ұ�MemTest���A�еy�� . . .�@�@\n\n�@"
ElseIf @OSLang = 0804 Then;;²�餤��
;~ ElseIf @OSLang = 0404 Then;;²�餤��
	Global $Langprtscn_btn = "�I��"

	Global $LangError = "�}�R"
	Global $LangPathError = "�䤣��memTestPro"&@CRLF&"�[��memTestPro�m�J�P�@�؉��X�C"

	Global $LangMainSetting = "�򥻄��w"
	Global $LangMainMeter = "(���s�j�p X �{�Q����) = �K�ϥζq ; �ѧE���s�@ �O�d���s"
	Global $LangAutoComputing = "�ۃ��y��"
	Global $LangStartMemtest = "�Q��MemTest"
	Global $LangStartBurning = "�{�l����"
	Global $LangStopMemtest = "�ׄ�MemTest"
	Global $LangHelp = "�ϥ·S��"
	Global $LangListView = "�K���s       |�i�Τ��s      |���惺�}    |�ѧE���}           "
	Global $LangListViewUpdata = "�K���s      |�i�Τ��s      |���惺�}   |%d% �ѧE���}           "
	Global $LangTotalRAM = "�K���s�o"
	Global $LangFreeRAM = "�i�Τ��s�o"

	Global $LangBackgroundRun = "�Z�x�b��"
	Global $LangLayers = "�ۃ��`�ㅦ��"
	Global $LangSetting = "��ۄ��w"
	Global $LangCompensate = "�D�ȩ��v(��)"
	Global $LangCompensateSec = "��"
	Global $MemtestErrorPrtPCS = "���}�R"
	Global $LangSetMemtestPos = "�ۃz�{�Q��m"
	Global $LangErrorPrt = "�}�R�ۃ�I��"
	Global $LangAutoPrt = "�ۃ�I��"
	Global $LangEnablePrt = "�Q��I��"
	Global $LangPrtSp = "���]/�E"
	Global $LangSavePath = "�s�����"
	Global $LangDisplayLimit = "�I���S��"
	Global $LangAutoSet = "���̹�"
	Global $LangEndPrt = "������I�I��"
	Global $LangEndClose = "������I�C��"
	Global $LangEndShutdown= "������I����"

	Global $LangMeter = "�걱"
	Global $LangMemtestMeter = "#     | ���s�ϥζq      | �����ʤ���  | �}�R "
	Global $LangCloseMemtest = $LangStopMemtest
	Global $LangClosememtestAndPrt = "�I���}�ׄ�memtest"
	Global $LangFirstPos = "�_�l��m"
	Global $LangLimitPos = "�ʬɄW��"
	Global $LangOffset = "�}�j�Z��"
	Global $LangDirection = "�ƦC��V"
	Global $LangTest = "��I"
	Global $LangTestClose = "�ׄ�"
	Global $LangArrangement = "�ƦC�覡"
	Global $LangBasic = "�@��"
	Global $LangClose = "���K"

	Global $HelpTitle = "�ϥαЈ�"
	Global $HelpMsg = "1. �ۃ��y�⤽���o ( ����C�۶q / �K���s )"&@CRLF& _
							"�@�j�_3117MB�h�h�{�@������C�C"&@CRLF&@CRLF& _
							"2. �ֳt�~�G"&@CRLF& _
							"�@�@F5 �� �ۃ��y��"&@CRLF& _
							"�@�@F6 �� �{�QMemTest"&@CRLF& _
							"�@�@F7 �� ����"&@CRLF& _
							"�@�@F8 �� �ׄ�����MemTest "&@CRLF& _
							"�@�@���[�ƥΧֳt�~�A�ωسt�פ�]�֡�"&@CRLF&@CRLF& _
							"3. ����Z (�ѧE���s) �j�_ (�O�d���s) �фQ�� (�ۃ��D��)�A"&@CRLF& _
							"�@(�ۃ��D��) �ѧ�ѧE���s������b�O�d���s��Mem�X�A"&@CRLF& _
							"�@���w���} 0 �h���Q��A�{���D�ȃ��}0��A���Q��C"&@CRLF&@CRLF& _
							"4. �I���{�������o�ୱ�C"&@CRLF&@CRLF& _
							"5. �e��I���G���w�@������d��(�ʤ���)�A�W�e�d�ͦZ�Ѧۃ�I���C"&@CRLF&@CRLF& _
							"6. �e��C���G�e��I�������Z�ۃ��C��Memtest ��I�C"&@CRLF&@CRLF& _
							"7. �I������G���Å{�QMemTest�C"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120��A�Τ��s�\�ϥβv�C�_98%�A�ۃ��z�Ƨ�"
	Global $WaitArrangementString="%03d/120��A�Τ��s�\�ϥβv�C�_98%�A�ۃ��z�Ƨ�"

	Global $RunMemtestText = "\n�@�@�@�w����%s / %s�A�ѧE%s��\n\n�@�@�Q��MemTest���A�[�y�� . . .�@�@\n\n�@"
ElseIf @OSLang = 0411 Then;;��媩
;~ ElseIf @OSLang = 0404 Then;;��媩*

	Global $Langprtscn_btn = "ǳ��ǿ��"

	Global $LangError = "Ǥ����"
	Global $LangPathError = "memTestPro���K���p�Q��"&@CRLF&"memTestPro�y�P�����{�~���R�m���M���G����C"

	Global $LangMainSetting = "�]�w"
	Global $LangMainMeter = "(������ X ����Ƿǵ) = ǩ��ǿǳ����f ; �Q�Υi��@����������"
	Global $LangAutoComputing = "�۰ʭp��"
	Global $LangStartMemtest = "MemTest�}�l"
	Global $LangStartBurning = "�������~���@�r"
	Global $LangStopMemtest = "MemTest����"
	Global $LangHelp = "�u��"
	Global $LangListView = "�X�p          |�Q�Υi��       |�_�ʮɶ�   |���q�ɶ�           "
;~ 	Global $LangListView = "�`�O����  |�i�ΰO����  |����ɶ�  |�Ѿl�ɶ�          "
	Global $LangListViewUpdata = "�X�p           |�Q�Υi��      |�_�ʮɶ�   |%d% ���q�ɶ�           "
;~ 	Global $LangListViewUpdata = "�`�O����  |�i�ΰO����  |����ɶ�  |%d% �Ѿl�ɶ�          "

	Global $LangTotalRAM = "���z������q"
	Global $LangFreeRAM = "�Q�Υi��������"

	Global $LangBackgroundRun = "��ǿǫǬ��Ǣ����"
	Global $LangLayers = "���f�վ�"
	Global $LangSetting = "Ǧ��ǳ����"
	Global $LangCompensate = "�ɥ��ɶ��]��)"
	Global $LangCompensateSec = "��"
	Global $MemtestErrorPrtPCS = "Ǥ����"
	Global $LangSetMemtestPos = "Ǣ�~����Ǣ�]�m"
	Global $LangErrorPrt = "Ǥ����ǳ��ǿ��"
	Global $LangAutoPrt = "Ǧ����ǳ��ǿ��"
	Global $LangEnablePrt = "ǳ��ǿ��ǳǵ���ܰ_��"
	Global $LangPrtSp = "��/�T"
	Global $LangSavePath = "�O�s��"
	Global $LangDisplayLimit = "ǵǫ������d�C"
	Global $LangAutoSet = "Ǧ����Ƿǿ��"
	Global $LangEndPrt = "����ǳ��ǿ��"
	Global $LangEndClose = "����Ƿǵ�פF"
	Global $LangEndShutdown= "����Ƿǵ����"

	Global $LangMeter = "�ʵ�"
	Global $LangMemtestMeter = "#     |�ϥ�������        | ǧ����d�C  | Ǥ���� "
;~ 	Global $LangMemtestMeter = "# | �O����ϥζq | �����ʤ��� | ���~"
	Global $LangCloseMemtest = "Memtest�פF"
	Global $LangClosememtestAndPrt = "  ǫ����ǵ +  ��������ǵǫ������  Memtest"
	Global $LangFirstPos = "�l�h�r��m"
	Global $LangLimitPos = "���ɽd�C"
	Global $LangOffset = "���j�Z��"
	Global $LangDirection = "�ǦC��V"
	Global $LangTest = "��ǵ��"
	Global $LangTestClose = "��ǵ�ĲפF"
	Global $LangArrangement = "�ǦC��k"
	Global $LangBasic = "����ǳǿǫ"
	Global $LangClose = "ǫ����ǵ"

	Global $HelpTitle = "�u��"
	Global $HelpMsg = "1. �۰ʭp�⤽���V ( ǵ��ǿ�Ň� / ������ )"&@CRLF& _
							"�@3117MB�y�V���r�Oǵ��ǿ�Ŷq�y���R�@�r�C"&@CRLF&@CRLF& _
							"2. ǳ������ǧǿ��ǩ��G"&@CRLF& _
							"�@�@F5 �� �۰ʭp��"&@CRLF& _
							"�@�@F6 �� MemTest�_��"&@CRLF& _
							"�@�@F7 �� �������~��"&@CRLF& _
							"�@�@F8 �� MemTest���פF "&@CRLF& _
							"�@�@��ǳ������ǧǿ��ǩ���y�R�����M���G����C��"&@CRLF&@CRLF& _
							"3. �������~��� (���q������) �� (ǩ����������) �U���X�B�۰ʪ��R (������ɥ�)�y����A"&@CRLF& _
							"�@(������ɥ�) �V���q�������yǩ�����������UMem�R�m���e�@�A"&@CRLF& _
							"�@�]�w�ɶ� 0 �U���X�V�_�����Q��A�J�w���V0��A�_�����Q��C"&@CRLF&@CRLF& _
							"4. ǵǫ������ǳ��ǿ���U�J�w�O�s���V��ǵǫ��ǿ�ӡC"&@CRLF&@CRLF& _
							"5. ����Ƿǵ����ǳ��ǿ�ġG�������~���R���r�ۦr�y�]�m��(�H)�A�ۦr�y�V���r�O�۰ʪ��Rǳ��ǿ���@�r�C"&@CRLF&@CRLF& _
							"6. ����Ƿǵ�פF�G����Ƿǵ����ǳ��ǿ���yǫ���|�@�r�O�۰ʪ��RMemtest�y�פF�@�r�C"&@CRLF&@CRLF& _
							"7. ��ǿǫǬ��Ǣ���šGMemTest�U�_���y�I���@�~�R�@�r�C"&@CRLF&@CRLF& _
							""

	Global $WaitArrangement = "120��A�����V������ϥβv��98%�H�U�U���X�A�۰ʪ��R�ǦC���f�y�ħ�"
	Global $WaitArrangementString="%03d/120��A�����V������ϥβv��98%�H�U�U���X�A�۰ʪ��R�ǦC���f�y�ħ�"

	Global $RunMemtestText = "\n�@�@�@�i��%s / %s�A���q%s��\n\n�@�@MemTest�y�_�ʤ��A���W�p������H���G���� . . .�@�@\n\n�@"
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
							"�@Open double threads when Memory over 3117MB"&@CRLF&@CRLF& _
							"2. Shortcut Key�G"&@CRLF& _
							"�@�@F5 �� Automatic calculation"&@CRLF& _
							"�@�@F6 �� Start MemTest"&@CRLF& _
							"�@�@F7 �� Start Burning"&@CRLF& _
							"�@�@F8 �� Cloese All MemTest"&@CRLF& _
							"�@�@��Keep Using Shortcut keys,Keep Faster Response��"&@CRLF&@CRLF& _
							"3. If after Burning (Free Memory) larger than Retain memory?Keeping memory?,"&@CRLF& _
							"�@Delay Compensate will be enable."&@CRLF& _
							"�@Delay Compensate will put all free memory?available memory into Retain memory"&@CRLF&@CRLF& _
							"�@If setting time or default compensate time are zero, Memtest will not enabled."&@CRLF&@CRLF& _
							"4. Default screen capture path is Desktop"&@CRLF&@CRLF& _
							"5. Over Target Screen Caption: Set a target(percentage). When burning over the targe(percentage),automatic screen capture"&@CRLF&@CRLF& _
							"6. End Over Target: Close Memtest when burning over target(percentage)"&@CRLF&@CRLF& _
							"7. Running in background : Hidden Memtest"&@CRLF&@CRLF& _
							""
	Global $WaitArrangement = "120sec, or used memory is less than 98%, automatic sorting."
	Global $WaitArrangementString="%03d/120sec, or used memory is less than 98%, automatic sorting."

	Global $RunMemtestText = "\n�@�@Complete %s / %s�ARemainder %s\n\n�@�@Starting MemTest�APlease wait . . .�@�@\n\n�@"
EndIf


