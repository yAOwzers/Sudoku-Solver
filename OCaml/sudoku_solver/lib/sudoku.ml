(* OCaml Version of the code *)

module Sudoku = struct
(* Main function to run *)
  type board array array

  let print_board board = 
    Array.iter (fun row ->
      Array.iter (fun col -> Printf.printf "%d " col) row;
      print_newline()) board
  ;;

  (* to check if the number is in row, col and subgrid *) 
  let is_valid_move board row col num = 
    Array.exists (fun row_index -> board.(row_index) = num) board &&
    Array.exists (fun col_index -> board.(col_index) = num) board.(row_index) &&
    Array.exists (fun r -> Array.exists (( = ) num) (Array.sub r col 3)) (sub board row 3)
  ;;
  
  (* check if each row and col if = 0, then return coordinates *)
  let find_empty_cell board = 
    let rec aux row col =
      if row = Array.length board then None (* reach the end *)
      else if col = Array.length board && row < Array.length board then aux (row + 1) col
      else if board.(row).(col) = num then (row, col)
      else aux row (col + 1)
    in 
    aux 0 0
  ;;

  let solve_sudoku board =
    None  

  
end

