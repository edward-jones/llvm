; RUN: llc -march=riscv32 --code-model=small  < %s | FileCheck --check-prefixes=CHECK,SMALL %s
; RUN: llc -march=riscv32 --code-model=medium < %s | FileCheck --check-prefixes=CHECK,MED   %s
; RUN: llc -march=riscv32 --code-model=small  -relocation-model=pic < %s | FileCheck --check-prefixes=CHECK,PIC %s
; RUN: llc -march=riscv32 --code-model=medium -relocation-model=pic < %s | FileCheck --check-prefixes=CHECK,PIC %s

; RUN: llc -march=riscv64 --code-model=small  < %s | FileCheck --check-prefixes=CHECK,SMALL %s
; RUN: llc -march=riscv64 --code-model=medium < %s | FileCheck --check-prefixes=CHECK,MED   %s
; RUN: llc -march=riscv64 --code-model=small  -relocation-model=pic < %s | FileCheck --check-prefixes=CHECK,PIC %s
; RUN: llc -march=riscv64 --code-model=medium -relocation-model=pic < %s | FileCheck --check-prefixes=CHECK,PIC %s

declare i8* @__cxa_allocate_exception(i64)
declare void @__cxa_throw(i8*, i8*, i8*)
declare i32 @__gxx_personality_v0(...)
declare i32 @llvm.eh.typeid.for(i8*) nounwind readnone
declare i8* @__cxa_begin_catch(i8*)
declare void @__cxa_end_catch()

@_ZTIi = external constant i8*

; CHECK-LABEL: foo:
; CHECK:      .cfi_startproc
;
;   # Personality encoding #
; SMALL-NEXT: .cfi_personality 131, DW.ref.__gxx_personality_v0
;                               ^-- Personality encoding: DW_EH_PE_indirect |
;                                                         DW_EH_PE_udata4
; MED-NEXT:   .cfi_personality 128, DW.ref.__gxx_personality_v0
;                               ^-- Personality encoding: DW_EH_PE_indirect |
;                                                         DW_EH_PE_absptr
; PIC-NEXT:   .cfi_personality 155, DW.ref.__gxx_personality_v0
;                               ^-- Personality encoding: DW_EH_PE_indirect |
;                                                         DW_EH_PE_pcrel |
;                                                         DW_EH_PE_sdata4
;   # LSDA encoding #
; SMALL-NEXT: .cfi_lsda 3, .Lexception0
;                       ^-- LSDA encoding: DW_EH_PE_udata4
; MED-NEXT:   .cfi_lsda 0, .Lexception0
;                       ^-- LSDA encoding: DW_EH_PE_absptr
; PIC-NEXT:   .cfi_lsda 27, .Lexception0
;                       ^-- LSDA encoding: DW_EH_PE_pcrel | DW_EH_PE_sdata4
define signext i32 @foo() personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
entry:
  %exception = tail call i8* @__cxa_allocate_exception(i64 4)
  %0 = bitcast i8* %exception to i32*
  store i32 5, i32* %0, align 16
  invoke void @__cxa_throw(i8* %exception, i8* bitcast (i8** @_ZTIi to i8*), i8* null)
          to label %unreachable unwind label %lpad

lpad:
  %1 = landingpad { i8*, i32 }
          catch i8* bitcast (i8** @_ZTIi to i8*)
  %2 = extractvalue { i8*, i32 } %1, 1
  %3 = tail call i32 @llvm.eh.typeid.for(i8* bitcast (i8** @_ZTIi to i8*))
  %matches = icmp eq i32 %2, %3
  br i1 %matches, label %catch, label %eh.resume

catch:
  %4 = extractvalue { i8*, i32 } %1, 0
  %5 = tail call i8* @__cxa_begin_catch(i8* %4)
  %6 = bitcast i8* %5 to i32*
  %7 = load i32, i32* %6, align 4
  tail call void @__cxa_end_catch()
  ret i32 %7

eh.resume:
  resume { i8*, i32 } %1

unreachable:
  unreachable
}

; CHECK:      .section .gcc_except_table,"a",@progbits
; CHECK:      GCC_except_table0:
; CHECK-NEXT: .Lexception0:
; CHECK-NEXT: .byte  255
;                     ^-- Landing pad base encoding: DW_EH_PE_omit
;
;   # Type table encoding #
; SMALL-NEXT: .byte  3
;                    ^-- Type table encoding: DW_EH_PE_udata4
; MED-NEXT:   .byte  0
;                    ^-- Type table encoding: DW_EH_PE_absptr
; PIC-NEXT:   .byte  155
;                    ^-- Type table encoding: DW_EH_PE_indirect |
;                                             DW_EH_PE_pcrel |
;                                             DW_EH_PE_sdata4
;   # Call site encoding #
; CHECK:      .Lttbaseref0:
; CHECK-NEXT: .byte  3
;                    ^-- Call site encoding: DW_EH_PE_udata4
;   # Call sites #
;   Unlike most other targets these are encoded as DW_EH_PE_udata4 instead
;   of DW_EH_PE_uleb128, as we can't emit relocation for a difference between
;   uleb128 encoded values.
;
; CHECK:      .Lcst_begin0:
; CHECK-NEXT: .word  .Lfunc_begin0-.Lfunc_begin0
; CHECK-NEXT: .word  .Ltmp0-.Lfunc_begin0
; CHECK-NEXT: .word  0
; CHECK-NEXT: .byte  0
; CHECK-NEXT: .word  .Ltmp0-.Lfunc_begin0
; CHECK-NEXT: .word  .Ltmp1-.Ltmp0
; CHECK-NEXT: .word  .Ltmp2-.Lfunc_begin0
; CHECK-NEXT: .byte  1
; CHECK-NEXT: .word  .Ltmp1-.Lfunc_begin0
; CHECK-NEXT: .word  .Lfunc_end0-.Ltmp1
; CHECK-NEXT: .word  0
; CHECK-NEXT: .byte  0
; CHECK-NEXT: .Lcst_end0:
