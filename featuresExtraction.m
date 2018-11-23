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
%     

function featuresExtraction (rb,rt,colr,coll,image,image_orientation)

    % 1) Centroid
    [crow,ccol] = centroid(image);

    % 2) Thumb detection
    thumb_side = thumbDetection (rb,rt,colr,coll,image);

    % 3) Finger region detection
    fingerDetection (rb,rt,colr,coll,image,image_orientation)
    % 4) Euclidean distance
end