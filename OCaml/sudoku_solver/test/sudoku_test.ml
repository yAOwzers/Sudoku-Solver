open OUnit2

let test_is_valid_move _=
  let board =
    [|
      [| 5; 3; 0; 0; 7; 0; 0; 0; 0 |];
      [| 6; 0; 0; 1; 9; 5; 0; 0; 0 |];
      [| 0; 9; 8; 0; 0; 0; 0; 6; 0 |];
      [| 8; 0; 0; 0; 6; 0; 0; 0; 3 |];
      [| 4; 0; 0; 8; 0; 3; 0; 0; 1 |];
      [| 7; 0; 0; 0; 2; 0; 0; 0; 6 |];
      [| 0; 6; 0; 0; 0; 0; 2; 8; 0 |];
      [| 0; 0; 0; 4; 1; 9; 0; 0; 5 |];
      [| 0; 0; 0; 0; 8; 0; 0; 7; 9 |];
    |]
  in
  assert_bool "Test case 1" (Sudoku.is_valid_move board 0 2 0);
  assert_bool "Test case 2" (not (Sudoku.is_valid_move board 1 2 3));
  assert_bool "Test case 3" (Sudoku.is_valid_move board 2 2 8);
  assert_bool "Test case 4" (Sudoku.is_valid_move board 3 4 6);
  assert_bool "Test case 5" (not (Sudoku.is_valid_move board 4 4 10));
;;

let test_find_empty_cell _ =
  let board =
    [|
      [| 5; 3; 0; 0; 7; 0; 0; 0; 0 |];
      [| 6; 0; 0; 1; 9; 5; 0; 0; 0 |];
      [| 0; 9; 8; 0; 0; 0; 0; 6; 0 |];
      [| 8; 0; 0; 0; 6; 0; 0; 0; 3 |];
      [| 4; 0; 0; 8; 0; 3; 0; 0; 1 |];
      [| 7; 0; 0; 0; 2; 0; 0; 0; 6 |];
      [| 0; 6; 0; 0; 0; 0; 2; 8; 0 |];
      [| 0; 0; 0; 4; 1; 9; 0; 0; 5 |];
      [| 0; 0; 0; 0; 8; 0; 0; 7; 9 |];
    |]
  in
  match Sudoku.find_empty_cell board with
  | Some (row, col) -> 
    let expected = (0, 2) in
    assert_equal ~printer:(fun (row, col) -> Printf.sprintf "(%d, %d)" row col) expected (row, col);
  | None -> 
    assert_failure "Expected an empty cell but got None";

  let board =
    [|
      [| 5; 3; 1; 0; 7; 0; 0; 0; 0 |];
      [| 6; 0; 0; 1; 9; 5; 0; 0; 0 |];
      [| 0; 9; 8; 0; 0; 0; 0; 6; 0 |];
      [| 8; 0; 0; 0; 6; 0; 0; 0; 3 |];
      [| 4; 0; 0; 8; 0; 3; 0; 0; 1 |];
      [| 7; 0; 0; 0; 2; 0; 0; 0; 6 |];
      [| 0; 6; 0; 0; 0; 0; 2; 8; 0 |];
      [| 0; 0; 0; 4; 1; 9; 0; 0; 5 |];
      [| 0; 0; 0; 0; 8; 0; 0; 7; 9 |];
    |]
  in
  match Sudoku.find_empty_cell board with
  | Some (row, col) -> 
    let expected = (0, 5) in
    assert_equal ~printer:(fun (row, col) -> Printf.sprintf "(%d, %d)" row col) expected (row, col);
  | None -> 
    assert_failure "Expected an empty cell but got None";
;;

let suite =
  "Sudoku Test Suite"
  >::: [
        "Test is_valid_move" >:: test_is_valid_move;
        "Test find_empty_cell" >:: test_find_empty_cell;
       ]


let () = run_test_tt_main suite
