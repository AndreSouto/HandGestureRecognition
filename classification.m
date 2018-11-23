% Function classification: Performs bit generation and classification based
%                          in the features acquired.
%
% Usage: bits = classification(thumb_side, ed);
%   Input:
%     thumb_side - thumb detection
%     ed - significant peaks
%   Output:
%     bits - array representing the fingers

function bits = classification (thumb_side, ed)
    
    % Array that represents the fingers. Leftmost bit represents thumb
    bits = [1 1 1 1 1];

    if strcmp(thumb_side,'none')
        bits(1) = 0;
    else
        % Do nothing
    end

    

end