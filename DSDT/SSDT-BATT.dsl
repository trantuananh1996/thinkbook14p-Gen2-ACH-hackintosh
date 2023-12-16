/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20210930 (32-bit version)
 * Copyright (c) 2000 - 2021 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of D:/Tools/Ryzentosh/thinkbook14p-Gen2-ACH-hackintosh/DSDT/SSDT-BATT.aml, Fri Dec  8 15:17:20 2023
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000B1D (2845)
 *     Revision         0x02
 *     Checksum         0x67
 *     OEM ID           "hack"
 *     OEM Table ID     "BATT"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "hack", "BATT", 0x00000000)
{
    External (_SB_.PCI0.LPC0.H_EC, DeviceObj)
    External (_SB_.PCI0.LPC0.H_EC.B1ST, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.BAT0, DeviceObj)
    External (_SB_.PCI0.LPC0.H_EC.BIDF, IntObj)
    External (_SB_.PCI0.LPC0.H_EC.DAVH, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.DAVL, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.ECRD, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC0.H_EC.ECWR, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.FWVH, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.FWVL, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.HIDH, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.HIDL, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.MIDH, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.MIDL, FieldUnitObj)
    External (_SB_.PCI0.LPC0.H_EC.VPC0, DeviceObj)
    External (_SB_.PCI0.LPC0.H_EC.VPC0.BIDF, PkgObj)
    External (_SB_.PCI0.LPC0.H_EC.XX10, FieldUnitObj)
    External (BIDF, IntObj)
    External (DAVH, IntObj)
    External (DAVL, IntObj)
    External (FWVH, IntObj)
    External (FWVL, IntObj)
    External (HIDH, IntObj)
    External (HIDL, IntObj)
    External (MIDH, IntObj)
    External (MIDL, IntObj)

    Method (B1B2, 2, NotSerialized)
    {
        Return ((Arg0 | (Arg1 << 0x08)))
    }

    Method (B1B4, 4, NotSerialized)
    {
        Local0 = (Arg2 | (Arg3 << 0x08))
        Local0 = (Arg1 | (Local0 << 0x08))
        Local0 = (Arg0 | (Local0 << 0x08))
        Return (Local0)
    }

    Method (W16B, 3, NotSerialized)
    {
        Arg0 = Arg2
        Arg1 = (Arg2 >> 0x08)
    }

    Scope (_SB.PCI0.LPC0.H_EC)
    {
        Method (RE1B, 1, NotSerialized)
        {
            Local0 = (0xFE00D400 + Arg0)
            OperationRegion (ERM2, SystemMemory, Local0, One)
            Field (ERM2, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            Return (BYTE) /* \_SB_.PCI0.LPC0.H_EC.RE1B.BYTE */
        }

        Method (RECB, 2, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                TEMP [Local0] = RE1B (Arg0)
                Arg0++
                Local0++
            }

            Return (TEMP) /* \_SB_.PCI0.LPC0.H_EC.RECB.TEMP */
        }

        Method (WE1B, 2, NotSerialized)
        {
            Local0 = (0xFE00D400 + Arg0)
            OperationRegion (ERM2, SystemMemory, Local0, One)
            Field (ERM2, ByteAcc, NoLock, Preserve)
            {
                BYTE,   8
            }

            BYTE = Arg1
        }

        Method (WECB, 3, Serialized)
        {
            Arg1 = ((Arg1 + 0x07) >> 0x03)
            Name (TEMP, Buffer (Arg1){})
            TEMP = Arg2
            Arg1 += Arg0
            Local0 = Zero
            While ((Arg0 < Arg1))
            {
                WE1B (Arg0, DerefOf (TEMP [Local0]))
                Arg0++
                Local0++
            }
        }

        OperationRegion (XCF2, SystemMemory, 0xFE00D400, 0xFF)
        Field (XCF2, ByteAcc, Lock, Preserve)
        {
            Offset (0x62), 
            BSN1,   8, 
            BSN2,   8, 
            BDC1,   8, 
            BDC2,   8, 
            BFV1,   8, 
            BFV2,   8, 
            BFC1,   8, 
            BFC2,   8, 
            Offset (0x6C), 
            BCR1,   8, 
            BCR2,   8, 
            BRC1,   8, 
            BRC2,   8, 
            BVT1,   8, 
            BVT2,   8, 
            Offset (0x74), 
            BCY1,   8, 
            BCY2,   8, 
            Offset (0x78), 
            BDA1,   8, 
            BDA2,   8, 
            BTP1,   8, 
            BTP2,   8, 
            Offset (0x86), 
            BUD1,   8, 
            BUD2,   8, 
            Offset (0x8A), 
            BTE1,   8, 
            BTE2,   8, 
            BTF1,   8, 
            BTF2,   8
        }
    }

    Scope (_SB.PCI0.LPC0.H_EC.BAT0)
    {
        Method (_BIX, 0, Serialized)  // _BIX: Battery Information Extended
        {
            Name (BPK1, Package (0x15)
            {
                One, 
                Zero, 
                0xFFFFFFFF, 
                0xFFFFFFFF, 
                One, 
                0xFFFFFFFF, 
                Zero, 
                Zero, 
                0x64, 
                0x00017318, 
                Zero, 
                Zero, 
                Zero, 
                Zero, 
                0x64, 
                Zero, 
                "SR Real Battery", 
                "123456789", 
                "LiP", 
                "LENOVO", 
                One
            })
            If ((XX10 == One))
            {
                Local0 = (B1B2 (BDC1, BDC2) * 0x0A)
                BPK1 [0x02] = Local0
            }
            Else
            {
                Local0 = (B1B2 (BDC1, BDC2) * B1B2 (BFV1, BFV2))
                Local0 /= 0x03E8
                BPK1 [0x02] = Local0
            }

            If ((XX10 == One))
            {
                Local1 = (B1B2 (BFC1, BFC2) * 0x0A)
                BPK1 [0x03] = Local1
            }
            Else
            {
                Local1 = (B1B2 (BFC1, BFC2) * B1B2 (BFV1, BFV2))
                Local1 /= 0x03E8
                BPK1 [0x03] = Local1
            }

            BPK1 [0x06] = (Local1 / 0x0A)
            BPK1 [0x07] = (Local1 / 0x19)
            BPK1 [0x08] = B1B2 (BCY1, BCY2)
            BPK1 [0x10] = ToString (RECB (0xB0, 0x10), Ones)
            BPK1 [0x11] = ToHexString (B1B2 (BSN1, BSN2))
            BPK1 [0x13] = ToString (RECB (0xC0, 0x10), Ones)
            Return (BPK1) /* \_SB_.PCI0.LPC0.H_EC.BAT0._BIX.BPK1 */
        }

        Method (_BST, 0, NotSerialized)  // _BST: Battery Status
        {
            Name (PKG1, Package (0x04)
            {
                Ones, 
                Ones, 
                Ones, 
                Ones
            })
            Local0 = Zero
            If ((ECWR & 0x04))
            {
                Local0 = 0x02
            }
            ElseIf ((ECWR & 0x08))
            {
                Local0 = One
            }

            If ((ECWR & 0x40))
            {
                Local0 |= 0x04
            }

            PKG1 [Zero] = Local0
            If ((B1ST & One))
            {
                If ((XX10 == One))
                {
                    Local0 = (B1B2 (BCR1, BCR2) * 0x0A)
                    PKG1 [One] = Local0
                }
                Else
                {
                    Local0 = (B1B2 (BCR1, BCR2) * B1B2 (BFV1, BFV2))
                    Local0 /= 0x03E8
                    PKG1 [One] = Local0
                }
            }
            ElseIf ((XX10 == One))
            {
                Local0 = (B1B2 (BCR1, BCR2) * 0x0A)
                PKG1 [One] = Local0
            }
            Else
            {
                Local0 = (B1B2 (BCR1, BCR2) * B1B2 (BFV1, BFV2))
                Local0 /= 0x03E8
                PKG1 [One] = Local0
            }

            If ((XX10 == One))
            {
                PKG1 [0x02] = (B1B2 (BRC1, BRC2) * 0x0A)
            }
            Else
            {
                Local1 = (B1B2 (BRC1, BRC2) * B1B2 (BFV1, BFV2))
                Local1 /= 0x03E8
                PKG1 [0x02] = Local1
            }

            PKG1 [0x03] = B1B2 (BFV1, BFV2)
            Return (PKG1) /* \_SB_.PCI0.LPC0.H_EC.BAT0._BST.PKG1 */
        }
    }

    Scope (_SB.PCI0.LPC0.H_EC.VPC0)
    {
        Method (GSBI, 1, NotSerialized)
        {
            Name (BIFB, Buffer (0x53)
            {
                /* 0000 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0008 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0018 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0020 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0028 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0030 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0038 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0040 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0048 */  0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF,  // ........
                /* 0050 */  0xFF, 0xFF, 0xFF                                 // ...
            })
            CreateWordField (BIFB, Zero, DECP)
            CreateWordField (BIFB, 0x02, FCAP)
            CreateWordField (BIFB, 0x04, RCAP)
            CreateWordField (BIFB, 0x06, ATTE)
            CreateWordField (BIFB, 0x08, ATTF)
            CreateWordField (BIFB, 0x0A, BTVT)
            CreateWordField (BIFB, 0x0C, BTCT)
            CreateWordField (BIFB, 0x0E, BTMP)
            CreateWordField (BIFB, 0x10, MDAT)
            CreateWordField (BIFB, 0x12, FUDT)
            CreateWordField (BIFB, 0x14, DVLT)
            CreateField (BIFB, 0xB0, 0x50, DCHE)
            CreateField (BIFB, 0x0100, 0x40, DNAM)
            CreateField (BIFB, 0x0140, 0x60, MNAM)
            CreateField (BIFB, 0x01A0, 0xB8, BRNB)
            CreateQWordField (BIFB, 0x4B, BFW0)
            If ((Arg0 == One))
            {
                If ((XX10 == One))
                {
                    Local0 = (B1B2 (BDC1, BDC2) * 0x0A)
                    DECP = Local0
                }
                Else
                {
                    Local0 = (B1B2 (BDC1, BDC2) * B1B2 (BFV1, BFV2))
                    Local0 /= 0x03E8
                    DECP = Local0
                }

                If ((XX10 == One))
                {
                    Local1 = (B1B2 (BFC1, BFC2) * 0x0A)
                    FCAP = Local1
                }
                Else
                {
                    Local1 = (B1B2 (BFC1, BFC2) * B1B2 (BFV1, BFV2))
                    Local1 /= 0x03E8
                    FCAP = Local1
                }

                If ((XX10 == One))
                {
                    RCAP = (B1B2 (BRC1, BRC2) * 0x0A)
                }
                Else
                {
                    Local1 = (B1B2 (BRC1, BRC2) * B1B2 (BFV1, BFV2))
                    Local1 /= 0x03E8
                    RCAP = Local1
                }

                ATTE = B1B2 (BTE1, BTE2)
                ATTF = B1B2 (BTF1, BTF2)
                BTVT = B1B2 (BVT1, BVT2)
                BTCT = B1B2 (BCR1, BCR2)
                BTMP = B1B2 (BTP1, BTP2)
                MDAT = B1B2 (BDA1, BDA2)
                If ((B1B2 (BUD1, BUD2) != Zero))
                {
                    FUDT = B1B2 (BUD1, BUD2)
                }

                DVLT = B1B2 (BFV1, BFV2)
                Name (DCH0, Buffer (0x0A)
                {
                     0x00                                             // .
                })
                Name (DCH1, "LiP")
                DCH0 = DCH1 /* \_SB_.PCI0.LPC0.H_EC.VPC0.GSBI.DCH1 */
                DCHE = DCH0 /* \_SB_.PCI0.LPC0.H_EC.VPC0.GSBI.DCH0 */
                Name (BFV0, Buffer (0x08)
                {
                     0x00                                             // .
                })
                BFV0 [Zero] = MIDL /* External reference */
                BFV0 [One] = MIDH /* External reference */
                BFV0 [0x02] = HIDL /* External reference */
                BFV0 [0x03] = HIDH /* External reference */
                BFV0 [0x04] = FWVL /* External reference */
                BFV0 [0x05] = FWVH /* External reference */
                BFV0 [0x06] = DAVL /* External reference */
                BFV0 [0x07] = DAVH /* External reference */
                BFW0 = BFV0 /* \_SB_.PCI0.LPC0.H_EC.VPC0.GSBI.BFV0 */
                Return (BIFB) /* \_SB_.PCI0.LPC0.H_EC.VPC0.GSBI.BIFB */
            }

            If ((Arg0 == 0x02))
            {
                Return (BIFB) /* \_SB_.PCI0.LPC0.H_EC.VPC0.GSBI.BIFB */
            }
        }

        Method (GBID, 0, Serialized)
        {
            DerefOf (BIDF [Zero]) [Zero] = ECRD (RefOf (BCY1))
            DerefOf (BIDF [Zero]) [One] = ECRD (RefOf (BCY2))
            DerefOf (BIDF [0x02]) [Zero] = ECRD (RefOf (MIDL))
            DerefOf (BIDF [0x02]) [One] = ECRD (RefOf (MIDH))
            DerefOf (BIDF [0x02]) [0x02] = ECRD (RefOf (HIDL))
            DerefOf (BIDF [0x02]) [0x03] = ECRD (RefOf (HIDH))
            DerefOf (BIDF [0x02]) [0x04] = ECRD (RefOf (FWVL))
            DerefOf (BIDF [0x02]) [0x05] = ECRD (RefOf (FWVH))
            DerefOf (BIDF [0x02]) [0x06] = ECRD (RefOf (DAVL))
            DerefOf (BIDF [0x02]) [0x07] = ECRD (RefOf (DAVH))
            Sleep (0x32)
            Return (BIDF) /* External reference */
        }
    }
}

