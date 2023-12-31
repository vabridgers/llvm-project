//===-- LowLevelIntrinsics.cpp --------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Coding style: https://mlir.llvm.org/getting_started/DeveloperGuide/
//
//===----------------------------------------------------------------------===//
//
// Low level intrinsic functions.
//
// These include LLVM intrinsic calls and standard C library calls.
// Target-specific calls, such as OS functions, should be factored in other
// file(s).
//
//===----------------------------------------------------------------------===//

#include "flang/Optimizer/Builder/LowLevelIntrinsics.h"
#include "flang/Optimizer/Builder/FIRBuilder.h"

mlir::func::FuncOp fir::factory::getLlvmMemcpy(fir::FirOpBuilder &builder) {
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  llvm::SmallVector<mlir::Type> args = {ptrTy, ptrTy, builder.getI64Type(),
                                        builder.getI1Type()};
  auto memcpyTy =
      mlir::FunctionType::get(builder.getContext(), args, std::nullopt);
  return builder.addNamedFunction(builder.getUnknownLoc(),
                                  "llvm.memcpy.p0.p0.i64", memcpyTy);
}

mlir::func::FuncOp fir::factory::getLlvmMemmove(fir::FirOpBuilder &builder) {
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  llvm::SmallVector<mlir::Type> args = {ptrTy, ptrTy, builder.getI64Type(),
                                        builder.getI1Type()};
  auto memmoveTy =
      mlir::FunctionType::get(builder.getContext(), args, std::nullopt);
  return builder.addNamedFunction(builder.getUnknownLoc(),
                                  "llvm.memmove.p0.p0.i64", memmoveTy);
}

mlir::func::FuncOp fir::factory::getLlvmMemset(fir::FirOpBuilder &builder) {
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  llvm::SmallVector<mlir::Type> args = {ptrTy, ptrTy, builder.getI64Type(),
                                        builder.getI1Type()};
  auto memsetTy =
      mlir::FunctionType::get(builder.getContext(), args, std::nullopt);
  return builder.addNamedFunction(builder.getUnknownLoc(),
                                  "llvm.memset.p0.p0.i64", memsetTy);
}

mlir::func::FuncOp fir::factory::getRealloc(fir::FirOpBuilder &builder) {
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  llvm::SmallVector<mlir::Type> args = {ptrTy, builder.getI64Type()};
  auto reallocTy = mlir::FunctionType::get(builder.getContext(), args, {ptrTy});
  return builder.addNamedFunction(builder.getUnknownLoc(), "realloc",
                                  reallocTy);
}

mlir::func::FuncOp
fir::factory::getLlvmGetRounding(fir::FirOpBuilder &builder) {
  auto int32Ty = builder.getIntegerType(32);
  auto funcTy =
      mlir::FunctionType::get(builder.getContext(), std::nullopt, {int32Ty});
  return builder.addNamedFunction(builder.getUnknownLoc(), "llvm.get.rounding",
                                  funcTy);
}

mlir::func::FuncOp
fir::factory::getLlvmSetRounding(fir::FirOpBuilder &builder) {
  auto int32Ty = builder.getIntegerType(32);
  auto funcTy =
      mlir::FunctionType::get(builder.getContext(), {int32Ty}, std::nullopt);
  return builder.addNamedFunction(builder.getUnknownLoc(), "llvm.set.rounding",
                                  funcTy);
}

mlir::func::FuncOp fir::factory::getLlvmStackSave(fir::FirOpBuilder &builder) {
  // FIXME: This should query the target alloca address space
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  auto funcTy =
      mlir::FunctionType::get(builder.getContext(), std::nullopt, {ptrTy});
  return builder.addNamedFunction(builder.getUnknownLoc(), "llvm.stacksave.p0",
                                  funcTy);
}

mlir::func::FuncOp
fir::factory::getLlvmStackRestore(fir::FirOpBuilder &builder) {
  // FIXME: This should query the target alloca address space
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  auto funcTy =
      mlir::FunctionType::get(builder.getContext(), {ptrTy}, std::nullopt);
  return builder.addNamedFunction(builder.getUnknownLoc(), "llvm.stackrestore.p0",
                                  funcTy);
}

mlir::func::FuncOp
fir::factory::getLlvmInitTrampoline(fir::FirOpBuilder &builder) {
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  auto funcTy = mlir::FunctionType::get(builder.getContext(),
                                        {ptrTy, ptrTy, ptrTy}, std::nullopt);
  return builder.addNamedFunction(builder.getUnknownLoc(),
                                  "llvm.init.trampoline", funcTy);
}

mlir::func::FuncOp
fir::factory::getLlvmAdjustTrampoline(fir::FirOpBuilder &builder) {
  auto ptrTy = builder.getRefType(builder.getIntegerType(8));
  auto funcTy = mlir::FunctionType::get(builder.getContext(), {ptrTy}, {ptrTy});
  return builder.addNamedFunction(builder.getUnknownLoc(),
                                  "llvm.adjust.trampoline", funcTy);
}
