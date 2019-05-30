# Test the bits of .eh_frame on riscv that are already implemented correctly.

# RUN: llvm-mc -filetype=obj %s -o %t.o -triple riscv32
# RUN: llvm-dwarfdump -eh-frame %t.o | FileCheck --check-prefixes=CHECK,RV32 %s

# RUN: llvm-mc -filetype=obj %s -o %t.o -triple riscv64
# RUN: llvm-dwarfdump -eh-frame %t.o | FileCheck --check-prefixes=CHECK,RV64 %s

func:
	.cfi_startproc
	.cfi_endproc

# CHECK: 00000000 00000010 ffffffff CIE
# CHECK:   Version:               1
# CHECK:   Augmentation:          "zR"
# CHECK:   Code alignment factor: 1

# RV32:    Data alignment factor: -4
# RV64:    Data alignment factor: -8
#                                 ^-- GAS uses -4. Should be okay provided all
#                                     offsets are multiples of 8

# CHECK:   Return address column: 1
# CHECK:   Augmentation data:     1B
#                                 ^-- FDE encoding: DW_EH_PE_pcrel |
#                                                   DW_EH_PE_sdata4
# CHECK:   DW_CFA_def_cfa: reg2 +0
#
# CHECK: 00000014 00000010 00000018 FDE cie=00000018 pc=00000000...00000000
# CHECK:   DW_CFA_nop:
# CHECK:   DW_CFA_nop:
# CHECK:   DW_CFA_nop:
