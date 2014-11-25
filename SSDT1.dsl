/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20120420-32 [Apr 20 2012]
 * Copyright (c) 2000 - 2012 Intel Corporation
 * 
 * Disassembly of SSDT1.aml, Wed Nov 26 01:36:47 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000228 (552)
 *     Revision         0x01
 *     Checksum         0xAF
 *     OEM ID           "INTEL"
 *     OEM Table ID     "sensrhub"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */

DefinitionBlock ("SSDT1.aml", "SSDT", 1, "INTEL", "sensrhub", 0x00000000)
{
    External (USBH, FieldUnitObj)
    External (SDS0, FieldUnitObj)
    External (\_SB_.WTGP, MethodObj)    // 2 Arguments
    External (\_SB_.RDGP, MethodObj)    // 1 Arguments
    External (\_SB_.PCI0.I2C0.DFUD)
    External (\_SB_.PCI0.I2C0.SHUB)

    Scope (\)
    {
        Device (SHAD)
        {
            Name (_HID, EisaId ("INT33D0"))
            Name (_CID, EisaId ("PNP0C02"))
            Method (_STA, 0, Serialized)
            {
                If (LOr (And (SDS0, One), And (USBH, One)))
                {
                    Return (0x0F)
                }

                Return (Zero)
            }

            Method (_DSM, 4, Serialized)
            {
                Name (_T_0, Zero)
                Name (PGCE, Zero)
                Name (PGCD, Zero)
                Name (DFUE, Zero)
                Name (DFUD, Zero)
                Name (OLDV, Zero)
                Name (PGCV, Zero)
                Name (DFUV, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xD5, 0x68, 0xC8, 0x03, 0x3F, 0x56, 0xA8, 0x42,
                            /* 0008 */   0x9F, 0x57, 0x9A, 0x18, 0xD9, 0x49, 0xB7, 0xCB
                        }))
                {
                    If (LEqual (One, ToInteger (Arg1)))
                    {
                        While (One)
                        {
                            Store (ToInteger (Arg2), _T_0)
                            If (LEqual (_T_0, Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x0F
                                })
                            }
                            Else
                            {
                                If (LEqual (_T_0, One))
                                {
                                    Store (DerefOf (Index (Arg3, Zero)), PGCE)
                                    Store (DerefOf (Index (Arg3, One)), PGCD)
                                    Store (\_SB.RDGP (0x2E), OLDV)
                                    \_SB.WTGP (0x2E, PGCE)
                                    If (LGreater (PGCD, Zero))
                                    {
                                        Sleep (PGCD)
                                        \_SB.WTGP (0x2E, OLDV)
                                    }

                                    If (LEqual (\_SB.RDGP (0x2E), One))
                                    {
                                        Sleep (0x96)
                                        If (LEqual (\_SB.RDGP (0x2C), One))
                                        {
                                            Notify (\_SB.PCI0.I2C0.SHUB, One)
                                        }
                                        Else
                                        {
                                            Notify (\_SB.PCI0.I2C0.DFUD, One)
                                        }
                                    }

                                    Return (Zero)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x02))
                                    {
                                        Store (DerefOf (Index (Arg3, Zero)), DFUE)
                                        Store (DerefOf (Index (Arg3, One)), DFUD)
                                        Store (\_SB.RDGP (0x2C), OLDV)
                                        \_SB.WTGP (0x2C, DFUE)
                                        If (LGreater (DFUD, Zero))
                                        {
                                            Sleep (DFUD)
                                            \_SB.WTGP (0x2C, OLDV)
                                        }

                                        Return (Zero)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x03))
                                        {
                                            Store (\_SB.RDGP (0x2C), DFUV)
                                            Store (\_SB.RDGP (0x2E), PGCV)
                                            Return (Package (0x02)
                                            {
                                                PGCV, 
                                                DFUV
                                            })
                                        }
                                    }
                                }
                            }

                            Break
                        }

                        Return (Zero)
                    }

                    Return (Zero)
                }

                Return (Zero)
            }
        }
    }
}

