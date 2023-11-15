open OUnit2
open Sudoku  

let suite =
  "Sudoku Test Suite" >::: [
    "Test is_valid_move" >:: (fun _ ->
      let board = [|
        [|5; 3; 0; 0; 7; 0; 0; 0; 0|];
        [|6; 0; 0; 1; 9; 5; 0; 0; 0|];
        [|0; 9; 8; 0; 0; 0; 0; 6; 0|];
        [|8; 0; 0; 0; 6; 0; 0; 0; 3|];
        [|4; 0; 0; 8; 0; 3; 0; 0; 1|];
        [|7; 0; 0; 0; 2; 0; 0; 0; 6|];
        [|0; 6; 0; 0; 0; 0; 2; 8; 0|];
        [|0; 0; 0; 4; 1; 9; 0; 0; 5|];
        [|0; 0; 0; 0; 8; 0; 0; 7; 9|];
      |] in
      assert_bool "Test case 1" (Sudoku.is_valid_move board 0 2 4);
      assert_bool "Test case 2" (not (Sudoku.is_valid_move board 1 2 3));
      assert_bool "Test case 3" (Sudoku.is_valid_move board 2 2 7);
      assert_bool "Test case 4" (Sudoku.is_valid_move board 3 4 5);
      assert_bool "Test case 5" (not (Sudoku.is_valid_move board 4 4 3))
    );
  ]

let () = run_test_tt_main suite

