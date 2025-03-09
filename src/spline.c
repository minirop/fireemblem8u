#include "global.h"

#include "spline.h"

//! FE8U = 0x0800A42C
int sub_800A42C(int val, int start, int end)
{
#if NONMATCHING
    int num1 = start + end;
#else
    register int num1 asm("r6") = start + end;
#endif

    if (num1 == 0)
        return val;

    if (num1 > 0x1000)
    {
        start = DivArm(num1, start * 0x1000);
        end = DivArm(num1, end * 0x1000);
    }

    num1 = DivArm(0x2000 - start - end, 0x1000000);

    if (val < start)
    {
        if (start == 0)
            start = 1;

        return DivArm(0x1000, DivArm(0x1000, DivArm(start, num1 * 0x1000) * val) * val);
    }

    if (val < (0x1000 - end))
    {
        return DivArm(0x1000, num1 * (DivArm(0x1000, val * 0x2000) - start));
    }

    val = 0x1000 - val;
    if (end == 0)
        end = 1;

    return 0x1000 - DivArm(0x1000, DivArm(0x1000, DivArm(end, num1 * 0x1000) * val) * val);
}

//! FE8U = 0x0800A4E8
void sub_800A4E8(struct UnkSplineStruct1 * src, struct UnkSplineStruct2 * dest)
{
    dest->unk_00 = src->unk_00;

    dest->unk_04 = src->unk_02;
    dest->unk_0c = src->unk_04;
    dest->unk_18 = src->unk_08;

    src++;

    dest->unk_02 = src->unk_02;
    dest->unk_08 = src->unk_04;
    dest->unk_14 = src->unk_08;

    src++;

    dest->unk_06 = src->unk_02;
    dest->unk_10 = src->unk_04;
    dest->unk_1c = src->unk_08;

    return;
}

//! FE8U = 0x0800A518
void sub_800A518(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2)
{
    int i;
    int sp_08;
    int sp_0c;
    int sp_10;

    int sp_14 = arg_0->unk_00;
    s16 * r1 = arg_0->unk_14;
    int r5 = arg_0->unk_02;
    int r3 = arg_0->unk_04;
    int r2 = arg_0->unk_06;

    int * sp_18 = arg_0->unk_08;
    int * sp_1c = arg_0->unk_0c;
    int * r9 = arg_0->unk_10;

    int r4 = 0x1000 - r1[0];
    int r8 = r1[1];
    int r7 = r1[2];

    if ((r2 == r5) || (r2 == r3))
    {
        sp_10 = 0;
    }
    else
    {
        sp_10 = DivArm(0x1000, DivArm(r2 - r3, (r5 - r3) * 0x1000) << 0xd);
    }

    r5 = (r7 > 0) ? r7 : -r7;

    sp_10 = (sp_10 + r5) - DivArm(0x1000, r5 * sp_10);
    sp_08 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r4 * (0x1000 - r7)) * (r8 + 0x1000)) << 0xb);
    sp_0c = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r4 * (r7 + 0x1000)) * (0x1000 - r8)) << 0xb);

    for (i = 0; i < sp_14; i++)
    {
        int a = sp_18[i] - sp_1c[i];
        int b = r9[i] - sp_18[i];

        *arg_1 = DivArm(0x1000, sp_10 * (DivArm(0x1000, sp_08 * a) + DivArm(0x1000, sp_0c * b)));

        if (arg_2 == 2)
        {
            *arg_1 = DivArm(0x1000, (sp_08 + sp_0c) * a);
        }
        arg_1++;
    }

    return;
}

//! FE8U = 0x0800A680
void sub_800A680(struct UnkSplineStruct2 * arg_0, int * arg_1, int arg_2)
{
    int i;
    int sp_04;
    int sp_08;
    int sp_0c;

    int sp_10 = arg_0->unk_00;
    s16 * r1 = arg_0->unk_14;
    int r4 = arg_0->unk_02;
    int r3 = arg_0->unk_04;
    int r2 = arg_0->unk_06;

    int * sp_14 = arg_0->unk_08;
    int * sp_18 = arg_0->unk_0c;
    int * r9 = arg_0->unk_10;

    int r7 = 0x1000 - r1[0];
    int r8 = r1[1];
    int r6 = r1[2];

    if ((r2 == r4) || (r2 == r3))
    {
        sp_0c = 0;
    }
    else
    {
        sp_0c = DivArm(0x1000, DivArm(r2 - r3, (r2 - r4) * 0x1000) << 0xd);
    }

    r4 = (r6 > 0) ? r6 : -r6;

    sp_0c = (sp_0c + r4) - DivArm(0x1000, r4 * sp_0c);
    sp_04 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r7 * (r6 + 0x1000)) * (r8 + 0x1000)) << 0xb);
    sp_08 = DivArm(0x1000, DivArm(0x1000, DivArm(0x1000, r7 * (0x1000 - r6)) * (0x1000 - r8)) << 0xb);

    for (i = 0; i < sp_10; i++)
    {
        int a = sp_14[i] - sp_18[i];
        int b = r9[i] - sp_14[i];

        *arg_1 = DivArm(0x1000, sp_0c * (DivArm(0x1000, sp_04 * a) + DivArm(0x1000, sp_08 * b)));

        if (arg_2 == 1)
        {
            *arg_1 = DivArm(0x1000, (sp_04 + sp_08) * b);
        }

        arg_1++;
    }

    return;
}

//! FE8U = 0x0800A7D8
void sub_800A7D8(struct UnkSplineStruct1 * arg_0, struct UnkSplineStruct3 * arg_1, int arg_2)
{
    int * r8;
    int * r9;
    int sp_44;
    int * sp_48;
    int * sp_4c;
    int i;
    int * sl;
    int * r9_;
    struct UnkSplineStruct2 unk;
    int arrayA[4];
    int arrayB[4];

    sp_44 = arg_0->unk_00;

    r8 = arg_0[1].unk_04;
    r9 = arg_0[2].unk_04;

    sub_800A4E8(arg_0 + 0, &unk);
    sub_800A680(&unk, arrayB, arg_2);

    sub_800A4E8(arg_0 + 1, &unk);
    sub_800A518(&unk, arrayA, arg_2);

    sl = r8;
    r9_ = r9;
    sp_48 = arrayB;
    sp_4c = arrayA;

    for (i = 0; i < sp_44; i++)
    {
        arg_1->unk_00 = (DivArm(0x1000, *sl << 0xd) - DivArm(0x1000, *r9_ << 0xd)) + *sp_48 + *sp_4c;
        arg_1->unk_04 =
            ((DivArm(0x1000, *sl * -0x3000) + DivArm(0x1000, *r9_ * 0x3000)) - DivArm(0x1000, *sp_48 << 0xd)) - *sp_4c;
        arg_1->unk_08 = *sp_48;
        arg_1->unk_0c = *sl;

        sp_48++;
        sp_4c++;
        sl++;
        r9_++;
        arg_1++;
    }

    return;
}

//! FE8U = 0x0800A8D8
int sub_800A8D8(s16 * arg_0, s16 arg_1, int * arg_2, int * arg_3)
{
#ifdef EUROPE
    asm("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n");
    asm("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n");
    asm("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n");
    asm("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n");
    asm("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n");
    asm("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n");
    asm("nop\nnop\nnop\nnop\nnop\nnop\nnop\nnop\n");
#else
    int r2;
    int r3;

    int r4 = arg_0[0] * 0x1000;

    if (*arg_2 < r4)
    {
        *arg_3 = 0;
        *arg_2 = r4;
        return -2;
    }

    r2 = arg_0[arg_1 - 1] * 0x1000;

    if (*arg_2 > r2)
    {
        *arg_3 = arg_1 - 1;
        *arg_2 = r2;
        return -2;
    }

    r3 = 0;

    while (1)
    {
        if (arg_0[r3] * 0x1000 <= *arg_2 && arg_0[r3 + 1] * 0x1000 >= *arg_2)
        {
            break;
        }

        r3++;
    }

    *arg_3 = r3;

    return 0;
#endif
}
