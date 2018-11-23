% Function fingerDetection: Detects and marks peaks of fingers
%
% Usage: [x,y] = fingerDetection (image,image_orientation));
%   Input:
%     image - binary image
%     image_orientation - vertical/horizontal
%   Output:
%     x - values of x axis
%     y - values of y axis


function [x,y] = fingerDetection (image,image_orientation)
    
    % Getting x and y boundaries of the hand
    boundaries = bwboundaries(image);
    boundaries_aux = boundaries{1,1};
    
    rows = boundaries_aux(:,1);
    cols = boundaries_aux(:,2);

    x = [];
    y = [];

    [r,c] = size(rows);
    
    % If hand is vertical
    if strcmp(image_orientation,'vertical')
        for i = 5:1:r
            if (rows(i) > rows(i - 1)) && (rows(i - 4) >= rows(i - 1))
                y = [y rows(i)];
                x = [x cols(i)];
            end
        end

    % If hand is horizontal
    else
        for i = 5:1:c
            if (cols(i) < cols(i - 1)) && (cols(i - 4) <= cols(i - 1))
                y = [y rows(i)];
                x = [x cols(i)];
            end
        end
        
    end

    % Cleaning x and y in case of values too close of each other. Each
    % eliminated value is marked with -1
    [r,c] = size(x);

    for i = 1:1:(c - 1)
        if (abs(x(i) - x(i + 1)) < 10) && (abs(y(i) - y(i + 1)) < 10)
            x(i) = -1;
            y(i) = -1;
        end
    end

end