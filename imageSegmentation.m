% Function imageSegmentation: Performs image segmentation
%
% Usage: [segmented]=imageSegmentation(image_rgb);
%   Input:
%     image_rgb - image in RGB color space 
%   Output:
%     segmented - image with hand segmented

function [segmented] = imageSegmentation(image_rgb)
    
    % Converting image from RGB color space to YCbCr
    image_ycbcr = rgb2ycbcr(image_rgb);
    
    % TODO: K-means para clusterizar
%     idx = kmeans(image_ycbcr, 3);
%     
%     plot(idx)
    

end