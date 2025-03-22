#pragma once

#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "eventcall.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "worldmap.h"
#include "constants/characters.h"
#include "constants/classes.h"
#include "constants/worldmap.h"
#include "constants/songs.h"

CONST_DATA EventScr EventScrWM_Prologue_Beginning[] = {
    EVBIT_MODIFY(0x1)
    WmEvtNoFade // ENOSUPP in EAstdlib
    WM_SPAWNLORD(WM_MU_0, CHARACTER_EIRIKA, WM_NODE_BorderMulan)
    WM_CENTERCAMONLORD(WM_MU_0)
    MUSCFAST(SONG_SILENT)
    STAL(32)
    MUSC(SONG_THE_BEGINNING)
    WM_SHOWDRAWNMAP(0, 0, 0x10)
    STAL(2)
    WM_FADEOUT(0)
    WM_TEXTDECORATE // WaitFade
    EVBIT_MODIFY(0x0)
    STAL(60)
    WM_SHOWTEXTWINDOW(40, 0x0001)
    WM_WAITFORTEXT
    WM_TEXTSTART
    WM_TEXT(0x08DB, 0)

    // wait for talk locked
    TEXTEND
    WM_MOVECAM2(0, 0, 0, 24, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0051, 0x02BC, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Renais)
    TEXTCONT

    // wait for talk locked
    TEXTEND
    STAL(30)
    WM_HIGHLIGHTCLEAR1(WM_NATION_Renais)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Renais)
    WM_CLEARPORTRAIT(0, 0x0100, 0)
    STAL(32)
    WM_MOVECAM2(0, 24, 0, -8, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0052, 0x02BC, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Frelia)
    TEXTCONT

    // wait for talk locked
    TEXTEND
    STAL(30)
    WM_HIGHLIGHTCLEAR1(WM_NATION_Frelia)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Frelia)
    WM_CLEARPORTRAIT(0, 0x0100, 0)
    STAL(32)
    WM_MOVECAM2(0, -8, 0, 30, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0056, 0x0534, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Jehanna)
    TEXTCONT

    // wait for talk locked
    TEXTEND
    STAL(30)
    WM_HIGHLIGHTCLEAR1(WM_NATION_Jehanna)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Jehanna)
    WM_CLEARPORTRAIT(0, 0x0200, 0)
    STAL(32)
    WM_MOVECAM2(0, 30, 0, -8, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0053, 0x0534, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Rausten)
    TEXTCONT

    // wait for talk locked
    TEXTEND
    STAL(30)
    WM_HIGHLIGHTCLEAR1(WM_NATION_Rausten)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Rausten)
    WM_CLEARPORTRAIT(0, 0x0200, 0)
    STAL(32)
    WM_MOVECAM2(0, -8, 0, 48, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0040, 0x02BC, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Grado)
    TEXTCONT

    // wait for talk locked
    TEXTEND
    STAL(30)
    WM_HIGHLIGHTCLEAR1(WM_NATION_Grado)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Grado)
    WM_CLEARPORTRAIT(0, 0x0100, 0)
    STAL(32)
    TEXTCONT

    // wait for talk locked
    TEXTEND
    STAL(30)
    WM_MOVECAM2(0, 48, 0, 0, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0054, 0x02BC, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Carcino)
    TEXTCONT

    // wait for talk locked
    TEXTEND
    STAL(30)
    WM_HIGHLIGHTCLEAR1(WM_NATION_Carcino)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Carcino)
    WM_CLEARPORTRAIT(0, 0x0100, 0)
    STAL(32)
    TEXTCONT
    TEXTEND
    STAL(30)
    TEXTCONT
    TEXTEND
    STAL(30)
    TEXTCONT
    TEXTEND
    STAL(30)
    WM_MOVECAM2(0, 0, 0, 48, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0040, 0x02BC, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Grado)
    TEXTCONT
    TEXTEND
    TEXTCONT
    TEXTEND
    WM_HIGHLIGHTCLEAR1(WM_NATION_Grado)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Grado)
    WM_CLEARPORTRAIT(0, 0x0100, 0)
    STAL(32)
    WM_MOVECAM2(0, 48, 0, 24, 60, 0)
    STAL(60)
    WM_SHOWPORTRAIT(0, 0x0051, 0x02BC, 0)
    STAL(6)
    STAL(26)
    WM_HIGHLIGHT(WM_NATION_Renais)
    TEXTCONT
    TEXTEND
    WM_HIGHLIGHTCLEAR1(WM_NATION_Renais)
    WM_HIGHLIGHTCLEAR2(WM_NATION_Renais)
    WM_CLEARPORTRAIT(0, 0x0100, 0)
    STAL(32)
    WM_MOVECAM2(0, 24, 0, 40, 52, 0)
    STAL(62)
    WM_PLACEDOT(0, 0, WM_NODE_RenaisCastle, 1)
    WM_PLACEDOT(0, 1, WM_NODE_GradoKeep, 1)
    STAL(60)
    PUTSPRITE(WM_MU_2, CLASS_SOLDIER, WM_FACTION_RED, WM_NODE_GradoKeep)
    PUTSPRITE(WM_MU_3, CLASS_SOLDIER, WM_FACTION_RED, WM_NODE_GradoKeep)
    PUTSPRITE(WM_MU_4, CLASS_SOLDIER, WM_FACTION_RED, WM_NODE_GradoKeep)
    WM_PUTMOVINGSPRITE(WM_MU_2, 0, 0x73, 0x84, 0x55, 0x41, 210, 0x3, 10)
    WM_PUTMOVINGSPRITE(WM_MU_3, 0, 0x84, 0x84, 0x76, 0x57, 170, 0x3, 10)
    WM_PUTMOVINGSPRITE(WM_MU_4, 0, 0x95, 0x84, 0x86, 0x64, 150, 0x3, 10)
    STAL(20)
    TEXTCONT
    TEXTEND
    WM_WAITFORSPRITES(WM_MU_ANY)
    WM_REMSPRITE(WM_MU_2)
    WM_REMSPRITE(WM_MU_3)
    WM_REMSPRITE(WM_MU_4)
    STAL(30)
    WM_SHOWPORTRAIT(0, 0x0014, 0x0534, 0)
    STAL(6)
    STAL(60)
    PUTSPRITE(WM_MU_2, CLASS_EPHRAIM_LORD, WM_FACTION_BLUE, WM_NODE_AdlasPlains)
    WM_PUTMOVINGSPRITE(WM_MU_2, 0, 0x5c, 0x64, 0x5c, 0x6c, 180, 0x3, 16)
    TEXTCONT
    TEXTEND
    WM_WAITFORSPRITES(WM_MU_ANY)
    WM_REMSPRITE(WM_MU_2)
    WM_CLEARPORTRAIT(0, 0x0200, 0)
    STAL(46)
    PUTSPRITE(WM_MU_6, CLASS_EIRIKA_LORD, WM_FACTION_BLUE, WM_NODE_RenaisCastle)
    PUTSPRITE(WM_MU_5, CLASS_PEER, WM_FACTION_BLUE, WM_NODE_RenaisCastle)
    PUTSPRITE(WM_MU_2, CLASS_GENERAL, WM_FACTION_RED, WM_NODE_GradoKeep)
    PUTSPRITE(WM_MU_3, CLASS_MAGE_KNIGHT_F, WM_FACTION_RED, WM_NODE_GradoKeep)
    PUTSPRITE(WM_MU_4, CLASS_WYVERN_KNIGHT, WM_FACTION_RED, WM_NODE_GradoKeep)
    WM_PUTMOVINGSPRITE(WM_MU_2, 0, 0x84, 0x84, 0x6c, 0x5c, 210, 0x1, 0)
    WM_PUTMOVINGSPRITE(WM_MU_3, 0, 0x73, 0x92, 0x5b, 0x56, 210, 0x1, 0)
    WM_PUTMOVINGSPRITE(WM_MU_4, 0, 0x95, 0x92, 0x7d, 0x56, 210, 0x1, 0)
    TEXTCONT
    TEXTEND
    WM_WAITFORSPRITES(WM_MU_ANY)
    STAL(26)
    WM_PUTSPRITE(WM_MU_6, 0x63, 0x45)
    WM_PUTSPRITE(WM_MU_5, 0x6c, 0x4c)
    WM_FADEINSPRITE(WM_MU_6, 60)
    WM_FADEINSPRITE(WM_MU_5, 60)
    TEXTCONT
    TEXTEND
    WM_WAITFORSPRITELOAD
    WM_REMOVETEXT
    STAL(2)
    FADI(16)
    SKIPWN
    WM_FXCLEAR1(-0x1)
    WM_FXCLEAR2(-0x1)
    WM_REMSPRITE(WM_MU_2)
    WM_REMSPRITE(WM_MU_3)
    WM_REMSPRITE(WM_MU_4)
    WM_REMSPRITE(WM_MU_5)
    WM_REMSPRITE(WM_MU_6)
    ENDA
};

CONST_DATA EventScr EventScrWM_Prologue_ChapterIntro[] = {
    EVBIT_MODIFY(0x1)
    ENUT(137)
    ENDA
};
