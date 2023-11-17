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
    let rec solve row col = 
      match find_empty_cell board with
      | None -> true
      | Some (row, col) -> (* if there are any empty cells *)
          for num = 1 to 9 do
            if is_valid_move board row col num then begin
              board.(row).(col) <- num;
              if solve row col then
                true (* end condition if find_empty_cell is true *)
              else 
                board.(row).(col) <- 0 (* back track *)
            end
          done;
          false (* No valid number can be placed in the current cell *)
    in
    solve 0 0
  ;;


end

