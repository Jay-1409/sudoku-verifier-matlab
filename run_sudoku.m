fprintf('Enter your 9x9 Sudoku grid:\n');
    
    grid = zeros(9, 9);  
    
    for i = 1:9
        rowInput = input("", 's');  % Take row as a string
        grid(i, :) = str2num(rowInput);  % Convert string to numeric row
    end
sudoku_verifier(grid);
 