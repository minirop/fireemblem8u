#include "global.h"
#include "ap.h"
#include "fontgrp.h"
#include "hardware.h"
#include "proc.h"
#include "rng.h"
#include "mu.h"
#include "soundwrapper.h"
#include "gamecontrol.h"
#include "bm.h"
#include "bmsave.h"
#include "worldmap.h"

// uninitialized memory in the original build due to changing this call to no longer use __FILE__.
#ifdef EUROPE
const u32 gUninitializedMemory = 0x7800303E;
#else
const u16 gUninitializedMemory[] = {0x4641, 0x464A, 0x4653, 0x465C};
#endif

#ifdef EUROPE
const char gBuildDateTime[] = "2005/07/12(TUE) 19:24:55";
const char gProjectInternalTitle[] = "AGBFE3";
#else
const char gBuildDateTime[] = "2005/02/04(FRI) 16:55:40";
const char gYearProjectCreated[] = "_2003";
#endif

void StoreIRQToIRAM();

#ifdef EUROPE
void FUN_080a49b0();
#endif

void AgbMain()
{
    int sw_rst;

    // clear RAM
    DmaFill32(3, 0, (void *)IWRAM_START, 0x7F80); // reset the area for the IWRAM ARM section.
    CpuFastFill(0, (void *)EWRAM_START, 0x40000);    

    /* maybe WAITCNT will not reset after SW_RST? */
    sw_rst = (REG_WAITCNT != 0);
    SetSoftwareResetFlag(sw_rst);
    if (sw_rst == TRUE)
        RegisterRamReset(~2);

    REG_WAITCNT = WAITCNT_SRAM_4 |          /* SRAM Wait Control          = 4 cycles */
                  WAITCNT_WS0_N_3 |         /* Wait State 0 First Access  = 3 cycles */
                  WAITCNT_WS0_S_1 |         /* Wait State 0 Second Access = 1 cycle  */
                  WAITCNT_WS1_N_3 |         /* Wait State 1 First Access  = 3 cycles */
                  WAITCNT_WS1_S_1 |         /* Wait State 1 Second Access = 1 cycle  */
                  WAITCNT_WS2_N_3 |         /* Wait State 2 First Access  = 3 cycles */
                  WAITCNT_WS2_S_1 |         /* Wait State 2 Second Access = 1 cycle  */
                  WAITCNT_PHI_OUT_NONE |    /* PHI Terminal Output disabled */
                  WAITCNT_PREFETCH_ENABLE | /* Game Pak Prefetch Buffer enabled */
                  WAITCNT_AGB;

    StoreIRQToIRAM();
    SetInterrupt_LCDVBlank(NULL);

    REG_DISPSTAT = DISPSTAT_VBLANK_INTR;
    REG_IME = INTR_FLAG_VBLANK;
    ResetKeyStatus(gKeyStatusPtr);
    UpdateKeyStatus(gKeyStatusPtr);
    StoreRoutinesToIRAM();
    SramInit();
    Proc_Init();
    AP_ClearAll();
    InitMus();
    SetLCGRNValue(0x42D690E9);
    InitRN(AdvanceGetLCGRNValue());
    DisableKeyComboResetEN();
    EraseInvalidSaveData();
#ifndef EUROPE
    EraseSramDataIfInvalid();
#endif

    // initialize sound
    m4aSoundInit();
    Sound_SetDefaultMaxNumChannels();

    SetInterrupt_LCDVBlank(OnVBlank);
    GmDataInit();
#ifdef EUROPE
    FUN_080a49b0();
    if (GetLang() > 4)
    {
        SetLang(0);
    }
#else
    SetLang(LANG_ENGLISH);
#endif
    ResetText();
    StartGame();

    // perform the game loop.
    while (1)
    {
        ExecMainUpdate();
        SoftResetIfKeyComboPressed();
    };
}
