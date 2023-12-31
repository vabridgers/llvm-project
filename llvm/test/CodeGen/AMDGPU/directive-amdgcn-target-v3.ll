; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx600 < %s | FileCheck --check-prefixes=V3-GFX600 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=tahiti < %s | FileCheck --check-prefixes=V3-GFX600 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx601 < %s | FileCheck --check-prefixes=V3-GFX601 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=pitcairn < %s | FileCheck --check-prefixes=V3-GFX601 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=verde < %s | FileCheck --check-prefixes=V3-GFX601 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx602 < %s | FileCheck --check-prefixes=V3-GFX602 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=hainan < %s | FileCheck --check-prefixes=V3-GFX602 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=oland < %s | FileCheck --check-prefixes=V3-GFX602 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx700 < %s | FileCheck --check-prefixes=V3-GFX700 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=kaveri < %s | FileCheck --check-prefixes=V3-GFX700 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx701 < %s | FileCheck --check-prefixes=V3-GFX701 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=hawaii < %s | FileCheck --check-prefixes=V3-GFX701 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx702 < %s | FileCheck --check-prefixes=V3-GFX702 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx703 < %s | FileCheck --check-prefixes=V3-GFX703 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=kabini < %s | FileCheck --check-prefixes=V3-GFX703 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=mullins < %s | FileCheck --check-prefixes=V3-GFX703 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx704 < %s | FileCheck --check-prefixes=V3-GFX704 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=bonaire < %s | FileCheck --check-prefixes=V3-GFX704 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx705 < %s | FileCheck --check-prefixes=V3-GFX705 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx801 < %s | FileCheck --check-prefixes=V3-GFX801-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx801 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX801-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx801 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX801-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=carrizo < %s | FileCheck --check-prefixes=V3-GFX801-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=carrizo -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX801-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=carrizo -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX801-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx802 < %s | FileCheck --check-prefixes=V3-GFX802 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=iceland < %s | FileCheck --check-prefixes=V3-GFX802 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=tonga < %s | FileCheck --check-prefixes=V3-GFX802 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx803 < %s | FileCheck --check-prefixes=V3-GFX803 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=fiji < %s | FileCheck --check-prefixes=V3-GFX803 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=polaris10 < %s | FileCheck --check-prefixes=V3-GFX803 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=polaris11 < %s | FileCheck --check-prefixes=V3-GFX803 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx805 < %s | FileCheck --check-prefixes=V3-GFX805 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=tongapro < %s | FileCheck --check-prefixes=V3-GFX805 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx810 < %s | FileCheck --check-prefixes=V3-GFX810-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx810 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX810-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx810 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX810-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=stoney < %s | FileCheck --check-prefixes=V3-GFX810-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=stoney -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX810-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=stoney -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX810-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx900 < %s | FileCheck --check-prefixes=V3-GFX900-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx900 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX900-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx900 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX900-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx902 < %s | FileCheck --check-prefixes=V3-GFX902-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx902 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX902-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx902 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX902-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx904 < %s | FileCheck --check-prefixes=V3-GFX904-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx904 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX904-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx904 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX904-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 < %s | FileCheck --check-prefixes=V3-GFX906-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=-sramecc < %s | FileCheck --check-prefixes=V3-GFX906-NOSRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=+sramecc < %s | FileCheck --check-prefixes=V3-GFX906-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX906-SRAMECC-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX906-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=-sramecc,-xnack < %s | FileCheck --check-prefixes=V3-GFX906-NOSRAMECC-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=+sramecc,-xnack < %s | FileCheck --check-prefixes=V3-GFX906-SRAMECC-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=-sramecc,+xnack < %s | FileCheck --check-prefixes=V3-GFX906-NOSRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx906 -mattr=+sramecc,+xnack < %s | FileCheck --check-prefixes=V3-GFX906-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 < %s | FileCheck --check-prefixes=V3-GFX908-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=-sramecc < %s | FileCheck --check-prefixes=V3-GFX908-NOSRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=+sramecc < %s | FileCheck --check-prefixes=V3-GFX908-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX908-SRAMECC-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX908-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=-sramecc,-xnack < %s | FileCheck --check-prefixes=V3-GFX908-NOSRAMECC-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=+sramecc,-xnack < %s | FileCheck --check-prefixes=V3-GFX908-SRAMECC-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=-sramecc,+xnack < %s | FileCheck --check-prefixes=V3-GFX908-NOSRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx908 -mattr=+sramecc,+xnack < %s | FileCheck --check-prefixes=V3-GFX908-SRAMECC-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx909 < %s | FileCheck --check-prefixes=V3-GFX909-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx909 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX909-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx909 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX909-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx90c < %s | FileCheck --check-prefixes=V3-GFX90C-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx90c -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX90C-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx90c -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX90C-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx940 < %s | FileCheck --check-prefixes=V3-GFX940-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx940 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX940-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx940 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX940-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1010 < %s | FileCheck --check-prefixes=V3-GFX1010-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1010 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX1010-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1010 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX1010-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1011 < %s | FileCheck --check-prefixes=V3-GFX1011-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1011 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX1011-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1011 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX1011-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1012 < %s | FileCheck --check-prefixes=V3-GFX1012-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1012 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX1012-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1012 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX1012-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1013 < %s | FileCheck --check-prefixes=V3-GFX1013-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1013 -mattr=-xnack < %s | FileCheck --check-prefixes=V3-GFX1013-NOXNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1013 -mattr=+xnack < %s | FileCheck --check-prefixes=V3-GFX1013-XNACK %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1030 < %s | FileCheck --check-prefixes=V3-GFX1030 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1031 < %s | FileCheck --check-prefixes=V3-GFX1031 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1032 < %s | FileCheck --check-prefixes=V3-GFX1032 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1033 < %s | FileCheck --check-prefixes=V3-GFX1033 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1034 < %s | FileCheck --check-prefixes=V3-GFX1034 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1035 < %s | FileCheck --check-prefixes=V3-GFX1035 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1036 < %s | FileCheck --check-prefixes=V3-GFX1036 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1100 < %s | FileCheck --check-prefixes=V3-GFX1100 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1101 < %s | FileCheck --check-prefixes=V3-GFX1101 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1102 < %s | FileCheck --check-prefixes=V3-GFX1102 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1103 < %s | FileCheck --check-prefixes=V3-GFX1103 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1150 < %s | FileCheck --check-prefixes=V3-GFX1150 %s
; RUN: llc -mtriple=amdgcn-amd-amdhsa -mcpu=gfx1151 < %s | FileCheck --check-prefixes=V3-GFX1151 %s

; V3-GFX600: .amdgcn_target "amdgcn-amd-amdhsa--gfx600"
; V3-GFX601: .amdgcn_target "amdgcn-amd-amdhsa--gfx601"
; V3-GFX602: .amdgcn_target "amdgcn-amd-amdhsa--gfx602"
; V3-GFX700: .amdgcn_target "amdgcn-amd-amdhsa--gfx700"
; V3-GFX701: .amdgcn_target "amdgcn-amd-amdhsa--gfx701"
; V3-GFX702: .amdgcn_target "amdgcn-amd-amdhsa--gfx702"
; V3-GFX703: .amdgcn_target "amdgcn-amd-amdhsa--gfx703"
; V3-GFX704: .amdgcn_target "amdgcn-amd-amdhsa--gfx704"
; V3-GFX705: .amdgcn_target "amdgcn-amd-amdhsa--gfx705"
; V3-GFX801-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx801"
; V3-GFX801-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx801+xnack"
; V3-GFX802: .amdgcn_target "amdgcn-amd-amdhsa--gfx802"
; V3-GFX803: .amdgcn_target "amdgcn-amd-amdhsa--gfx803"
; V3-GFX805: .amdgcn_target "amdgcn-amd-amdhsa--gfx805"
; V3-GFX810-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx810"
; V3-GFX810-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx810+xnack"
; V3-GFX900-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx900"
; V3-GFX900-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx900+xnack"
; V3-GFX902-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx902"
; V3-GFX902-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx902+xnack"
; V3-GFX904-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx904"
; V3-GFX904-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx904+xnack"
; V3-GFX906-NOSRAMECC-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx906"
; V3-GFX906-SRAMECC-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx906+sram-ecc"
; V3-GFX906-NOSRAMECC-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx906+xnack"
; V3-GFX906-SRAMECC-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx906+xnack+sram-ecc"
; V3-GFX908-NOSRAMECC-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx908"
; V3-GFX908-SRAMECC-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx908+sram-ecc"
; V3-GFX908-NOSRAMECC-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx908+xnack"
; V3-GFX908-SRAMECC-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx908+xnack+sram-ecc"
; V3-GFX909-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx909"
; V3-GFX909-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx909+xnack"
; V3-GFX90C-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx90c"
; V3-GFX90C-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx90c+xnack"
; V3-GFX940-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx940+sram-ecc"
; V3-GFX940-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx940+xnack+sram-ecc"
; V3-GFX1010-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1010"
; V3-GFX1010-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1010+xnack"
; V3-GFX1011-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1011"
; V3-GFX1011-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1011+xnack"
; V3-GFX1012-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1012"
; V3-GFX1012-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1012+xnack"
; V3-GFX1013-NOXNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1013"
; V3-GFX1013-XNACK: .amdgcn_target "amdgcn-amd-amdhsa--gfx1013+xnack"
; V3-GFX1030: .amdgcn_target "amdgcn-amd-amdhsa--gfx1030"
; V3-GFX1031: .amdgcn_target "amdgcn-amd-amdhsa--gfx1031"
; V3-GFX1032: .amdgcn_target "amdgcn-amd-amdhsa--gfx1032"
; V3-GFX1033: .amdgcn_target "amdgcn-amd-amdhsa--gfx1033"
; V3-GFX1034: .amdgcn_target "amdgcn-amd-amdhsa--gfx1034"
; V3-GFX1035: .amdgcn_target "amdgcn-amd-amdhsa--gfx1035"
; V3-GFX1036: .amdgcn_target "amdgcn-amd-amdhsa--gfx1036"
; V3-GFX1100: .amdgcn_target "amdgcn-amd-amdhsa--gfx1100"
; V3-GFX1101: .amdgcn_target "amdgcn-amd-amdhsa--gfx1101"
; V3-GFX1102: .amdgcn_target "amdgcn-amd-amdhsa--gfx1102"
; V3-GFX1103: .amdgcn_target "amdgcn-amd-amdhsa--gfx1103"
; V3-GFX1150: .amdgcn_target "amdgcn-amd-amdhsa--gfx1150"
; V3-GFX1151: .amdgcn_target "amdgcn-amd-amdhsa--gfx1151"



define amdgpu_kernel void @directive_amdgcn_target() {
  ret void
}

!llvm.module.flags = !{!0}
!0 = !{i32 1, !"amdgpu_code_object_version", i32 300}
