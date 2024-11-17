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
    subgrid = zeros(1, 9);  % Preallocate a 1x9 vector for the subgrid
    k = 1;  % Index for the subgrid vector

    % Calculate the starting indices of the subgrid
    rowStart = (row - 1) * 3 + 1;
    colStart = (col - 1) * 3 + 1;

    % Iterate over the 3x3 subgrid using nested loops
    for i = 0:2  % Row offset within the subgrid
        for j = 0:2  % Column offset within the subgrid
            subgrid(k) = board(rowStart + i, colStart + j);
            k = k + 1;  % Move to the next position in the vector
        end
    end

    % Validate the subgrid
    valid = is_valid_set(subgrid);
end

%function valid = is_valid_subgrid(board, row, col)
 %   subgrid = board((row-1)*3+1:row*3, (col-1)*3+1:col*3);
  %  valid = is_valid_set(subgrid(:));
%end


