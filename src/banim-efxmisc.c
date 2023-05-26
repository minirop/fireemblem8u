#include "global.h"
#include "anime.h"
#include "ekrbattle.h"
#include "efxbattle.h"
#include "efxmagic.h"
#include "hardware.h"
#include "proc.h"
#include "ctc.h"
#include "constants/terrains.h"

extern struct Anim *gAnims[4];

/**
 * Misc banim effects
 */

/**
 * C26: banim_code_toss_sword
 * C27: banim_code_toss_shield
 */
void NewEfxYushaSpinShield(struct Anim *anim, int r1)
{
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxYushaSpinShield, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;
    NewEfxYushaSpinShieldOBJ(anim, r1);
}

void EfxYushaSpinShieldMain(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxYushaSpinShieldOBJ(struct Anim *anim, int r1)
{
    u32 *scr1, *scr2;
    struct ProcEfxOBJ *proc;
    struct Anim *anim2;

    proc = Proc_Start(ProcScr_efxYushaSpinShieldOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk29 = r1;

    if (r1 == 0) {
        scr1 = gUnknown_085EAB58;
        scr2 = gUnknown_085EBDF8;
    } else {
        scr1 = gUnknown_085ED0C8;
        scr2 = gUnknown_085EE398;
    }

    anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    /**
     * oam2_data::chr = 0;
     * oam2_data::pal = 0;
     */
    anim2->oam2Base &= 0xC00;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7200; /* oam2_data::chr = 0x7200; */
    else
        anim2->oam2Base |= 0x9300; /* oam2_data::chr = 0x9300; */
}

void efxYushaSpinShieldOBJ_806CD14(struct ProcEfxOBJ *proc)
{
    u32 *scr;
    struct Anim *anim2 = proc->anim2;
    if (++proc->timer != 0x45)
        return;
    
    if (proc->unk29 == 0) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EBEFC;
            anim2->pScrCurrent = gUnknown_085EBEFC;
        } else {
            anim2->pScrStart = gUnknown_085EAC5C;
            anim2->pScrCurrent = gUnknown_085EAC5C;
        }
    } else {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EE49C;
            anim2->pScrCurrent = gUnknown_085EE49C;
        } else {
            anim2->pScrStart = gUnknown_085ED1CC;
            anim2->pScrCurrent = gUnknown_085ED1CC;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CD7C(struct ProcEfxOBJ *proc)
{
#if NONMATCHING
    int state3;
#else
    register int state3 asm("r2");
#endif

    state3 = proc->anim->state3;

    if (!(state3 & 0x4))
        return;
    
    if (!(state3 & 0x8))
        return;

    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CDA4(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;

    if (sub_80522CC() != true)
        return;

    if (proc->unk29 == 0) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EBF24;
            anim2->pScrCurrent = gUnknown_085EBF24;
        } else {
            anim2->pScrStart = gUnknown_085EAC84;
            anim2->pScrCurrent = gUnknown_085EAC84;
        }
    } else {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L) {
            anim2->pScrStart = gUnknown_085EE4C4;
            anim2->pScrCurrent = gUnknown_085EE4C4;
        } else {
            anim2->pScrStart = gUnknown_085ED1F4;
            anim2->pScrCurrent = gUnknown_085ED1F4;
        }
    }

    anim2->timer = 0;
    proc->timer = 0;
    Proc_Break(proc);
}

void efxYushaSpinShieldOBJ_806CE08(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0x14) {
        proc->timer = 0;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C2C: banim_code_effect_sealed_sword_fire
 */
void NewEfxHurtmutEff00(struct Anim *anim)
{
    struct ProcEfx *proc;

    if (gEfxBgSemaphore != 0)
        return;
    
    proc = Proc_Start(ProcScr_efxHurtmutEff00, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    if (gEkrDistanceType == EKR_POS_L)
        NewEfxHurtmutEff00OBJ(anim);
    else
        NewEfxHurtmutEff01OBJ(anim);
}

void EfxHurtmutEff00Main(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxHurtmutEff00OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff00OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxAnimCreate(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff00OBJ_806CEC4(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E15F4;
        anim2->pScrCurrent = gUnknown_085E15F4;
    } else {
        anim2->pScrStart = gUnknown_085E1960;
        anim2->pScrCurrent = gUnknown_085E1960;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DE984, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF10(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E1C48;
        anim2->pScrCurrent = gUnknown_085E1C48;
    } else {
        anim2->pScrStart = gUnknown_085E1EA4;
        anim2->pScrCurrent = gUnknown_085E1EA4;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DF224, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff00OBJ_806CF5C(struct ProcEfxOBJ *proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}

void NewEfxHurtmutEff01OBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxHurtmutEff01OBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->anim2 = EfxAnimCreate(anim, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90, FramScr_Unk5D4F90);
}

void efxHurtmutEff01OBJ_806CFC4(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E163C;
        anim2->pScrCurrent = gUnknown_085E163C;
    } else {
        anim2->pScrStart = gUnknown_085E19A8;
        anim2->pScrCurrent = gUnknown_085E19A8;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DE984, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D010(struct ProcEfxOBJ *proc)
{
    struct Anim *anim2 = proc->anim2;
    if (GetAISSubjectId(proc->anim) == EKR_POS_R) {
        anim2->pScrStart = gUnknown_085E1C58;
        anim2->pScrCurrent = gUnknown_085E1C58;
    } else {
        anim2->pScrStart = gUnknown_085E1EB4;
        anim2->pScrCurrent = gUnknown_085E1EB4;
    }

    anim2->timer = 0;

    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DFA08, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DF224, 0x1000);
    Proc_Break(proc);
}

void efxHurtmutEff01OBJ_806D05C(struct ProcEfxOBJ *proc)
{
    gEfxBgSemaphore--;
    AnimDelete(proc->anim2);
    Proc_Break(proc);
}


/**
 * C2E: banim_code_effect_magic_rune_normal
 * C2F: banim_code_effect_magic_rune_critical
 */
void NewEfxMagfcast(struct Anim *anim, int type)
{
    s16 id2;    /* maybe not the class index */
    struct ProcEfx *proc;

    if (gEfxBgSemaphore != 0)
        return;

    ClearBG1Setup();
    proc = Proc_Start(ProcScr_efxMagfcast, PROC_TREE_3);

    proc->anim = anim;
    proc->timer = 0;

    id2 = gEkrPairBanimID2[GetAISSubjectId(anim)] - 0x6A;
    switch (id2) {
    case 0x0:
    case 0x1:
    case 0x2A:
        NewEfxMagfcastBG(proc->anim, type);
        break;

    /* Just for switch case align */
    case 2:
    case 3:
    case 4:
    case 5:
    default:
        NewEfxMagfcastBG(proc->anim, type + 2);
        break;
    }
}

void EfxMagfcastMain(struct ProcEfx *proc)
{
    if (++proc->timer == 0x14)
        Proc_Break(proc);
}

void NewEfxMagfcastBG(struct Anim *anim, u32 type)
{
    struct ProcEfxBG *proc;
    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxMagfcastBG, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->frame = 0;

    switch (type) {
    case 0:
        proc->frame_config = gUnknown_080DF386;
        proc->unk4C = gUnknown_085D8FC4;
        proc->unk50 = gUnknown_085D8FC4;
        break;

    case 1:
        proc->frame_config = gUnknown_080DF39C;
        proc->unk4C = gUnknown_085D8FC4;
        proc->unk50 = gUnknown_085D8FC4;
        break;

    case 2:
        proc->frame_config = gUnknown_080DF3A2;
        proc->unk4C = gUnknown_085D8FDC;
        proc->unk50 = gUnknown_085D8FDC;
        break;

    case 3:
        proc->frame_config = gUnknown_080DF3C4;
        proc->unk4C = gUnknown_085D8FDC;
        proc->unk50 = gUnknown_085D8FDC;
        EfxPlaySEwithCmdCtrl(anim, anim->commandQueue[anim->commandQueueSize - 1]);
        break;

    default:
        break;
    }

    SomeImageStoringRoutine_SpellAnim2(gUnknown_085EE4F8, 0x2000);
    SomePaletteStoringRoutine_SpellAnim2(gUnknown_085EF24C, 0x20);
    sub_80551B0();

    if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
        if (GetAISSubjectId(proc->anim) == EKR_POS_L)
            BG_SetPosition(BG_1, 0x18, 0x0);
        else
            BG_SetPosition(BG_1, 0xE8, 0x0);
    }
}

void EfxMagfcastBGMain(struct ProcEfxBG *proc)
{
    s16 ret;
    ret = EfxGetNextFrameIndex(
        (void *)&proc->timer,
        (void *)&proc->frame,
        proc->frame_config
    );

    if (ret >= 0) {
        u16 **tsa1;
        u16 **tsa2;

        if (gEkrDistanceType != EKR_DISTANCE_CLOSE) {
            if (GetAISSubjectId(proc->anim) == EKR_POS_L)
                BG_SetPosition(BG_1, 0x18, 0x0);
            else
                BG_SetPosition(BG_1, 0xE8, 0x0);
        }

        tsa1 = proc->unk4C;
        tsa2 = proc->unk50;

        sub_8055670(
            proc->anim,
            tsa1[ret],
            tsa2[ret]
        );

        return;
    }

    if (ret == -1) {
        ClearBG1();
        gEfxBgSemaphore--;
        SetDefaultColorEffects_();
        Proc_End(proc);
    }
}

/**
 * C30: banim_code_effect_dirt_kick
 * C31: banim_code_effect_dirt_wave_small
 * C32: banim_code_effect_dirt_wave_medium
 */

void NewEfxSunakemuri(struct Anim *anim, int type)
{
    struct ProcEfx *proc;

    if (gEfxBgSemaphore == 0) {
        proc = Proc_Start(ProcScr_efxSunakemuri, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxSunakemuriOBJ(anim, type);
    }
}

void EfxSunakemuriMain(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxSunakemuriOBJ(struct Anim *anim, int type)
{
    int terrain;
    u32 *scr1, *scr2;
    struct ProcEfxOBJ *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxSunakemuriOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = gUnknown_085F1710;
    if (type != 0) {
        scr1 = gUnknown_085F19A0;
        if (type == 1)
            scr1 = gUnknown_085F1858;
    }

    scr2 = gUnknown_085F17B4;
    if (type != 0) {
        scr2 = gUnknown_085F1A44;
        if (type == 1)
            scr2 = gUnknown_085F18FC;
    }

    proc->anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);

    terrain = gEkrPairTerrainID[GetAISSubjectId(proc->anim)];
    switch (terrain) {
    case TERRAIN_PLAINS:
    case TERRAIN_ROAD:
    case TERRAIN_VILLAGE_03:
    case TERRAIN_VILLAGE_04:
    case TERRIAN_HOUSE:
    case TERRAIN_FORT:
    case TERRAIN_FOREST:
    case TERRAIN_THICKET:
    case TERRAIN_SAND:
    case TERRAIN_DESERT:
    case TERRAIN_MOUNTAIN:
    case TERRAIN_PEAK:
    case TERRAIN_BRIDGE_13:
    case TERRAIN_FENCE_19:
    case TERRAIN_WALL_1A:
    case TERRAIN_WALL_1B:
    case TERRAIN_RUBBLE:
    case TERRAIN_ROOF:
    case TERRAIN_GATE_23:
    case TERRAIN_RUINS_25:
    case TERRAIN_CLIFF:
    case TERRAIN_BALLISTA_REGULAR:
    case TERRAIN_BALLISTA_LONG:
    case TERRAIN_BALLISTA_KILLER:
    case TERRAIN_SHIP_FLAT:
    case TERRAIN_SHIP_WRECK:
    case TERRAIN_GLACIER:
    case TERRAIN_SNAG:
    case TERRAIN_INN:
    case TERRAIN_BARREL:
    case TERRAIN_BONE:
    case TERRAIN_DARK:
    case TERRAIN_GUNNELS:
    case TERRAIN_BRACE:
    case TERRAIN_MAST:
        SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1620, 0x20);
        break;
    
    case TERRAIN_BRIDGE_14:
        if (sub_80723A4(proc->anim) != EKR_POS_L)
            SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1620, 0x20);
        else
            SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1640, 0x20);
        break;

    case TERRAIN_RIVER:
    case TERRAIN_SEA:
    case TERRAIN_LAKE:
    case TERRAIN_DEEPS:
    case TERRAIN_WATER:
        SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1640, 0x20);
        break;

    case TERRAIN_ARMORY:
    case TERRAIN_VENDOR:
    case TERRAIN_ARENA_08:
    case TERRAIN_C_ROOM_09:
    case TERRAIN_GATE_0B:
    case TERRAIN_FLOOR_17:
    case TERRAIN_FLOOR_18:
    case TERRAIN_PILLAR:
    case TERRAIN_DOOR:
    case TERRAIN_THRONE:
    case TERRAIN_CHEST_20:
    case TERRAIN_CHEST_21:
    case TERRAIN_CHURCH:
    case TERRAIN_STAIRS:
    case TERRAIN_ARENA_30:
    case TERRAIN_VALLEY:
    case TERRAIN_FENCE_32:
    case TERRAIN_RUINS_37:
    case TERRAIN_DECK:
        SomePaletteStoringRoutine_SpellAnim(gUnknown_085F1660, 0x20);
        break;

    case TERRAIN_TILE_00:
    default:
        break;
    }

    SomeImageStoringRoutine_SpellAnim(gUnknown_085F11B0, 0x1000);
}

void EfxSunakemuriOBJMain(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0x9) {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C4E: banim_code_effect_dirt_wave
 */
void NewEfxLokmsuna(struct Anim *anim)
{
    struct ProcEfx *proc;

    if (gEfxBgSemaphore == 0) {
        proc = Proc_Start(ProcScr_efxLokmsuna, PROC_TREE_3);
        proc->anim = anim;
        proc->timer = 0;
        NewEfxLokmsunaOBJ(anim);
    }
}

void EfxLokmsunaMain(struct ProcEfx *proc)
{
    Proc_Break(proc);
}

void NewEfxLokmsunaOBJ(struct Anim *anim)
{
    u32 *scr1, *scr2;
    struct Anim *anim2;
    struct ProcEfxOBJ *proc;

    gEfxBgSemaphore++;
    proc = Proc_Start(ProcScr_efxLokmsunaOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;

    scr1 = gUnknown_087584B8;
    scr2 = gUnknown_087585DC;
    anim2 = EfxAnimCreate(anim, scr2, scr1, scr2, scr1);
    proc->anim2 = anim2;

    /* oam2_data::pal = 0 */
    anim2->oam2Base &= 0xFFF;

    if (GetAISSubjectId(anim) == EKR_POS_L)
        anim2->oam2Base |= 0x7000;
    else
        anim2->oam2Base |= 0x9000;
    
    SomeImageStoringRoutine_SpellAnim(gUnknown_08758218, 0x1000);
}

void EfxLokmsunaIOBJMain(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0xF) {
        gEfxBgSemaphore--;
        AnimDelete(proc->anim2);
        Proc_Break(proc);
    }
}

/**
 * C39: banim_code_hit_fake
 */
void NewEfxKingPika(struct Anim *anim)
{
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxKingPika, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxKingPikaMain(struct ProcEfx *proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        NewEfxFlashUnit(anim, 0x1, 0x28, 0x0);
        return;
    }

    if (time == 0xA) {
        StartSpellBG_FLASH(anim, 0x14);
        return;
    }

    if (time == 0x2D) {
        struct Anim *anim1 = gAnims[GetAISSubjectId(anim) * 2];
        struct Anim *anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

        anim1->state3 |= 0x40;
        anim2->state3 |= 0x40;
        Proc_Break(proc);
    }
}

/**
 * C51: banim_code_flash_white
 */
void NewEfxFlashFX(struct Anim *anim)
{
    struct ProcEfx *proc;
    proc = Proc_Start(ProcScr_efxFlashFX, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
}

void EfxFlashFXMain(struct ProcEfx *proc)
{
    struct Anim *anim = proc->anim;
    int time = ++proc->timer;

    if (time == 0x1) {
        StartSpellBG_FLASH(anim, 0x5);
        return;
    }

    if (time == 0x6) {
        struct Anim *anim1 = gAnims[GetAISSubjectId(anim) * 2];
        struct Anim *anim2 = gAnims[GetAISSubjectId(anim) * 2 + 1];

        anim1->state3 |= 0x40;
        anim2->state3 |= 0x40;
        Proc_Break(proc);
    }
}

/**
 * Maybe unused banim commands?
 */
void NewEfxSongOBJ2(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxSongOBJ2, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0x28;
    proc->anim2 = EfxAnimCreate(anim, gUnknown_085DD4B4, gUnknown_085DD4B4, gUnknown_085DD4B4, gUnknown_085DD4B4);
    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DCC84, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DCB10, 0x1000);
    EkrSoundSomeBark(0xEE, 0x100, proc->anim->xPosition, 0x1);
}

void EfxSongOBJ2Main(struct ProcEfxOBJ *proc)
{
    if (++proc->timer == 0x18)
        EkrSoundSomeBark(0xEE, 0x100, proc->anim->xPosition, 0x1);

    if (proc->timer > proc->unk2E) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}

void NewEfxDanceOBJ(struct Anim *anim)
{
    struct ProcEfxOBJ *proc;
    gEfxBgSemaphore++;

    proc = Proc_Start(ProcScr_efxDanceOBJ, PROC_TREE_3);
    proc->anim = anim;
    proc->timer = 0;
    proc->unk2E = 0x19;
    proc->anim2 = EfxAnimCreate(anim, gUnknown_085DD484, gUnknown_085DD484, gUnknown_085DD484, gUnknown_085DD484);
    SomePaletteStoringRoutine_SpellAnim(gUnknown_085DCC84, 0x20);
    SomeImageStoringRoutine_SpellAnim(gUnknown_085DCB10, 0x1000);
    EkrSoundSomeBark(0xE1, 0x100, proc->anim->xPosition, 0x1);
}

void EfxDanceOBJMain(struct ProcEfxOBJ *proc)
{
    if (++proc->timer > proc->unk2E) {
        AnimDelete(proc->anim2);
        gEfxBgSemaphore--;
        Proc_Break(proc);
    }
}
