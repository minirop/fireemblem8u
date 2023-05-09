	.section .data

	.global gUnknown_08A191F4
gUnknown_08A191F4:  @ 0x08A191F4
	.incbin "baserom.gba", 0xA191F4, 0xC

	.global gUnknown_08A19200
gUnknown_08A19200:  @ 0x08A19200
@ replacing .incbin "baserom.gba", 0x00a19200, 0x4
.4byte gUnknown_0200F15C + 0x20

	.global gUnknown_08A19204
gUnknown_08A19204:  @ 0x08A19204
	.incbin "baserom.gba", 0xA19204, 0x8

	.global ProcScr_PrepItemSupplyScreen
ProcScr_PrepItemSupplyScreen:  @ 0x08A1920C
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809D570
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809D914
	@ PROC_SLEEP
	.short 0xe, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809DA00
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_LABEL
	.short 0xb, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809DC70
	@ PROC_LABEL
	.short 0xb, 0x2
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809DCD4
	@ PROC_LABEL
	.short 0xb, 0x4
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809E184
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809E420
	@ PROC_LABEL
	.short 0xb, 0x5
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809DFB0
	@ PROC_LABEL
	.short 0xb, 0x6
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809E054
	@ PROC_LABEL
	.short 0xb, 0x3
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809E840
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809E974
	@ PROC_LABEL
	.short 0xb, 0x8
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_LABEL
	.short 0xb, 0x9
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809EA7C
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0


	.global ProcScr_BmSupplyScreen
ProcScr_BmSupplyScreen:  @ 0x08A192EC
	@ PROC_CALL
	.short 0x2, 0x0
	.word AddSkipThread2
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8013D80
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word WaitForFade
	@ PROC_CALL
	.short 0x2, 0x0
	.word BMapDispSuspend
	@ PROC_LABEL
	.short 0xb, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809EAF4
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809D570
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809D914
	@ PROC_SLEEP
	.short 0xe, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809DA00
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_LABEL
	.short 0xb, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809DC70
	@ PROC_LABEL
	.short 0xb, 0x2
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809DCD4
	@ PROC_LABEL
	.short 0xb, 0x4
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809E184
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809E420
	@ PROC_LABEL
	.short 0xb, 0x5
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809DFB0
	@ PROC_LABEL
	.short 0xb, 0x6
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809E054
	@ PROC_LABEL
	.short 0xb, 0x3
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809E840
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809E974
	@ PROC_LABEL
	.short 0xb, 0x8
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_LABEL
	.short 0xb, 0x9
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809EA7C
	@ PROC_CALL
	.short 0x2, 0x0
	.word BMapDispResume
	@ PROC_CALL
	.short 0x2, 0x0
	.word RefreshBMapGraphics
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809EB14
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_8013DA4
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word WaitForFade
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word SubSkipThread2
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0


	.global ProcScr_PrepItemListScreen
ProcScr_PrepItemListScreen:  @ 0x08A19424
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809EB78
	@ PROC_LABEL
	.short 0xb, 0x0
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809ED8C
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeIn
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeInExists
	@ PROC_LABEL
	.short 0xb, 0x1
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809F5F4
	@ PROC_LABEL
	.short 0xb, 0x2
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809F688
	@ PROC_LABEL
	.short 0xb, 0x6
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809F0FC
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809FD54
	@ PROC_YIELD
	.short 0xe, 0x0
	.word 0x0
	@ PROC_GOTO
	.short 0xc, 0x0
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x7
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809FB34
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809FC24
	@ PROC_GOTO
	.short 0xc, 0x1
	.word 0x0
	@ PROC_LABEL
	.short 0xb, 0x3
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809F218
	@ PROC_LABEL
	.short 0xb, 0x4
	.word 0x0
	@ PROC_REPEAT
	.short 0x3, 0x0
	.word sub_809F2C4
	@ PROC_LABEL
	.short 0xb, 0x8
	.word 0x0
	@ PROC_CALL_ARG
	.short 0x18, 0x10
	.word NewFadeOut
	@ PROC_WHILE
	.short 0x14, 0x0
	.word FadeOutExists
	@ PROC_LABEL
	.short 0xb, 0x9
	.word 0x0
	@ PROC_CALL
	.short 0x2, 0x0
	.word sub_809F0FC
	@ PROC_END
	.short 0x0, 0x0
	.word 0x0
