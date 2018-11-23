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
    
    % Array that represents the fingers. Rightmost bit represents thumb
    bits = [1 1 1 1 1];

    if strcmp(thumb_side,'none')
        bits(5) = 0;
    else
        % Do nothing
    end

    % Setting bits depending on ed vector
    for i = 1:1:4
        if ed(i) ~= -1
            bits(i) = 1;
        else
            bits(i) = 0;
        end
    end
    
    % In case thumb was not detected, but there is a peak corresponding
    % to the thumb, the bit can be set up
    [r,c] = size(ed);
    if (bits(5) == 0) && (c > 4) && (ed(c) ~= -1)
        bits(5) = 1;
    end
    
end