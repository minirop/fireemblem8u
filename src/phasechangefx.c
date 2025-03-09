#include "global.h"
#include "functions.h"
#include "variables.h"
#include "gbaio.h"
#include "ctc.h"
#include "hardware.h"
#include "proc.h"
#include "soundwrapper.h"
#include "uiutils.h"
#include "bmphase.h"
#include "bmunit.h"
#include "bm.h"
#include "bmlib.h"
#include "phasechangefx.h"
#include "constants/video-global.h"

/*
 * The nice phase changing animation thing and related procs/functions
 * port from fe6@StanHash
 */

int CheckInLinkArena();

/* section.data */

u16 CONST_DATA obj_0859AEC8[] =
{
    5,
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32, 0,
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32 + OAM1_X(64), OAM2_CHR(0x8),
    OAM0_SHAPE_64x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_64x32 + OAM1_X(128), OAM2_CHR(0x10),
    OAM0_SHAPE_32x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_32x32 + OAM1_X(192), OAM2_CHR(0x18),
    OAM0_SHAPE_16x32 + OAM0_AFFINE_ENABLE, OAM1_SIZE_16x32 + OAM1_X(224), OAM2_CHR(0x1C),
};

struct ProcCmd CONST_DATA gProcScr_PhaseIntroUnk[] = {
    PROC_CALL(PhaseIntroUnk_Init),
    PROC_REPEAT(PhaseIntroUnk_Loop),
};

struct ProcCmd CONST_DATA gProcScr_PhaseIntroText[] = {
    PROC_CALL(PhaseIntroInitText),
    PROC_SLEEP(0x06),
    PROC_CALL(PhaseIntroText_PutText),
    PROC_START_CHILD(gProcScr_PhaseIntroUnk),
    PROC_REPEAT(PhaseIntroText_InLoop),
    PROC_SLEEP(0x1E),
    PROC_REPEAT(PhaseIntroText_OutLoop),
    PROC_CALL(PhaseIntroClearText),
    PROC_END
};

struct ProcCmd CONST_DATA gProcScr_PhaseIntroSquares[] = {
    PROC_CALL(PhaseIntroSquares_Init),
    PROC_REPEAT(PhaseIntroSquares_InLoop),
    PROC_REPEAT(PhaseIntroSquares_OutLoop),
    PROC_END
};

struct ProcCmd CONST_DATA gProcScr_PhaseIntroBlendBox[] = {
    PROC_CALL(PhaseIntroBlendBox_Init),
    PROC_REPEAT(PhaseIntroBlendBox_InLoop),
    PROC_REPEAT(PhaseIntroBlendBox_OutLoop),
    PROC_END
};

struct ProcCmd CONST_DATA ProcScr_PhaseIntro[] = {
    PROC_CALL(PhaseIntro_EndIfNoUnits),
    PROC_CALL(PhaseIntro_InitGraphics),
    PROC_START_CHILD(gProcScr_PhaseIntroText),
    PROC_START_CHILD(gProcScr_PhaseIntroSquares),
    PROC_START_CHILD(gProcScr_PhaseIntroBlendBox),
    PROC_CALL(PhaseIntro_InitDisp),
    PROC_REPEAT(PhaseIntro_WaitForEnd),
    PROC_CALL(StartMapSongBgm),
    PROC_END
};


/* section.text */

void PhaseIntroVMatchHi()
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.altBlendBCa;
    REG_BLDCB = gBmSt.altBlendBCb;

    SetNextVCount(72);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchMid);
}

void PhaseIntroVMatchMid()
{
    REG_BLDCNT = BLDCNT_TGT1_BG0
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG1 | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.altBlendACa;
    REG_BLDCB = gBmSt.altBlendACb;

    SetNextVCount(96);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchLo);
}

void PhaseIntroVMatchLo()
{
    REG_BLDCNT = BLDCNT_TGT1_BG1
               | BLDCNT_EFFECT_BLEND
               | BLDCNT_TGT2_BG2 | BLDCNT_TGT2_BG3 | BLDCNT_TGT2_OBJ
               | BLDCNT_TGT2_BD;

    REG_BLDCA = gBmSt.altBlendBCa;
    REG_BLDCB = gBmSt.altBlendBCb;

    SetNextVCount(0);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchHi);
}

void PhaseIntroText_PutText(struct PhaseIntroSubProc *proc)
{
    u16 *tm = TILEMAP_LOCATED(gBG0TilemapBuffer, 0, 9);
    int i;

    for (i = 0; i < 0x60; ++i)
        *tm++ = TILEREF(BGCHR_PHASE_CHANGE_NAME + i, BGPAL_PHASE_CHANGE);

    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PhaseIntroInitText(struct PhaseIntroSubProc *proc)
{
    if (GetCurrentBgmSong() != GetCurrentMapMusicIndex())
        Sound_FadeOutBGM(4);

    PlaySoundEffect(0x73);

    proc->timer = 15;
}

void PhaseIntroText_InLoop(struct PhaseIntroSubProc *proc)
{
    int lo, hi;

    if (0 != CheckInLinkArena()) {
        hi = 0;
        lo = -0x14;
    } else {
        hi = -8;
        lo = -0x1C;
    }

    BG_SetPosition(0, Interpolate(INTERPOLATE_RCUBIC, lo, hi, proc->timer, 0x10), 0);

    gBmSt.altBlendACa++;
    gBmSt.altBlendACb--;

    proc->timer--;

    if (proc->timer < 0)
    {
        proc->timer = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroText_OutLoop(struct PhaseIntroSubProc *proc)
{
    int lo, hi;

    if (0 != CheckInLinkArena()) {
        hi = -0x14;
        lo = -0x30;
    } else {
        hi = -0x1C;
        lo = -0x38;
    }

    BG_SetPosition(0, Interpolate(INTERPOLATE_CUBIC, lo, hi, proc->timer, 0x10), 0);

    gBmSt.altBlendACa--;
    gBmSt.altBlendACb++;

    proc->timer--;

    if (proc->timer < 0)
    {
        proc->timer = 15;
        Proc_Break(proc);
    }
}

void PhaseIntroClearText(struct PhaseIntroSubProc *proc)
{
    BG_Fill(gBG0TilemapBuffer, 0);
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

void PhaseIntroUnk_Init(struct PhaseIntroSubProc *proc)
{
    proc->timer = 0;
    proc->stat_index = 0;
}

void PhaseIntroUnk_Loop(struct PhaseIntroSubProc *proc)
{
    int val;

    switch (proc->stat_index) {
    case 0:
        val = Interpolate(INTERPOLATE_RSQUARE, 0x10, 0x100, proc->timer, 0xF);
        
        if (proc->timer > 0xE) {
            proc->timer = 0;
            proc->stat_index++;
        } else {
            proc->timer++;
        }
        break;

    case 1:
        val = 0x100;

        if (proc->timer <= 0x1D) {
            proc->timer++;
        } else {
            proc->timer = 0;
            proc->stat_index++;
        }
        break;

    case 2:
        val = Interpolate(INTERPOLATE_CUBIC, 0x100, 0x10, proc->timer, 0xF);

        if (proc->timer <= 0xE)
            proc->timer++;
        else
            Proc_Break(proc);
        break;
    
    default:
        break;
    }

    SetObjAffine(
        0,
        Div(COS(0) * 0x10, 0x100),
        Div(-SIN(0) * 0x10, val),
        Div(SIN(0) * 0x10, 0x100),
        Div(COS(0) * 0x10, val)
    );

    PutSpriteExt(
        2, 0, 0x44,
        obj_0859AEC8,
        0x2600
    );
}

void PhaseIntroSquares_Init(struct PhaseIntroSubProc *proc)
{
    proc->timer = 0x4;
}

void PhaseIntroSquares_InLoop(struct PhaseIntroSubProc *proc)
{
    int x, y;

    for (y = 10 - 1; y >= 0; --y) {
        for (x = 15 - 1; x >= 0; --x) {
            int val = (x - proc->timer) + (0x15 - y);
            int newX, newY;
            if (val > 0x10)
                val = 0x10;

            if (val < 0x0)
                val = 0x0;

            val = (0x10 - val) & 0xFE;

            newX = x * 2;
            newY = y * 2;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX+0, y*2+0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX+1, y*2+0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX+0, y*2+1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE);
            gBG1TilemapBuffer[TILEMAP_INDEX(newX+1, y*2+1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE);

        }
    }

    proc->timer++;

    BG_EnableSyncByMask(BG1_SYNC_BIT);

    if (0x22 == proc->timer) {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void PhaseIntroSquares_OutLoop(struct PhaseIntroSubProc *proc)
{
    int ix, iy;

    for (iy = 10-1; iy >= 0; --iy)
    {
        for (ix = 15-1; ix >= 0; --ix)
        {
            int val = (1 - proc->timer) + (10 + ix) + (10 - iy);
            int newX, newY;

            if (val > 0x10)
                val = 0x10;

            if (val < 0)
                val = 0;

            val = val & 0xFE;

            newX = ix * 2;
            newY = iy * 2;

            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, iy * 2 + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x01, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, iy * 2 + 0)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x00, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 0, iy * 2 + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x21, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
            gBG1TilemapBuffer[TILEMAP_INDEX(newX + 1, iy * 2 + 1)] =
                TILEREF(BGCHR_PHASE_CHANGE_SQUARES + val + 0x20, BGPAL_PHASE_CHANGE) + TILE_HFLIP;
        }

    }

    proc->timer++;

    BG_EnableSyncByMask(0x2);

    if (proc->timer == 0x24)
    {
        proc->timer = 0;
        Proc_Break(proc);
    }
}

void PhaseIntroBlendBox_Init(struct PhaseIntroSubProc *proc)
{
    proc->timer = 4;
}

void PhaseIntroBlendBox_InLoop(struct PhaseIntroSubProc *proc)
{
    int yoff, blend;

    yoff = Interpolate(INTERPOLATE_RCUBIC, 16, 60, proc->timer, 0x20);

    SetWin0Box(0, 8 + yoff, DISPLAY_WIDTH, -0x60 - yoff);

    blend = Interpolate(INTERPOLATE_LINEAR, 0, 7, proc->timer, 0x20);

    gBmSt.altBlendBCa = blend;
    gBmSt.altBlendBCb = 0x10 - blend;

    proc->timer++;

    if (proc->timer == 0x20)
        Proc_Break(proc);
}

void PhaseIntroBlendBox_OutLoop(struct PhaseIntroSubProc *proc)
{
    int yoff, blend;

    yoff = Interpolate(INTERPOLATE_RCUBIC, 0, 60, proc->timer, 0x20);

    SetWin0Box(0, 8 + yoff, DISPLAY_WIDTH, -0x60 - yoff);

    blend = Interpolate(INTERPOLATE_LINEAR, 0, 7, proc->timer, 0x20);

    gBmSt.altBlendBCa = blend;
    gBmSt.altBlendBCb = 0x10 - blend;

    proc->timer--;

    if (proc->timer < 0)
        Proc_Break(proc);
}

void PhaseIntro_EndIfNoUnits(ProcPtr proc)
{
    if (GetPhaseAbleUnitCount(gPlaySt.faction) == FACTION_BLUE)
        Proc_End(proc);
}

void PhaseIntro_InitGraphics(ProcPtr proc)
{
    Decompress(Img_PhaseChangeUnk, BG_CHR_ADDR(0xA00));
    Decompress(Img_PhaseChangeSquares, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_SQUARES));

    BG_SetPosition(0, 0, 0);
    BG_SetPosition(1, 0, 0);
    BG_SetPosition(2, 0, 0);

    switch (gPlaySt.faction)
    {

    case FACTION_BLUE:
        Decompress(Img_PhaseChangePlayer, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_NAME));
        ApplyPalette(Pal_PhaseChangePlayer, BGPAL_PHASE_CHANGE);
        ApplyPalette(Pal_PhaseChangePlayer, 18);
        break;

    case FACTION_RED:
        Decompress(Img_PhaseChangeEnemy, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_NAME));
        ApplyPalette(Pal_PhaseChangeEnemy, BGPAL_PHASE_CHANGE);
        ApplyPalette(Pal_PhaseChangeEnemy, 18);
        break;

    case FACTION_GREEN:
        Decompress(Img_PhaseChangeOther, BG_CHR_ADDR(BGCHR_PHASE_CHANGE_NAME));
        ApplyPalette(Pal_PhaseChangeOther, BGPAL_PHASE_CHANGE);
        ApplyPalette(Pal_PhaseChangeOther, 18);
        break;

    }
#ifdef EUROPE
    asm("NOP\nNOP\nNOP\nNOP\nNOP\nNOP\nNOP\nNOP\n");
    asm("NOP\nNOP\nNOP\nNOP\n");
#endif
}

void PhaseIntro_InitDisp(ProcPtr proc)
{
    SetWinEnable(1, 0, 0);

    SetWin0Box(0, 0, DISPLAY_WIDTH, DISPLAY_HEIGHT);

    SetWin0Layers(1, 0, 1, 1, 1);
    SetWOutLayers(1, 1, 1, 1, 1);

    gLCDControlBuffer.wincnt.win0_enableBlend = 1;
    gLCDControlBuffer.wincnt.wout_enableBlend = 1;

    gBmSt.altBlendBCa = 0;
    gBmSt.altBlendBCb = 0x10;

    gBmSt.altBlendACa = 0;
    gBmSt.altBlendACb = 0x10;

    SetBlendConfig(1, gBmSt.altBlendBCa, gBmSt.altBlendBCb, 0);

    SetBlendTargetA(0, 1, 0, 0, 0);
    SetBlendTargetB(0, 0, 1, 1, 1);

    SetLCDVCountSetting(0);
    SetInterrupt_LCDVCountMatch(PhaseIntroVMatchHi);
}

void PhaseIntro_WaitForEnd(ProcPtr proc)
{
    SetBlendConfig(1, gBmSt.altBlendBCa, gBmSt.altBlendBCb, 0);

    if (Proc_Find(gProcScr_PhaseIntroText) == NULL && Proc_Find(gProcScr_PhaseIntroSquares) == NULL && Proc_Find(gProcScr_PhaseIntroBlendBox) == NULL)
    {
        ClearBg0Bg1();

        SetInterrupt_LCDVCountMatch(NULL);

        BG_SetPosition(0, 0, 0);
        BG_SetPosition(1, 0, 0);
        BG_SetPosition(2, 0, 0);

        Proc_Break(proc);
    }
}
