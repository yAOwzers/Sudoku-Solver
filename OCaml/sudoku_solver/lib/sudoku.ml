open Logger

type board = int array array

let print_board board =
  Array.iter
    (fun row ->
      Array.iter (fun col -> Printf.printf "%d " col) row;
      print_newline ())
    board

let in_subgrid grid row col num =
  let start_row, start_col = (row / 3 * 3, col / 3 * 3) in

  let rec check_subgrid i j =
    if i = 3 then false
    else if j = 3 then check_subgrid (i + 1) 0
    else if grid.(start_row + i).(start_col + j) = num then true
    else check_subgrid i (j + 1)
  in

  check_subgrid 0 0

let is_valid_move board row col num =
  let row_exists = Array.exists (( = ) num) board.(row) in
  let col_exists = Array.exists (fun r -> r.(col) = num) board in
  let subgrid_exists =
    in_subgrid board row col num
    (* Array.exists
       (fun r -> Array.exists (( = ) num) (Array.sub r col 3))
       (Array.sub board row 3) *)
  in

  (* Print statements *)
  (* Printf.printf "Checking row %d: %b\n" row row_exists;
     Printf.printf "Checking col %d: %b\n" col col_exists;
     Printf.printf "Checking subgrid: %b\n\n" subgrid_exists; *)
  not (row_exists || col_exists || subgrid_exists)

(* check if each row and col if = 0, then return coordinates *)
let find_empty_cell board =
  let rec aux row col =
    if row = Array.length board then (
      Logger.debug "Reached end of board";
      None)
    else if col = Array.length board && row < Array.length board then
      (* Logger.debug "Reached the end of the column"; *)
      aux (row + 1) 0
    else if board.(row).(col) = 0 then Some (row, col)
    else aux row (col + 1)
  in
  aux 0 0

(* type result = Solved of int * int | Unsolved of bool *)

(* let solve_sudoku board =
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
             if solve empty_row empty_col = true then true
             else (
               board.(empty_row).(empty_col) <- 0;
               Logger.debug "Backtracking (%d, %d)" empty_row empty_col;
               loop (num + 1)))
           else loop (num + 1)
         in
         Logger.debug "Solving for cell (%d, %d)" empty_row empty_col;
         loop 1
   in
   match solve 0 0 with Solved (row, col) -> true | Unsolved false -> false *)

let solve_sudoku board =
  let rec solve row col =
    match find_empty_cell board with
    | None -> true
    | Some (empty_row, empty_col) ->
        let rec loop num =
          if num > 9 then false
          else if is_valid_move board empty_row empty_col num then (
            board.(empty_row).(empty_col) <- num;
            Logger.debug "Trying %d at (%d, %d)" num empty_row empty_col;

            if solve empty_row empty_col then true
            else (
              board.(empty_row).(empty_col) <- 0;
              (* Backtrack *)
              Logger.debug "Backtracking (%d, %d)" empty_row empty_col;
              loop (num + 1)))
          else loop (num + 1)
        in
        Logger.debug "Solving for cell (%d, %d)" empty_row empty_col;
        loop 1
  in
  solve 0 0
