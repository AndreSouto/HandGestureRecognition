% Function imageMoment: Find image moment to calculate centroid
%
% Usage: m = imageMoment (image,i,j);
%   Input:
%     image - binary image
%     i - row in the image
%     j - column in the image
%   Output:
%     m - image moment

function m = imageMoment (image,i,j)

    m = sum(sum( ((1:size(image,1))'.^j * (1:size(image,2)).^i) .* image ));

end