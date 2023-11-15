# Sudoku-Solver
To create the algorithm in OCaml

First using Backtracking

## Pseudo code
```
function solveSudoku(grid):
    if there is no empty cell:
        return true  // Puzzle solved successfully
    else:
        row, col = findEmptyCell(grid)
        
        for num in 1 to 9:
            if isValidMove(grid, row, col, num):
                grid[row][col] = num
                
                if solveSudoku(grid):
                    return true  // Found a valid solution
                
                // Backtrack if the current choice leads to an invalid solution
                grid[row][col] = 0
                
        return false  // No valid number could be placed in the current cell

function isValidMove(grid, row, col, num):
    // Check if 'num' is not present in the current row, column, and subgrid
    return not inRow(grid, row, num) and not inColumn(grid, col, num) and not inSubgrid(grid, row, col, num)

function inRow(grid, row, num):
    // Check if 'num' is already present in the current row
    for col in 1 to 9:
        if grid[row][col] == num:
            return true
    return false

function inColumn(grid, col, num):
    // Check if 'num' is already present in the current column
    for row in 1 to 9:
        if grid[row][col] == num:
            return true
    return false

function inSubgrid(grid, row, col, num):
    // Check if 'num' is already present in the current 3x3 subgrid
    startRow, startCol = getSubgridStart(row, col)
    
    for i in 0 to 2:
        for j in 0 to 2:
            if grid[startRow + i][startCol + j] == num:
                return true
    return false

function getSubgridStart(row, col):
    // Determine the top-left corner of the 3x3 subgrid containing the cell (row, col)
    startRow = 3 * int(row / 3)
    startCol = 3 * int(col / 3)
    return startRow, startCol

function findEmptyCell(grid):
    // Find the first empty cell in the Sudoku grid and return its coordinates (row, col)
    for row in 1 to 9:
        for col in 1 to 9:
            if grid[row][col] == 0:
                return row, col
    return -1, -1  // No empty cell found

```
