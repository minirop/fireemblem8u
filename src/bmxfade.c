#include "global.h"

#include "hardware.h"
#include "proc.h"
#include "bm.h"

void SetAllUnitNotBackSprite();

struct BmxfadeProc {
    PROC_HEADER;

    /* 29 */ u8 _pad29[0x4C - 0x29];
    /* 4C */ s16 counter;
    /* 4E */ s16 game_lock;
};

void bmxfade_init(struct BmxfadeProc *proc);
void bmxfade_loop(struct BmxfadeProc *proc);
void Destruct6CBMXFADE(struct BmxfadeProc *proc);

struct ProcCmd CONST_DATA sProcScr_BMXFADE[] = {
    PROC_NAME("BMXFADE"),
    PROC_END_IF_DUPLICATE,
    PROC_SET_END_CB(Destruct6CBMXFADE),
    PROC_CALL(bmxfade_init),
    PROC_CALL(bmxfade_loop),
    PROC_REPEAT(bmxfade_loop),
    PROC_END,
};

void bmxfade_init(struct BmxfadeProc *proc)
{
    proc->counter = 0x10;

    InitBmBgLayers();

    SetBlendTargetA(0, 0, 1, 0, 0);
    SetBlendTargetB(0, 0, 0, 1, 1);
}

void bmxfade_loop(struct BmxfadeProc *proc)
{
    SetBlendConfig(1, proc->counter, 0x10 - proc->counter, 0);

    if (--proc->counter >= 0)
        return;

#ifdef EUROPE
    asm("NOP\nNOP\nNOP\nNOP\n");
#else
    Proc_Break(proc);
#endif
    SetDefaultColorEffects();
    SetBackgroundTileDataOffset(2, 0);
    BG_Fill(gBG2TilemapBuffer, 0);
    BG_EnableSyncByMask(4);
}

void Destruct6CBMXFADE(struct BmxfadeProc *proc)
{
    SetAllUnitNotBackSprite();

    if (0 != proc->game_lock)
        UnlockGame();
}

void NewBMXFADE(s8 lock_game)
{
    struct BmxfadeProc *proc = Proc_Start(sProcScr_BMXFADE, PROC_TREE_3);
#ifdef EUROPE
    asm("NOP\nNOP\n");
#else
    proc->game_lock = lock_game;
#endif

    if (0 != lock_game)
        LockGame();
}

void MakeNew6CBMXFADE2(s8 lock_game, ProcPtr parent)
{
    struct BmxfadeProc *proc = 
        Proc_StartBlocking(sProcScr_BMXFADE, parent);
   #ifdef EUROPE
    asm("NOP\nNOP\n");
#else 
    proc->game_lock = lock_game;
#endif

    if (0 != lock_game)
        LockGame();
}

bool8 DoesBMXFADEExist(void)
{
    return Proc_Find(sProcScr_BMXFADE)
            ? 1
            : 0;
}
