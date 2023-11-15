(* OCaml Version of the code *)

module Sudoku = struct
  (* Main function to run *)
  type board = int array array

  let print_board board = 
    Array.iter (fun row ->
      Array.iter (fun col -> Printf.printf "%d " col) row;
      print_newline()) board
  ;;

  (* to check if the number is in row, col and subgrid *) 
  let is_valid_move board row col num = 
    Array.exists (( = ) num) board.(row) && 
    Array.exists (fun r -> r.(col) = num) board &&
    Array.exists (fun r -> Array.exists (( = ) num) (Array.sub r col 3)) (Array.sub board row 3)
  ;;

  (* check if each row and col if = 0, then return coordinates *)
  let find_empty_cell board = 
    let rec aux row col =
      if row = Array.length board then None (* reach the end *)
      else if col = Array.length board && row < Array.length board then aux (row + 1) col
      else if board.(row).(col) = 0 then Some (row, col)
      else aux row (col + 1)
  in 
    aux 0 0
  ;;

  let solve_sudoku board =
    None  
  ;;


end

  let%test "is_valid_move test" =
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
    let result =
      Sudoku.is_valid_move board 0 2 4
    && not (Sudoku.is_valid_move board 1 2 3)
    && Sudoku.is_valid_move board 2 2 7
    && Sudoku.is_valid_move board 3 4 5
    && not (Sudoku.is_valid_move board 4 4 3)
    in
  Printf.printf "Test Result: %b\n" result;  (* Print the result *)
  (*assert result; *)  (* Assert the result *)
  ;;

  let%test "find_empty_cell test" = 
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
    Sudoku.find_empty_cell board = Some(0, 2)
  ;;

