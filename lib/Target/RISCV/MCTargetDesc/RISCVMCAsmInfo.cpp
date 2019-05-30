//===-- RISCVMCAsmInfo.cpp - RISCV Asm properties -------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// This file contains the declarations of the RISCVMCAsmInfo properties.
//
//===----------------------------------------------------------------------===//

#include "RISCVMCAsmInfo.h"
#include "llvm/ADT/Triple.h"
#include "llvm/BinaryFormat/Dwarf.h"
#include "llvm/MC/MCStreamer.h"
using namespace llvm;

void RISCVMCAsmInfo::anchor() {}

RISCVMCAsmInfo::RISCVMCAsmInfo(const Triple &TT) {
  CodePointerSize = CalleeSaveStackSlotSize = TT.isArch64Bit() ? 8 : 4;
  CommentString = "#";
  AlignmentIsInBytes = false;
  SupportsDebugInformation = true;
  Data16bitsDirective = "\t.half\t";
  Data32bitsDirective = "\t.word\t";

  ExceptionsType = ExceptionHandling::DwarfCFI;
}

const MCExpr*
RISCVMCAsmInfo::getExprForFDESymbol(const MCSymbol *Sym,
                                    unsigned Encoding,
                                    MCStreamer &Streamer) const {
  MCContext &Ctx = Streamer.getContext();
  if (Encoding | dwarf::DW_EH_PE_pcrel)
    return MCSymbolRefExpr::create(Sym, MCSymbolRefExpr::VK_RISCV_PCREL, Ctx);
  else
    return MCSymbolRefExpr::create(Sym, Ctx);
}
