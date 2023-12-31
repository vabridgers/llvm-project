; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py UTC_ARGS: --version 3
; Test 64-bit addition in which the second operand is constant and in which
; three-operand forms are available.
;
; RUN: llc < %s -mtriple=s390x-linux-gnu -mcpu=z196 | FileCheck %s

declare i64 @foo()

; Check subtraction of 1.
define zeroext i1 @f1(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f1:
; CHECK:       # %bb.0:
; CHECK-NEXT:    alghsik %r0, %r3, -1
; CHECK-NEXT:    stg %r0, 0(%r4)
; CHECK-NEXT:    ipm %r1
; CHECK-NEXT:    afi %r1, -536870912
; CHECK-NEXT:    risbg %r2, %r1, 63, 191, 33
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 1)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  ret i1 %obit
}

; Check the high end of the ALGHSIK range.
define zeroext i1 @f2(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    alghsik %r0, %r3, -32768
; CHECK-NEXT:    stg %r0, 0(%r4)
; CHECK-NEXT:    ipm %r1
; CHECK-NEXT:    afi %r1, -536870912
; CHECK-NEXT:    risbg %r2, %r1, 63, 191, 33
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 32768)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  ret i1 %obit
}

; Check the next value up, which must use SLGFI instead.
define zeroext i1 @f3(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f3:
; CHECK:       # %bb.0:
; CHECK-NEXT:    slgfi %r3, 32769
; CHECK-NEXT:    stg %r3, 0(%r4)
; CHECK-NEXT:    ipm %r0
; CHECK-NEXT:    afi %r0, -536870912
; CHECK-NEXT:    risbg %r2, %r0, 63, 191, 33
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 32769)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  ret i1 %obit
}

; Check the high end of the negative ALGHSIK range.
define zeroext i1 @f4(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    alghsik %r0, %r3, 1
; CHECK-NEXT:    stg %r0, 0(%r4)
; CHECK-NEXT:    ipm %r1
; CHECK-NEXT:    afi %r1, -536870912
; CHECK-NEXT:    risbg %r2, %r1, 63, 191, 33
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 -1)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  ret i1 %obit
}

; Check the low end of the ALGHSIK range.
define zeroext i1 @f5(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f5:
; CHECK:       # %bb.0:
; CHECK-NEXT:    alghsik %r0, %r3, 32767
; CHECK-NEXT:    stg %r0, 0(%r4)
; CHECK-NEXT:    ipm %r1
; CHECK-NEXT:    afi %r1, -536870912
; CHECK-NEXT:    risbg %r2, %r1, 63, 191, 33
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 -32767)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  ret i1 %obit
}

; Test the next value down, which cannot use either ALGHSIK or SLGFI.
define zeroext i1 @f6(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    lghi %r0, -32768
; CHECK-NEXT:    slgr %r3, %r0
; CHECK-NEXT:    ipm %r0
; CHECK-NEXT:    afi %r0, -536870912
; CHECK-NEXT:    risbg %r2, %r0, 63, 191, 33
; CHECK-NEXT:    stg %r3, 0(%r4)
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 -32768)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  ret i1 %obit
}

; Check using the overflow result for a branch.
define void @f7(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f7:
; CHECK:       # %bb.0:
; CHECK-NEXT:    alghsik %r0, %r3, -1
; CHECK-NEXT:    stg %r0, 0(%r4)
; CHECK-NEXT:    jgle foo@PLT
; CHECK-NEXT:  .LBB6_1: # %exit
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 1)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  br i1 %obit, label %call, label %exit

call:
  tail call i64 @foo()
  br label %exit

exit:
  ret void
}

; ... and the same with the inverted direction.
define void @f8(i64 %dummy, i64 %a, ptr %res) {
; CHECK-LABEL: f8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    alghsik %r0, %r3, -1
; CHECK-NEXT:    stg %r0, 0(%r4)
; CHECK-NEXT:    jgnle foo@PLT
; CHECK-NEXT:  .LBB7_1: # %exit
; CHECK-NEXT:    br %r14
  %t = call {i64, i1} @llvm.usub.with.overflow.i64(i64 %a, i64 1)
  %val = extractvalue {i64, i1} %t, 0
  %obit = extractvalue {i64, i1} %t, 1
  store i64 %val, ptr %res
  br i1 %obit, label %exit, label %call

call:
  tail call i64 @foo()
  br label %exit

exit:
  ret void
}


declare {i64, i1} @llvm.usub.with.overflow.i64(i64, i64) nounwind readnone

