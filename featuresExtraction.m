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

function [thumb_side, ed] = featuresExtraction (rb,rt,colr,coll,image,image_orientation)

    % 1) Centroid
    [crow,ccol] = centroid (image);

    % 2) Thumb detection
    thumb_side = thumbDetection (rb,rt,colr,coll,image);

    % 3) Finger region detection
    [x,y] = fingerDetection (image,image_orientation);

    % 4) Euclidean distance
     ed = euclideanDistance (x,y,crow,ccol);

    % With euclidean distance vector, it is possible to determine
    % a threshold (75% of the highest peak). The peaks with 
    % ed smaller than this threshold will be considered insignificants.
    % Insignificant peaks/folded fingers are marked as -1
    indices = find(ed == 0);
    ed(indices) = [];

    threshold = 0.75 * max(ed);
    [r,c] = size(ed);

    indices = find(ed < threshold);
    ed(indices) = -1;

end