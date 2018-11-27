% Function featuresExtraction: Performs feature extraction of the images
%
% Usage: [segmented]=featuresExtraction(image);
%   Input:
%     image - binary image
%     rb - bottom border row
%     rt - top border row
%     colr - right border column
%     coll - left border column
%     image_orientation - vertical/horizontal
%   Output:
%     thumb_side - thumb detection
%     ed - significant peaks
%     no_fingers - flag that indicate there is not fingers raised

function [thumb_side, ed, no_fingers] = featuresExtraction (rb,rt,colr,coll,image,image_orientation)
    
    no_fingers = 'false';
    ed = [];

    % 1) Centroid
    [crow,ccol] = centroid (image);

    % 2) Thumb detection
    thumb_side = thumbDetection (rb,rt,colr,coll,image,image_orientation);

    % 3) Finger region detection
    [x,y] = fingerDetection (image,image_orientation);
    
    % If x or y empty, there is an error during processing
    if isempty(x) || isempty(y)
        error = 1;
        return;
    end

    % Ensure that neither x value nor y value goes higher than centroid
    if strcmp(image_orientation,'vertical')
        indices = find(y > crow);
        y(indices) = -1;
        x(indices) = -1;
    else
        indices = find(x > ccol);
        x(indices) = -1;
        y(indices) = -1;
    end

    % 4) Euclidean distance
     ed = euclideanDistance (x,y,crow,ccol);
    
    if isempty(ed) ~= 1
        % With euclidean distance vector, it is possible to determine
        % a threshold (75% of the highest peak). The peaks with 
        % ed smaller than this threshold will be considered insignificants.
        % Insignificant peaks/folded fingers are marked as -1
        indices = find(ed == 0);
        ed(indices) = [];

        if max(ed) > 20
            threshold = 0.75 * max(ed);
            [r,c] = size(ed);

            indices = find(ed < threshold);
            ed(indices) = [];
        else
            no_fingers = 'true';
        end
    end

end