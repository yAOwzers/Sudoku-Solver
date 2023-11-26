open Logger

type board = int array array

let print_board board =
  Array.iter
    (fun row ->
      Array.iter (fun col -> Printf.printf "%d " col) row;
      print_newline ())
    board

(* to check if the number is in row, col and subgrid *)
let is_valid_move board row col num =
  Array.exists (( = ) num) board.(row)
  || Array.exists (fun r -> r.(col) = num) board
  || Array.exists
       (fun r -> Array.exists (( = ) num) (Array.sub r col 3))
       (Array.sub board row 3)

(* check if each row and col if = 0, then return coordinates *)
let find_empty_cell board =
  let rec aux row col =
    if row = Array.length board then None (* reach the end *)
    else if col = Array.length board && row < Array.length board then
      aux (row + 1) col
    else if board.(row).(col) = 0 then Some (row, col)
    else aux row (col + 1)
  in
  aux 0 0

type result = Solved of int * int | Unsolved of bool

let solve_sudoku board =
  let rec solve row col =
    match find_empty_cell board with
    | None -> Solved (row, col)
    | Some (empty_row, empty_col) ->
        let rec loop num =
          if num > 9 then (
            Logger.debug "Unsolved at (%d, %d)" empty_row empty_col;
            Unsolved false
            (* Printf.printf "Unsolved at (%d, %d)" empty_row empty_col; *))
          else if is_valid_move board empty_row empty_col num then (
            board.(empty_row).(empty_col) <- num;
            Logger.debug "Trying %d at (%d, %d)" num empty_row empty_col;
            (* Printf.printf "Trying %d at (%d, %d)" num empty_row empty_col; *)
            match solve empty_row empty_col with
            | Solved (solved_row, solved_col) -> Solved (solved_row, solved_col)
            | Unsolved false -> loop (num + 1))
          else loop (num + 1)
        in
        loop 1
  in
  match solve 0 0 with Solved (row, col) -> true | Unsolved false -> false
