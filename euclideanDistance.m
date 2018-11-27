% Function euclideanDistance: Calculates the euclidean distance between
%                             centroid and each finger detected
%
% Usage: ed = euclideanDistance (x,y,crow,ccol);
%   Input:
%     x - x location of each finger
%     y - y location of each finger
%     crow - row of the centroid location
%     ccol - column of the centroid location
%   Output:
%     ed - euclidean distance vector


function ed = euclideanDistance (x,y,crow,ccol)
    
    ed = [];
    [r,c] = size(x);

    for i = 1:1:c
        if x(i) ~= -1
            ed(i) = sqrt((x(i) - ccol) ^ 2 + (y(i) - crow) ^ 2);
        end
    end

end