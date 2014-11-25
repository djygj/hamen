/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20120420-32 [Apr 20 2012]
 * Copyright (c) 2000 - 2012 Intel Corporation
 * 
 * Disassembly of SSDT7.aml, Wed Nov 26 01:36:47 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000010BA (4282)
 *     Revision         0x01
 *     Checksum         0x25
 *     OEM ID           "AmdRef"
 *     OEM Table ID     "AmdTabl"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */

DefinitionBlock ("SSDT7.aml", "SSDT", 1, "AmdRef", "AmdTabl", 0x00001000)
{
    External (DSEN, FieldUnitObj)
    External (ECG3, MethodObj)    // 0 Arguments
    External (NXD8, FieldUnitObj)
    External (NXD7, FieldUnitObj)
    External (NXD6, FieldUnitObj)
    External (NXD5, FieldUnitObj)
    External (NXD4, FieldUnitObj)
    External (NXD3, FieldUnitObj)
    External (NXD2, FieldUnitObj)
    External (NXD1, FieldUnitObj)
    External (SGFL, FieldUnitObj)
    External (MXD7, FieldUnitObj)
    External (MXD6, FieldUnitObj)
    External (MXD5, FieldUnitObj)
    External (MXD4, FieldUnitObj)
    External (MXD3, FieldUnitObj)
    External (MXD2, FieldUnitObj)
    External (ESEL, FieldUnitObj)
    External (SSEL)
    External (DSEL, FieldUnitObj)
    External (PXFD, FieldUnitObj)
    External (SGMD, FieldUnitObj)
    External (AMDA, FieldUnitObj)
    External (SGOF, MethodObj)    // 0 Arguments
    External (SGON, MethodObj)    // 0 Arguments
    External (\ECON, FieldUnitObj)
    External (\_SB_.PCI0.GFX0, DeviceObj)
    External (\_SB_.PCI0.PEG0)
    External (\_SB_.PCI0.GFX0.AINT, MethodObj)    // 2 Arguments
    External (\_SB_.PCI0.GFX0.IDAB, MethodObj)    // 0 Arguments
    External (\_SB_.PCI0.PEG0.PEGP, DeviceObj)
    External (\_SB_.PCI0.PEG0.PEGP.DD02)
    External (\_SB_.PCI0.LPCB.H_EC.LSTE)
    External (\_SB_.PCI0.PEG0.PEGP.SGPO, MethodObj)    // 2 Arguments

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        Method (_ON, 0, Serialized)
        {
            SGON ()
            Notify (\_SB.PCI0.PEG0, Zero)
        }

        Method (_OFF, 0, Serialized)
        {
            SGOF ()
            Notify (\_SB.PCI0.PEG0, Zero)
        }

        Method (_STA, 0, Serialized)
        {
            Return (0x0F)
        }
    }

    Scope (\_SB.PCI0.GFX0)
    {
        OperationRegion (APXM, SystemMemory, AMDA, 0x00020400)
        Field (APXM, AnyAcc, NoLock, Preserve)
        {
            APSG,   128, 
            APSZ,   32, 
            APVR,   32, 
            APXA,   32, 
            RVBS,   32, 
            NTLE,   16, 
            TLE1,   16, 
            TLE2,   16, 
            TLE3,   16, 
            TLE4,   16, 
            TLE5,   16, 
            TLE6,   16, 
            TLE7,   16, 
            TLE8,   16, 
            TLE9,   16, 
            TL10,   16, 
            TL11,   16, 
            TL12,   16, 
            TL13,   16, 
            TL14,   16, 
            TL15,   16, 
            TGXA,   16, 
            AGXA,   16, 
            GSTP,   8, 
            DSWR,   8, 
            SPSR,   8, 
            DCFR,   8, 
            EMDR,   8, 
            PXGS,   8, 
            CACD,   16, 
            CCND,   16, 
            NACD,   16, 
            EXPM,   8, 
            TLSN,   16, 
            ELCL,   16, 
            RBF1,   262144, 
            RBF2,   262144, 
            RBF3,   262144, 
            RBF4,   262144
        }

        Method (ADPM, 2, Serialized)
        {
            Store (Zero, Local1)
            ShiftRight (Arg0, 0x10, Local0)
            If (LEqual (Arg1, One))
            {
                Or (And (Local0, One), Local1, Local1)
            }
            Else
            {
                Or (ShiftRight (And (Local0, 0x02), One), Local1, Local1)
            }

            ShiftLeft (Local1, One, Local1)
            ShiftRight (Arg0, 0x18, Local0)
            If (LEqual (Arg1, One))
            {
                Or (And (Local0, One), Local1, Local1)
            }
            Else
            {
                Or (ShiftRight (And (Local0, 0x02), One), Local1, Local1)
            }

            ShiftLeft (Local1, One, Local1)
            ShiftRight (Arg0, 0x08, Local0)
            If (LEqual (Arg1, One))
            {
                Or (And (Local0, One), Local1, Local1)
            }
            Else
            {
                Or (ShiftRight (And (Local0, 0x02), One), Local1, Local1)
            }

            Return (Local1)
        }

        Method (ATPX, 2, Serialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Name (TMP1, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (TMP1, Zero, F0SS)
                CreateWordField (TMP1, 0x02, F0IV)
                CreateDWordField (TMP1, 0x04, F0SF)
                Store (0x08, F0SS)
                Store (One, F0IV)
                Store (0xBF, F0SF)
                If (LEqual (SGMD, 0x02))
                {
                    Store (0x33, F0SF)
                }

                Return (TMP1)
            }

            If (LEqual (Arg0, One))
            {
                Name (TMP2, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (TMP2, Zero, F1SS)
                CreateDWordField (TMP2, 0x02, F1VM)
                CreateDWordField (TMP2, 0x06, F1FG)
                Store (0x0A, F1SS)
                Store (0x7FFF, F1VM)
                If (LEqual (SGMD, 0x02))
                {
                    Store (0x0280, F1FG)
                    If (LEqual (PXFD, One))
                    {
                        Store (0x1E80, F1FG)
                    }
                }
                Else
                {
                    Store (0x40, F1FG)
                }

                Return (TMP2)
            }

            If (LEqual (Arg0, 0x02))
            {
                Name (TMPB, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (Arg1, Zero, FN2S)
                CreateByteField (Arg1, 0x02, DGPR)
                If (LEqual (DGPR, Zero))
                {
                    \_SB.PCI0.PEG0.PEGP._OFF ()
                }

                If (LEqual (DGPR, One))
                {
                    \_SB.PCI0.PEG0.PEGP._ON ()
                }

                Return (TMPB)
            }

            If (LEqual (Arg0, 0x03))
            {
                CreateWordField (Arg1, Zero, FN3S)
                CreateWordField (Arg1, 0x02, SDMG)
                If (LEqual (SDMG, Zero))
                {
                    \_SB.PCI0.PEG0.PEGP.SGPO (DSEL, Zero)
                }

                If (LEqual (SDMG, One))
                {
                    \_SB.PCI0.PEG0.PEGP.SGPO (SSEL, One)
                }

                Return (Zero)
            }

            If (LEqual (Arg0, 0x04))
            {
                CreateWordField (Arg1, Zero, FN4S)
                CreateWordField (Arg1, 0x02, SIMG)
                If (LEqual (SIMG, Zero))
                {
                    \_SB.PCI0.PEG0.PEGP.SGPO (ESEL, Zero)
                }

                If (LEqual (SIMG, One))
                {
                    \_SB.PCI0.PEG0.PEGP.SGPO (ESEL, One)
                }

                Return (Zero)
            }

            If (LEqual (Arg0, 0x05))
            {
                CreateWordField (Arg1, Zero, FN5S)
                CreateWordField (Arg1, 0x02, TGFX)
                Store (TGFX, TGXA)
                Store (One, GSTP)
                Return (Zero)
            }

            If (LEqual (Arg0, 0x06))
            {
                CreateWordField (Arg1, Zero, FN6S)
                CreateWordField (Arg1, 0x02, AGFX)
                Store (AGFX, AGXA)
                Store (Zero, GSTP)
                Return (Zero)
            }

            If (LEqual (Arg0, 0x08))
            {
                Name (TMP3, Buffer (0x0100)
                {
                    /* 0000 */   0x0E, 0x00, 0x46, 0x00, 0x07, 0x01, 0x00, 0x00,
                    /* 0008 */   0x01, 0x07, 0x01, 0x01, 0x00, 0x01, 0x05, 0x00,
                    /* 0010 */   0x00, 0x00, 0x04, 0x05, 0x00, 0x01, 0x10, 0x01,
                    /* 0018 */   0x07, 0x03, 0x00, 0x00, 0x03, 0x07, 0x03, 0x01,
                    /* 0020 */   0x10, 0x02, 0x07, 0x07, 0x00, 0x01, 0x03, 0x07,
                    /* 0028 */   0x07, 0x01, 0x10, 0x02, 0x07, 0x09, 0x00, 0x02,
                    /* 0030 */   0x03, 0x07, 0x09, 0x01, 0x20, 0x02, 0x07, 0x0A,
                    /* 0038 */   0x00, 0x03, 0x03, 0x07, 0x0A, 0x01, 0x30, 0x02,
                    /* 0040 */   0x07, 0x0B, 0x00, 0x04, 0x03, 0x07, 0x0B, 0x01,
                    /* 0048 */   0x30, 0x02, 0x07, 0x0C, 0x00, 0x06, 0x03
                })
                CreateWordField (TMP3, Zero, ATNO)
                CreateWordField (TMP3, 0x02, ATSZ)
                Store (ADPM (MXD2, One), Index (TMP3, 0x0E))
                Store (ADPM (MXD2, One), Index (TMP3, 0x13))
                Store (ADPM (MXD3, One), Index (TMP3, 0x18))
                Store (ADPM (MXD3, 0x02), Index (TMP3, 0x1D))
                Store (ADPM (MXD4, One), Index (TMP3, 0x22))
                Store (ADPM (MXD4, 0x02), Index (TMP3, 0x27))
                Store (ADPM (MXD5, One), Index (TMP3, 0x2C))
                Store (ADPM (MXD5, 0x02), Index (TMP3, 0x31))
                Store (ADPM (MXD6, One), Index (TMP3, 0x36))
                Store (ADPM (MXD6, 0x02), Index (TMP3, 0x3B))
                Store (ADPM (MXD7, One), Index (TMP3, 0x40))
                Store (ADPM (MXD7, 0x02), Index (TMP3, 0x45))
                If (And (SGFL, One))
                {
                    Store (Add (ATNO, One), ATNO)
                    Store (Add (ATSZ, 0x05), ATSZ)
                }

                Return (TMP3)
            }

            Return (Zero)
        }

        Method (ATRM, 2, Serialized)
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            If (LGreater (Local1, 0x1000))
            {
                Store (0x1000, Local1)
            }

            If (LGreater (Local0, 0x00010000))
            {
                Return (Buffer (Local1)
                {
                     0x00
                })
            }

            If (LGreater (Local0, RVBS))
            {
                Return (Buffer (Local1)
                {
                     0x00
                })
            }

            Multiply (Local1, 0x08, Local3)
            Name (ROM1, Buffer (0x8000)
            {
                 0x00
            })
            Name (ROM2, Buffer (Local1)
            {
                 0x00
            })
            If (LLess (Local0, 0x8000))
            {
                Store (RBF1, ROM1)
            }
            Else
            {
                If (LLess (Local0, 0x00010000))
                {
                    Subtract (Local0, 0x8000, Local0)
                    Store (RBF2, ROM1)
                }
                Else
                {
                    If (LLess (Local0, 0x00018000))
                    {
                        Subtract (Local0, 0x00010000, Local0)
                        Store (RBF3, ROM1)
                    }
                    Else
                    {
                        If (LLess (Local0, 0x00020000))
                        {
                            Subtract (Local0, 0x00018000, Local0)
                            Store (RBF4, ROM1)
                        }
                    }
                }
            }

            Multiply (Local0, 0x08, Local2)
            CreateField (ROM1, Local2, Local3, TMPB)
            Store (TMPB, ROM2)
            Return (ROM2)
        }

        Method (INDL, 0, Serialized)
        {
            Store (Zero, NXD1)
            Store (Zero, NXD2)
            Store (Zero, NXD3)
            Store (Zero, NXD4)
            Store (Zero, NXD5)
            Store (Zero, NXD6)
            Store (Zero, NXD7)
            Store (Zero, NXD8)
        }

        Method (SNXD, 1, Serialized)
        {
            INDL ()
            Store (Arg0, Local0)
            If (And (Local0, 0x02))
            {
                Store (One, NXD1)
            }

            If (And (Local0, One))
            {
                Store (One, NXD2)
            }

            If (And (Local0, 0x08))
            {
                Store (One, NXD3)
            }

            If (And (Local0, 0x80))
            {
                Store (One, NXD4)
            }

            If (And (Local0, 0x0200))
            {
                Store (One, NXD5)
            }

            If (And (Local0, 0x0400))
            {
                Store (One, NXD6)
            }

            If (And (Local0, 0x0800))
            {
                Store (One, NXD7)
            }
        }

        Method (ATIF, 2, Serialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Name (TMP0, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (TMP0, Zero, F0SS)
                CreateWordField (TMP0, 0x02, F0IV)
                CreateDWordField (TMP0, 0x04, F0SN)
                CreateDWordField (TMP0, 0x08, F0SF)
                Store (0x0C, F0SS)
                Store (One, F0IV)
                Store (0x01F1, F0SN)
                Store (0x400F, F0SF)
                Return (TMP0)
            }

            If (LEqual (Arg0, One))
            {
                Name (TMP1, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (TMP1, Zero, F1SS)
                CreateDWordField (TMP1, 0x02, F1VF)
                CreateDWordField (TMP1, 0x06, F1FG)
                CreateByteField (TMP1, 0x0A, F1FY)
                Store (0x0B, F1SS)
                Store (0x07, F1VF)
                Store (0x06, F1FG)
                Store (0xD9, F1FY)
                Return (TMP1)
            }

            If (LEqual (Arg0, 0x02))
            {
                CreateBitField (PSBR, Zero, PDSW)
                CreateBitField (PSBR, One, PEXM)
                CreateBitField (PSBR, 0x02, PTHR)
                CreateBitField (PSBR, 0x03, PFPS)
                CreateBitField (PSBR, 0x04, PSPS)
                CreateBitField (PSBR, 0x05, PDCC)
                CreateBitField (PSBR, 0x06, PXPS)
                CreateBitField (PSBR, 0x07, PBRT)
                CreateBitField (PSBR, 0x08, DCSC)
                CreateWordField (ATIB, Zero, SSZE)
                CreateDWordField (ATIB, 0x02, PSBI)
                CreateByteField (ATIB, 0x06, EXPM)
                CreateByteField (ATIB, 0x07, THRM)
                CreateByteField (ATIB, 0x08, THID)
                CreateByteField (ATIB, 0x09, FPWR)
                CreateByteField (ATIB, 0x0A, FPID)
                CreateByteField (ATIB, 0x0B, SPWR)
                CreateByteField (ATIB, 0x0C, BRTL)
                Store (One, DCSC)
                Store (0x0D, SSZE)
                Store (PSBR, PSBI)
                If (PDSW)
                {
                    Store (Zero, PDSW)
                }

                If (PEXM)
                {
                    Store (Zero, EXPM)
                    Store (Zero, PEXM)
                }

                If (PTHR)
                {
                    Store (Zero, THRM)
                    Store (Zero, THID)
                    Store (Zero, PTHR)
                }

                If (PFPS)
                {
                    Store (Zero, PFPS)
                }

                If (PSPS)
                {
                    Store (Zero, PSPS)
                }

                If (PXPS)
                {
                    Store (Zero, PXPS)
                }

                If (PBRT)
                {
                    Store (Zero, PBRT)
                }

                If (DCSC)
                {
                    Store (Zero, DCSC)
                }

                Return (ATIB)
            }

            If (LEqual (Arg0, 0x03))
            {
                Name (TMP3, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (TMP3, Zero, F3SS)
                CreateWordField (TMP3, 0x02, F3SD)
                CreateWordField (Arg1, Zero, AI3S)
                CreateWordField (Arg1, 0x02, SLDS)
                CreateWordField (Arg1, 0x04, CODS)
                Store (SLDS, CACD)
                Store (CODS, CCND)
                If (\ECON)
                {
                    If (LEqual (\_SB.PCI0.LPCB.H_EC.LSTE, One))
                    {
                        Or (CCND, One, CCND)
                    }
                }

                Store (0x04, F3SS)
                Store (CTOI (CACD), TLSN)
                Store (CACD, Local1)
                Store (NTLE, Local0)
                While (Local0)
                {
                    Store (NATL (TLSN), Local1)
                    If (LNotEqual (Local1, Zero))
                    {
                        If (LEqual (And (Local1, CCND), Local1))
                        {
                            Store (One, Local0)
                        }
                    }

                    Decrement (Local0)
                    Increment (TLSN)
                    If (LGreater (TLSN, NTLE))
                    {
                        Store (One, TLSN)
                    }
                }

                SNXD (Local1)
                Store (Local1, NACD)
                Store (NACD, F3SD)
                Return (TMP3)
            }

            If (LEqual (Arg0, 0x04))
            {
                Name (TMP4, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (TMP4, Zero, F4SS)
                CreateByteField (TMP4, 0x02, F4LS)
                Store (0x03, F4SS)
                Store (ECG3 (), F4LS)
                Return (TMP4)
            }

            If (LEqual (Arg0, 0x0F))
            {
                Name (TMPF, Buffer (0x0100)
                {
                     0x00
                })
                CreateWordField (TMPF, Zero, FFND)
                CreateWordField (TMPF, 0x02, FFDS)
                CreateDWordField (TMPF, 0x04, FFFG)
                CreateWordField (TMPF, 0x08, FFBS)
                CreateWordField (TMPF, 0x0A, FFDV)
                Store (One, FFND)
                Store (0x08, FFDS)
                Store (0x05, FFFG)
                Store (One, FFBS)
                Store (Zero, FFDV)
                Return (TMPF)
            }

            Return (Zero)
        }

        Name (ATIB, Buffer (0x0100) {})
        Name (PSBR, Buffer (0x04)
        {
             0x00
        })
        Name (SSPS, Zero)
        Method (AFN0, 0, Serialized)
        {
            CreateBitField (PSBR, Zero, PDSW)
            Store (One, PDSW)
            Notify (\_SB.PCI0.GFX0, 0xD9)
        }

        Method (AFN4, 1, Serialized)
        {
            Store (Arg0, Local0)
            Store (SSPS, Local1)
            Store (Local0, SSPS)
            If (LEqual (Local0, Local1)) {}
            Else
            {
                CreateBitField (PSBR, 0x04, PSPS)
                Store (One, PSPS)
                Notify (\_SB.PCI0.GFX0, 0xD9)
            }
        }

        Method (AFN5, 0, Serialized)
        {
            CreateBitField (PSBR, 0x05, PDCC)
            Store (One, PDCC)
            Notify (\_SB.PCI0.GFX0, 0xD9)
        }

        Method (AFN6, 0, Serialized)
        {
            CreateBitField (PSBR, 0x06, PXPS)
            Store (One, PXPS)
            Notify (\_SB.PCI0.GFX0, 0xD9)
        }

        Method (AFN7, 1, Serialized)
        {
            CreateBitField (PSBR, 0x07, PBRT)
            Store (One, PBRT)
            CreateByteField (ATIB, 0x0C, BRTL)
            Store (Arg0, BRTL)
            Notify (\_SB.PCI0.GFX0, 0xD9)
        }

        Method (AFN8, 0, Serialized)
        {
            CreateBitField (PSBR, 0x08, DCSC)
            Store (One, DCSC)
            Notify (\_SB.PCI0.GFX0, 0xD9)
        }

        Method (CTOI, 1, NotSerialized)
        {
            If (LNotEqual (NTLE, Zero))
            {
                If (LEqual (TLE1, Arg0))
                {
                    Return (One)
                }

                If (LEqual (TLE2, Arg0))
                {
                    Return (0x02)
                }

                If (LEqual (TLE3, Arg0))
                {
                    Return (0x03)
                }

                If (LEqual (TLE4, Arg0))
                {
                    Return (0x04)
                }

                If (LEqual (TLE5, Arg0))
                {
                    Return (0x05)
                }

                If (LEqual (TLE6, Arg0))
                {
                    Return (0x06)
                }

                If (LEqual (TLE7, Arg0))
                {
                    Return (0x07)
                }

                If (LEqual (TLE8, Arg0))
                {
                    Return (0x08)
                }

                If (LEqual (TLE9, Arg0))
                {
                    Return (0x09)
                }

                If (LEqual (TL10, Arg0))
                {
                    Return (0x0A)
                }

                If (LEqual (TL11, Arg0))
                {
                    Return (0x0B)
                }

                If (LEqual (TL12, Arg0))
                {
                    Return (0x0C)
                }

                If (LEqual (TL13, Arg0))
                {
                    Return (0x0D)
                }

                If (LEqual (TL14, Arg0))
                {
                    Return (0x0E)
                }

                If (LEqual (TL15, Arg0))
                {
                    Return (0x0F)
                }
            }

            Return (One)
        }

        Method (NATL, 1, NotSerialized)
        {
            If (LNotEqual (NTLE, Zero))
            {
                If (LEqual (Arg0, One))
                {
                    Return (TLE2)
                }

                If (LEqual (Arg0, 0x02))
                {
                    Return (TLE3)
                }

                If (LEqual (Arg0, 0x03))
                {
                    Return (TLE4)
                }

                If (LEqual (Arg0, 0x04))
                {
                    Return (TLE5)
                }

                If (LEqual (Arg0, 0x05))
                {
                    Return (TLE6)
                }

                If (LEqual (Arg0, 0x06))
                {
                    Return (TLE7)
                }

                If (LEqual (Arg0, 0x07))
                {
                    Return (TLE8)
                }

                If (LEqual (Arg0, 0x08))
                {
                    Return (TLE9)
                }

                If (LEqual (Arg0, 0x09))
                {
                    Return (TL10)
                }

                If (LEqual (Arg0, 0x0A))
                {
                    Return (TL11)
                }

                If (LEqual (Arg0, 0x0B))
                {
                    Return (TL12)
                }

                If (LEqual (Arg0, 0x0C))
                {
                    Return (TL13)
                }

                If (LEqual (Arg0, 0x0D))
                {
                    Return (TL14)
                }

                If (LEqual (Arg0, 0x0E))
                {
                    Return (TL15)
                }

                If (LEqual (Arg0, 0x0F))
                {
                    Return (TLE1)
                }
            }

            Return (Zero)
        }
    }

    Method (IDAB, 0, Serialized)
    {
        If (CondRefOf (\_SB.PCI0.GFX0.IDAB))
        {
            \_SB.PCI0.GFX0.IDAB ()
        }
    }

    Method (HGAS, 0, NotSerialized)
    {
        Store (One, \_SB.PCI0.GFX0.PXGS)
        Notify (\_SB.PCI0.GFX0, 0x81)
    }

    Method (HBRT, 1, Serialized)
    {
        If (And (0x04, DSEN))
        {
            If (LEqual (Arg0, 0x04))
            {
                Notify (\_SB.PCI0.PEG0.PEGP.DD02, 0x87)
            }

            If (LEqual (Arg0, 0x03))
            {
                Notify (\_SB.PCI0.PEG0.PEGP.DD02, 0x86)
            }
        }
    }

    Method (HPFS, 0, Serialized)
    {
        If (LNotEqual (\_SB.PCI0.GFX0.GSTP, One))
        {
            If (LEqual (\_SB.PCI0.GFX0.AGXA, Zero))
            {
                \_SB.PCI0.GFX0.AINT (0x02, Zero)
            }
            Else
            {
                Store (One, \_SB.PCI0.GFX0.EMDR)
                If (LEqual (\_SB.PCI0.GFX0.EXPM, 0x02))
                {
                    Store (Zero, \_SB.PCI0.GFX0.EXPM)
                }
                Else
                {
                    Increment (\_SB.PCI0.GFX0.EXPM)
                }

                Notify (\_SB.PCI0.GFX0, 0x81)
            }
        }
    }

    Method (HNOT, 1, Serialized)
    {
        Name (_T_0, Zero)
        While (One)
        {
            Store (ToInteger (Arg0), _T_0)
            If (LEqual (_T_0, One))
            {
                If (LNotEqual (\_SB.PCI0.GFX0.GSTP, One))
                {
                    If (LEqual (SGMD, 0x02))
                    {
                        If (LEqual (\_SB.PCI0.GFX0.AGXA, Zero))
                        {
                            Notify (\_SB.PCI0.GFX0, 0x80)
                        }

                        If (LEqual (\_SB.PCI0.GFX0.AGXA, One))
                        {
                            Notify (\_SB.PCI0.PEG0.PEGP, 0x80)
                        }
                    }
                    Else
                    {
                        Store (One, \_SB.PCI0.GFX0.DSWR)
                        Notify (\_SB.PCI0.GFX0, 0x81)
                    }
                }
            }
            Else
            {
                If (LEqual (_T_0, 0x02))
                {
                    If (LEqual (SGMD, 0x02))
                    {
                        If (LEqual (\_SB.PCI0.GFX0.AGXA, Zero))
                        {
                            Notify (\_SB.PCI0.GFX0, 0x80)
                        }

                        If (LEqual (\_SB.PCI0.GFX0.AGXA, One))
                        {
                            Notify (\_SB.PCI0.PEG0.PEGP, 0x80)
                        }
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.GFX0, 0x80)
                    }
                }
                Else
                {
                    If (LEqual (_T_0, 0x04))
                    {
                        If (LEqual (SGMD, 0x02))
                        {
                            If (LEqual (\_SB.PCI0.GFX0.AGXA, Zero))
                            {
                                Notify (\_SB.PCI0.GFX0, 0x80)
                            }

                            If (LEqual (\_SB.PCI0.GFX0.AGXA, One))
                            {
                                Notify (\_SB.PCI0.PEG0.PEGP, 0x80)
                            }
                        }
                        Else
                        {
                            Notify (\_SB.PCI0.GFX0, 0x80)
                        }
                    }
                    Else
                    {
                        Notify (\_SB.PCI0.GFX0, 0x80)
                    }
                }
            }

            Break
        }
    }
}

