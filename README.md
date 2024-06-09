# Color-Cycle-Pathfinding-with-A-
This question using A* search to find a path of the same color in an N x M board from a start cell to a goal cell. The path must consist of adjacent cells of the same color, without diagonals or repeats. Print the path if found, or indicate no path exists. Include input design, state representation, moves, heuristic, and output.

### In this question, you are required to implement a prolog code that uses informed search (A*) to
solve the following puzzle or indicate that there is no solution.

- You will be given a board that consists of N x M cells.
- Each cell contains a color (Red, Yellow or Blue).
- You will be given a start and goal cells of the same color
- Your task is to find if there is a path between the start and the end cells.
- All cells on the path must be from the same color
- For example, as shown in the picture, 0,0 is the start cell and 1,3 is the end cell. The
correct path is 0,0 -> 1,0 -> 2,0 -> 2,1 -> 2,2 -> 1,2 -> 1,3
- Your code should print at least one path (if any) or no paths exist
- Diagonal moves are not allowed. You can move left, right, up and down
- Path must not contain repeated cells
- You are allowed to use the search engine for informed search that we given in the lab but
make sure it uses A*
### Your main tasks are:
- Design input
- Design state representation
- Design moves
- Design heuristic predicate
- Design output
