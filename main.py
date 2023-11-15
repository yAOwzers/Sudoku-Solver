# Skeleton code in Python


def solveSudoku(grid):
    # if there's no empty cell
    if not empty:
        return True
    else:
        row, col = findEmptyCell(grid)

        for num in range(1, 10):
            if isValidMove(grid, row, col, num):
                grid[row][col] = num

                if solveSudoku(grid):
                    return True # find a valid solution

                # Backtrack if the current choice leads to an invalid solution
                grid[row][col]

        return false # No valid number 

# check if num is not present in the current row, column and subgrid
def isValidMove(grid, row, col, num):
    return 

# check if num is already present in the current row
def inRow(grid, row, num):
    return

# check if num is already present in the current column
def inColumn(grid, col, num):
    return

# check if num is already present in the current 3x3 subgrid
def inSubgrid(grid, row, col, num):
    return

# find hte first empty cell in the sudoku grid and return its coordinates (row, col)
def findEmptyCell(grid):
    return
