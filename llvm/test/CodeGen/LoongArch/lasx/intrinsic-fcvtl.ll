; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc --mtriple=loongarch64 --mattr=+lasx < %s | FileCheck %s

declare <8 x float> @llvm.loongarch.lasx.xvfcvtl.s.h(<16 x i16>)

define <8 x float> @lasx_xvfcvtl_s_h(<16 x i16> %va) nounwind {
; CHECK-LABEL: lasx_xvfcvtl_s_h:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvfcvtl.s.h $xr0, $xr0
; CHECK-NEXT:    ret
entry:
  %res = call <8 x float> @llvm.loongarch.lasx.xvfcvtl.s.h(<16 x i16> %va)
  ret <8 x float> %res
}

declare <4 x double> @llvm.loongarch.lasx.xvfcvtl.d.s(<8 x float>)

define <4 x double> @lasx_xvfcvtl_d_s(<8 x float> %va) nounwind {
; CHECK-LABEL: lasx_xvfcvtl_d_s:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xvfcvtl.d.s $xr0, $xr0
; CHECK-NEXT:    ret
entry:
  %res = call <4 x double> @llvm.loongarch.lasx.xvfcvtl.d.s(<8 x float> %va)
  ret <4 x double> %res
}
