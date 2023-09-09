// RUN: %check_clang_tidy %s bugprone-inc-dec-in-conditions %t

#define foo(x)                                                 \
  ({                                                           \
    _BitInt(5) y = x;                                          \
    16777215wb ?: ++y;                                         \
  })

_BitInt(8) v_401_0() { 0 && foo(0); }
// CHECK-MESSAGES: warning 
