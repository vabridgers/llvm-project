// RUN: mlir-opt %s -test-transform-dialect-interpreter -split-input-file -verify-diagnostics | FileCheck %s

//       CHECK: #[[$MAP:.*]] = affine_map<(d0, d1) -> (d1, d0)>

// CHECK-LABEL: @interchange_generic
func.func @interchange_generic(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {

  //      CHECK:   linalg.generic
  // CHECK-SAME:   indexing_maps = [#[[$MAP]], #[[$MAP]]
  %0 = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) {
  ^bb0(%arg2: f32, %arg3: f32):
    %1 = math.exp %arg2 : f32
    linalg.yield %1 : f32
  } -> tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}

transform.sequence failures(propagate) {
^bb1(%arg1: !transform.any_op):
  %0 = transform.structured.match ops{["linalg.generic"]} in %arg1 : (!transform.any_op) -> !transform.any_op
  transform.structured.interchange %0 iterator_interchange = [1, 0] : (!transform.any_op) -> !transform.any_op
}

// -----

func.func @interchange_matmul(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
  // expected-note @below {{when applied to this op}}
  %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
  return %0 : tensor<?x?xf32>
}

transform.sequence failures(propagate) {
^bb1(%arg1: !transform.any_op):
  %0 = transform.structured.match ops{["linalg.matmul"]} in %arg1 : (!transform.any_op) -> !transform.any_op
  // expected-error @below {{transform applied to the wrong op kind}}
  transform.structured.interchange %0 iterator_interchange = [1, 0] : (!transform.any_op) -> !transform.any_op
}
