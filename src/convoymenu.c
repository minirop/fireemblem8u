#include "global.h"
#include "functions.h"
#include "variables.h"
#include "proc.h"
#include "bmcontainer.h"
#include "icon.h"
#include "fontgrp.h"
#include "uimenu.h"
#include "bb.h"
#include "bmunit.h"
#include "bmmenu.h"
#include "bmitem.h"
#include "hardware.h"
#include "bmmind.h"
#include "popup.h"
#include "face.h"
#include "scene.h"
#include "helpbox.h"
#include "menuitempanel.h"
#include "prepscreen.h"

EWRAM_OVERLAY(0) u8 gConvoyItemCount = 0;

struct ProcCmd CONST_DATA gProcCmd_ConvoyMenu[] = {
    PROC_CALL_2(ConvoyMenuProc_StarMenu),
    PROC_CALL_2(ConvoyMenuProc_MenuEnd),
    PROC_SLEEP(1),
    PROC_CALL_2(ConvoyMenuProc_MaybeStartSelectConvoyItem),
    PROC_CALL_2(ConvoyMenuProc_SendToConvoyReal),

PROC_LABEL(0x63),
    PROC_CALL(ConvoyMenuProc_SetupActiveUnit),
    PROC_CALL(ConvoyMenuProc_ExecBootlegPopup),
    PROC_YIELD,
    PROC_END
};

int ConvoyMenuProc_StarMenu(ProcPtr proc)
{
    gConvoyItemCount = GetConvoyItemCount();
    LoadIconPalettes(4);

    if (HasConvoyAccess() && (gConvoyItemCount < CONVOY_ITEM_COUNT))
        StartMenu(&gSendToConvoyMenuDef, (ProcPtr)proc);
    else
        StartMenu(&gConvoyMenuDef, (ProcPtr)proc);

    return 0;
}

int ConvoyMenuProc_MenuEnd(ProcPtr proc)
{
    EndSubtitleHelp();
    EndMenuItemPanel();

    /* this should be item to be sent to convoy */
    if (0 == gBmSt.itemUnk2E) {
        Proc_Goto(proc, 0x63);
        return 1;
    }

    return 0;
}

int ConvoyMenuProc_MaybeStartSelectConvoyItem(ProcPtr proc)
{
    MaybeStartSelectConvoyItemProc(0, proc);
    return 0;
}

int ConvoyMenuProc_SendToConvoyReal(ProcPtr proc)
{
    return AddItemToConvoy(gBmSt.itemUnk2E);
}

void ConvoyMenuProc_SetupActiveUnit(ProcPtr proc)
{
    gActiveUnit = GetUnit(gActionData.subjectIndex);
}

void ConvoyMenuProc_ExecBootlegPopup(ProcPtr proc)
{
    if (HasConvoyAccess())
    {
        if (gConvoyItemCount < CONVOY_ITEM_COUNT)
            NewPopup2_SendItem(proc, gActionData.item);
        else
            NewPopup2_DropItem(proc, gActionData.item);
    }
    else
        NewPopup2_DropItem(proc, gActionData.item);
}

void HandleNewItemGetFromDrop(struct Unit* unit, int item, ProcPtr proc)
{
    u8 ret = UnitAddItem(unit, item);
    if (FALSE != ret)
        return;

    gActiveUnit = unit;
    gBmSt.um_tmp_item = item;
    StartFace(0, GetUnitPortraitId(unit), 0xB0, 4, 2);
    SetFaceBlinkControlById(0, 5);
    ForceMenuItemPanel(proc, unit, 0xF, 0xA);

    if (HasConvoyAccess() && GetConvoyItemCount() < CONVOY_ITEM_COUNT)
        /* Your inventory is full. Send an item to Supply.[.] */
        StartSubtitleHelp(proc, GetStringFromIndex(0x867));
    else
        /* Your inventory is full. Select an item to discard. */
        StartSubtitleHelp(proc, GetStringFromIndex(0x866));

    SetTalkChoiceResult(TALK_CHOICE_NO);
    Proc_StartBlocking(gProcCmd_ConvoyMenu, proc);
#ifdef EUROPE
    asm("NOP\nNOP\nNOP\nNOP\n");
#endif
}

int SendToConvoyMenu_Draw(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    return ItemSelectMenu_TextDraw(proc_menu, proc_cmd);
}

int MenuCommand_DrawExtraItem(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    u16 item = gBmSt.um_tmp_item;
    struct Text* text = &proc_cmd->text;

    Text_SetColor(text, TEXT_COLOR_SYSTEM_BLUE);
    DrawItemMenuLineNoColor(text, item,
            TILEMAP_LOCATED(gBG0TilemapBuffer, proc_cmd->xTile, proc_cmd->yTile));
    BG_EnableSyncByMask(BG0_SYNC_BIT);
}

u8 SendToConvoyMenu_NormalEffect(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    AddItemToConvoy(gActiveUnit->items[proc_cmd->itemNumber]);
    gActionData.item = gActiveUnit->items[proc_cmd->itemNumber];
    UnitRemoveItem(gActiveUnit, proc_cmd->itemNumber);
    UnitAddItem(gActiveUnit, gBmSt.um_tmp_item);
    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

u8 MenuCommand_SendItemToConvoy(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    AddItemToConvoy(gBmSt.um_tmp_item);
    gActionData.item = gBmSt.um_tmp_item;
    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}

u8 SendToConvoyMenu_Selected(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    gActionData.item = gActiveUnit->items[proc_cmd->itemNumber];
    gActionData.unk08 = proc_cmd->itemNumber;
    LoadHelpBoxGfx(NULL, -1);
    /* maybe draw hand? */
    sub_808AA04(0x8, proc_cmd->itemNumber * 0x10 + 0x20, 0x84B, proc_menu);
    return 0;
}

u8 SendToConvoyMenu_Selected2(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    gActionData.item = gBmSt.um_tmp_item;
    gActionData.unk08 = UNIT_ITEM_COUNT;
    LoadHelpBoxGfx(NULL, -1);
    /* maybe draw hand? */
    sub_808AA04(0x8, proc_cmd->itemNumber * 0x10 + 0x20, 0x84B, proc_menu);
    return 0;
}

u8 SendToConvoyMenu_Idle(struct MenuProc* proc_menu, struct MenuItemProc* proc_cmd)
{
    if (1 != GetTalkChoiceResult())
        return 0;

    gKeyStatusPtr->newKeys = 0;

    if (gActionData.unk08 < UNIT_ITEM_COUNT) {
        UnitRemoveItem(gActiveUnit, gActionData.unk08);
        UnitAddItem(gActiveUnit, gBmSt.um_tmp_item);
    }

    return MENU_ACT_ENDFACE | MENU_ACT_CLEAR | MENU_ACT_SND6A | MENU_ACT_END | MENU_ACT_SKIPCURSOR;
}
