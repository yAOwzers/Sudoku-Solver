let () = Logger.disable_debug ()

let () =
  let sudoku_board =
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

  Printf.printf "Sudoku Board:\n";
  Sudoku.print_board sudoku_board;

  if Sudoku.solve_sudoku sudoku_board then (
    Printf.printf "Sudoku solved successfully:\n";
    Sudoku.print_board sudoku_board)
  else (
    Sudoku.print_board sudoku_board;
    Printf.printf "\nNo solution exists.\n")
