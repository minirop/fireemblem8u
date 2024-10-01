#include "global.h"
#include "fontgrp.h"

void PrintDebugBuildDateAndTime(u16 *bg)
{
    PrintDebugStringToBG(bg, gBuildDateTime);
#ifdef EUROPE
    PrintDebugStringToBG(bg - 0x40, gProjectInternalTitle); // subtract to print to the line above.
#else
    PrintDebugStringToBG(bg - 0x20, gYearProjectCreated); // subtract to print to the line above.
#endif
}
