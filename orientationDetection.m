% Function orientationDetection: Find orientation of the hand. Based
%                                in two methods for detection.
%
% Usage: orientation = orientationDetection (rb,rt,colr,coll,image);
%   Input:
%     rb - bottom border row
%     rt - top border row
%     colr - right border column
%     coll - left border column
%     image - binary image 
%   Output:
%     orientation - orientation of the hand

function orientation = orientationDetection (rb,rt,colr,coll,image)

    % First Method for orientation detection
    length = (rb - rt);
    width = (colr - coll);

    ratio = length/width;

    if ratio > 1
        method_one = 'vertical';
    else
        method_one = 'horizontal';
    end

    % Second Method for orientation detection 
    [r,c] = size(image);

    for j = 1
        for i = 1:1:r
            if image(i,j) == 1
                method_two = 'horizontal';
                break;
            end
        end
    end

    for i = r
        for j = 1:1:c
            if image(i,j) == 1
                method_two = 'vertical';
                break;
            end
        end
    end

    % if both methods agree, so there is a orientation of the hand
    if strcmp(method_one, method_two)
        orientation = method_one;
    else
        % TODO: THERE IS A PROBLEM !!!!
    end

end