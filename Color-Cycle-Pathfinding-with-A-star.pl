% Define the colors
color(red).
color(yellow).
color(blue).
% Define moves (up, down, left, right)
move(Board, [X,Y], [X1,Y], Color) :-  % Define a move to the right 
    X1 is X+1,   
    member([[X1,Y], Color], Board).  % Check if the next cell has the same color and is within the board
move(Board, [X,Y], [X,Y1], Color) :-  % Define a move down 
    Y1 is Y+1, 
    member([[X,Y1], Color], Board).
move(Board, [X,Y], [X1,Y], Color) :-  % Define a move to the left
    X1 is X-1, X1 >= 0, 
    member([[X1,Y], Color], Board). % Check if the next cell has the same color and is within the board
move(Board, [X,Y], [X,Y1], Color) :-  % Define a move up
    Y1 is Y-1, Y1 >= 0, 
    member([[X,Y1], Color], Board). % Check if the next cell has the same color and is within the board

% Define heuristic (Manhattan distance)
heuristic([X1,Y1], [X2,Y2], H) :- H is abs(X1-X2) + abs(Y1-Y2).
% Define A* algorithm
astar(Board, Color, Start, Goal, Path) :- 
    astar(Board, Color, [[Start, 0, []]], [], Goal, RevPath),  % Call the A* algorithm with the open and closed lists 
    reverse(RevPath, Path). % Reverse the path to get it in the correct order
astar(_, _, [[Goal, _, Path]|_], _, Goal, Path). % Check if the goal is the first element in the open list and return the path
astar(Board, Color, [[Curr, G, Path]|Rest], Closed, Goal, FinalPath) :- % Define the A* algorithm with the open and closed lists
    findall([Next, NG, [Next|Path]], (move(Board, Curr, Next, Color),  % Find all the possible moves from the current cell
    \+ member([Next, _, _], Closed),    % Check if the next cell has not been visited yet
    \+ member([Next, _, _], Rest),     % Check if the next cell is not in the open list yet
    NG is G+1,  % Calculate the new cost value for the next cell 
    heuristic(Next, Goal, H),   % Calculate the heuristic value for the goal
    F is NG+H), Successors),    % Calculate the total cost F for the goal
    append(Rest, Successors, NewOpen),  % Append the successors to the open list
    sort(0, @=<, NewOpen, SortedOpen), % Sort the open list based on the total costs
    astar(Board, Color, SortedOpen, [[Curr, G, Path]|Closed], Goal, FinalPath).  % Continue the search with the new open and closed lists
% Define the puzzle solving predicate
solve_puzzle(Board, Start, Goal) :-
    member([Start, Color], Board),  % Check if the start cell is in the board
    member([Goal, Color], Board),  % Check if the goal cell is in the board
    astar(Board, Color, Start, Goal, Path), % Call the A* algorithm to find the path
    FinalPath = [Start|Path], % Add the start cell to the path
    write('Path found: '), write(FinalPath), nl; % Print the path
    write('No path found between '), write(Start), write(' and '), write(Goal), nl. % Print a message if no path is found



% ?- solve_puzzle([[[0,0], red], [[0,1], red], [[0,2], blue], [[0,3], blue], [[1,0], blue], [[1,1], yellow], [[1,2], blue], [[1,3], red],[[2,0], red], [[2,1], red], [[2,2], red], [[2,3], blue],[[3,0], yellow], [[3,1], blue], [[3,2], red], [[3,3], red]],[2,0], [3,3]).
% ?- solve_puzzle([[[0,0], red], [[0,1], red], [[0,2], blue], [[0,3], blue], [[1,0], blue], [[1,1], yellow], [[1,2], blue], [[1,3], red],[[2,0], blue], [[2,1], red], [[2,2], red], [[2,3], blue],[[3,0], yellow], [[3,1], blue], [[3,2], red], [[3,3], red]],[2,0], [3,3]).
