% Function findBorder: Find coordinates of the borders of the image
%
% Usage: [x,y] = findBorder(image);
%   Input:
%     image - binary image
%     type - top, bottom, right or left border 
%   Output:
%     row - y border
%     column - x border

function [row,column] = findBorder(image,type)

    [r,c] = size(image);

    % Top border
    if strcmp(type,'top')
        for i = 1:1:r
            for j = 1:1:c
                if image(i,j) == 1
                    row = i;
                    column = j;
                    break;
                end         
            end
        end
    % Bottom border
    elseif strcmp(type,'bottom')
        for i = r:(-1):1
            for j = 1:1:c
                if image(i,j) == 1
                    row = i;
                    column = j;
                    break;
                end         
            end
        end
    % Right border
    elseif strcmp(type,'right')
        for j = c:(-1):1
            for i = 1:1:r
                if image(i,j) == 1
                    row = i;
                    column = j;
                    break;
                end         
            end
        end
    % Left border
    elseif strcmp(type,'left')   
        for j = 1:1:c
            for i = 1:1:r
                if image(i,j) == 1
                    row = i;
                    column = j;
                    break;
                end         
            end
        end
    end

end