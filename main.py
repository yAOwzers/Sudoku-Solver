# Skeleton code in Python


def solveSudoku(grid):
    # if there's no empty cell
    if not findEmptyCell(grid):
        return True
    else:
        row, col = findEmptyCell(grid)

        for num in range(1, 10):
            if isValidMove(grid, row, col, num):
                grid[row][col] = num

                if solveSudoku(grid):
                    return True  # find a valid solution

                # Backtrack if the current choice leads to an invalid solution
                grid[row][col] = 0

        return False  # No valid number


# check if num is not present in the current row, column and subgrid
def isValidMove(grid, row, col, num):
    return (
        not inRow(grid, row, num)
        and not inColumn(grid, col, num)
        and not inSubgrid(grid, row, col, num)
    )


# check if num is already present in the current row
def inRow(grid, row, num):
    for col in range(0, 9):
        if grid[row][col] == num:
            #            print("Number is in row")
            return True
    return False


# check if num is already present in the current column
def inColumn(grid, col, num):
    for row in range(0, 9):
        if grid[row][col] == num:
            #           print("Number is in column")
            return True
    return False


# check if num is already present in the current 3x3 subgrid
def inSubgrid(grid, row, col, num):
    startRow, startCol = getSubgridStart(row, col)

    for i in range(0, 3):
        for j in range(0, 3):
            if grid[startRow + i][startCol + j] == num:
                #              print("Number is in subgrid")
                return True
    return False


def getSubgridStart(row, col):
    startRow = 3 * (row // 3)
    startCol = 3 * (col // 3)
    return startRow, startCol


# find hte first empty cell in the sudoku grid and return its coordinates (row, col)
def findEmptyCell(grid):
    for row in range(0, 9):
        for col in range(0, 9):
            if grid[row][col] == 0:
                return row, col
    return None


def printMatrix(matrix):
    for row in matrix:
        print(" ".join(map(str, row)))


sudokuBoard = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9],
]

if solveSudoku(sudokuBoard):
    print("Sudoku solved successfully:")
    for row in sudokuBoard:
        print(row)
else:
    printMatrix(sudokuBoard)
    print("No solution exists.")
