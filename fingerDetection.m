% Function fingerDetection: Detects fingers
%
% Usage: = fingerDetection(image_orientation);
%   Input:
%     image - binary image
%     rb - bottom border row
%     rt - top border row
%     colr - right border column
%     coll - left border column
%     image_orientation - vertical/horizontal
%   Output:
%     


function fingerDetection (rb,rt,colr,coll,image,image_orientation)
    
    % Getting x and y boundaries of the hand
    boundaries = bwboundaries(image);
    boundaries_aux = boundaries{1,1};
    rows = boundaries_aux(:,1);
    cols = boundaries_aux(:,2);
    
    % If hand is vertical
    if strcmp(image_orientation,'vertical')
        
    % If hand is horizontal
    else
        
    end
    
end