% Function featuresExtraction: Performs feature extraction of the images
%
% Usage: [segmented]=featuresExtraction(image);
%   Input:
%     image - binary image
%   Output:
%     segmented - image with hand segmented
%     rb - bottom border row
%     rt - top border row
%     colr - right border column
%     coll - left border column

function featuresExtraction (image)

    % 1) Finding centroid of the image
    [crow,ccol] = centroid(image);

end