% Function centroid: Find centroid of the binary image
%
% Usage: [crow,ccol] = centroid(image);
%   Input:
%     image - binary image
%   Output:
%     crow - row of the centroid location
%     ccol - column of the centroid location

function [crow,ccol] = centroid(image)

    area = imageMoment(image,0,0);
    centroids = [imageMoment(image,1,0)/area , imageMoment(image,0,1)/area];
    
    crow = round(centroids(2));
    ccol = round(centroids(1));

end