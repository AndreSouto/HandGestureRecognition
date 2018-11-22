% Function imageSegmentation: Performs image segmentation
%
% Usage: [segmented]=imageSegmentation(image_rgb);
%   Input:
%     image_rgb - image in RGB color space 
%   Output:
%     segmented - image with hand segmented
%     rb - bottom border row
%     rt - top border row
%     colr - right border column
%     coll - left border column

function [rb,rt,colr,coll,segmented] = imageSegmentation(image_rgb)
    
    % Converting image from RGB color space to YCbCr
    image_ycbcr = rgb2ycbcr(image_rgb);
  
    % TODO: K-means para clusterizar
    %%%% for testing purposes only TODO : remove %%%%%%%
    filename = './images/bin_hand_to_test_only.png';
    image_seg = imread(filename);
    [r,c] = size(image_seg);
    image_seg = im2double(image_seg);
    for i=1:1:r
        for j=1:1:c
            if image_seg(i,j) ~= 0
                image_seg(i,j) = 1.0;
            end
        end
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    segmented = image_seg;
    % Top border coordinates
    [rt,colt] = findBorder(image_seg,'top');
    % Bottom border coordinates
    [rb,colb] = findBorder(image_seg,'bottom');
    % Right border coordinates
    [rr,colr] = findBorder(image_seg,'right');
    % Left border coordinates
    [rl,coll] = findBorder(image_seg,'left');

    % Plotting segmented image with its localization
    imshow(image_seg);
    hold on;
    rectangle('Position',[coll,rt,(colr - coll),(rb - rt)],...
             'LineWidth',2,'LineStyle','--','EdgeColor','r');
    hold off;

end