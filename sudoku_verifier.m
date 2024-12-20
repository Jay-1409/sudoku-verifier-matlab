function isValid = sudoku_verifier(board)
    isValid = true;
    
    % rows1
    for row = 1:9
        if ~is_valid_set(board(row, :))
            fprintf('Invalid row %d\n', row);
            isValid = false;
        end
    end
    
    % columns
    for col = 1:9
        if ~is_valid_set(board(:, col))
            fprintf('Invalid column %d\n', col);
            isValid = false;
        end
    end
    
    % subgrids
    for row = 1:3
        for col = 1:3
            if ~is_valid_subgrid(board, row, col)
                rowStart = (row - 1) * 3 + 1;
                colStart = (col - 1) * 3 + 1;
                fprintf('Invalid 3x3 subgrid at (%d, %d)\n', rowStart, colStart);
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
    k = 1;  % Index for the s   ubgrid vector

    % total number of subgrids in the grid: 9
    
    rowStart = (row - 1) * 3 + 1;
    colStart = (col - 1) * 3 + 1;

    % 1 2 -> 1 4 each give u different subgrid position
    % 2 1 -> 4 1
    % 2 2 -> 4 4

    for i = 0:2  
        for j = 0:2  
            subgrid(k) = board(rowStart + i, colStart + j);
            k = k + 1; 
        end
    end

    % valid? the subgrid
    valid = is_valid_set(subgrid);
end



