/*
 * Intel ACPI Component Architecture
 * AML Disassembler version 20120420-32 [Apr 20 2012]
 * Copyright (c) 2000 - 2012 Intel Corporation
 * 
 * Disassembly of SSDT2.aml, Wed Nov 26 01:36:47 2014
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000160 (352)
 *     Revision         0x01
 *     Checksum         0x78
 *     OEM ID           "Intel"
 *     OEM Table ID     "zpodd"
 *     OEM Revision     0x00001000 (4096)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20120711 (538052369)
 */

DefinitionBlock ("SSDT2.aml", "SSDT", 1, "Intel", "zpodd", 0x00001000)
{
    External (GPE3, FieldUnitObj)
    External (FDTP, IntObj)
    External (PFLV, FieldUnitObj)
    External (RTD3, FieldUnitObj)
    External (\GL08, FieldUnitObj)
    External (\_SB_.PCI0.SAT0)
    External (\_SB_.PCI0.SAT0.PRT1, DeviceObj)

    OperationRegion (ECBX, SystemIO, 0xB2, 0x02)
    Field (ECBX, ByteAcc, NoLock, Preserve)
    {
        ECSI,   8, 
        ECSD,   8
    }

    If (LEqual (RTD3, Zero))
    {
        Scope (\_SB.PCI0.SAT0.PRT1)
        {
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0x30, 0xEF, 0xFA, 0xBD, 0xBB, 0xAE, 0xDE, 0x11,
                            /* 0008 */   0x8A, 0x39, 0x08, 0x00, 0x20, 0x0C, 0x9A, 0x66
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    If (LEqual (PFLV, FDTP))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00
                                        })
                                    }

                                    Return (Buffer (One)
                                    {
                                         0x0F
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }

                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (One)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x02))
                                {
                                    Store (0x55, ECSD)
                                    Store (0xE2, ECSI)
                                    Return (One)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03))
                                    {
                                        Store (0xAA, ECSD)
                                        Store (0xE2, ECSI)
                                        Return (One)
                                    }
                                    Else
                                    {
                                        Return (Zero)
                                    }
                                }
                            }
                        }

                        Break
                    }
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Scope (\_GPE)
        {
            Method (_L13, 0, NotSerialized)
            {
                If (LEqual (PFLV, FDTP))
                {
                    Return (Zero)
                }

                Store (Zero, GPE3)
                Or (\GL08, 0x10, \GL08)
                Notify (\_SB.PCI0.SAT0, 0x82)
                Return (Zero)
            }
        }
    }
}

