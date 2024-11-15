function isValid = sudoku_verifier(board)
    isValid = true;
    
    % Check rows
    for row = 1:9
        if ~is_valid_set(board(row, :))
            fprintf('Invalid row %d\n', row);
            isValid = false;
        end
    end
    
    % Check columns
    for col = 1:9
        if ~is_valid_set(board(:, col))
            fprintf('Invalid column %d\n', col);
            isValid = false;
        end
    end
    
    % Check 3x3 subgrids
    for row = 1:3
        for col = 1:3
            if ~is_valid_subgrid(board, row, col)
                fprintf('Invalid 3x3 subgrid at (%d, %d)\n', row, col);
                isValid = false;
            end
        end
    end
    
    if isValid
        disp('The Sudoku puzzle is valid!');
    else
        disp('The Sudoku puzzle is invalid.');
    end
end

function valid = is_valid_set(nums)
    valid = all(nums >= 1 & nums <= 9) && numel(unique(nums)) == 9;
end

function valid = is_valid_subgrid(board, row, col)
    subgrid = zeros(9, 0);  % Create a 9x1 array to store the flattened subgrid
    k = 1;  % Start k at 1 because MATLAB uses 1-based indexing
    
    for i = 1:3
        for j = 1:3  % Iterate over all columns (1 to 3)
            subgrid(k) = board(row + i - 1, col + j - 1);  % Correct indexing of the board
            k = k + 1;  % Increment k to move to the next element in subgrid
        end
    end

    %subgrid = board((row-1)*3+1:row*3, (col-1)*3+1:col*3);
    valid = is_valid_set(subgrid(:));
end


