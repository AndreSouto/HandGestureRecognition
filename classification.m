% Function classification: Performs bit generation and classification based
%                          in the features acquired.
%
% Usage: bits = classification(thumb_side, ed);
%   Input:
%     thumb_side - thumb detection
%     ed - significant peaks
%     no_fingers - flag that indicate there is not fingers raised
%   Output:
%     bits - array representing the fingers

function bits = classification (thumb_side, ed, no_fingers)
    
    % Array that represents the fingers. Leftmost bit represents thumb
    bits = [-1 -1 -1 -1 -1];

    % Checking if the hand is closed
    if strcmp(no_fingers,'true')
        bits = [0 0 0 0 0];
        return;
    end

    if strcmp(thumb_side,'none')
        bits(1) = 0;
    elseif strcmp(thumb_side,'left') || strcmp(thumb_side,'right')
        bits(1) = 1;
    end

    % Setting bits depending on ed vector
    [r,c] = size(ed);
    
    if c > 4
        c = 4;
    end

    for i = 1:1:c
        if ed(i) ~= -1
            bits(i + 1) = 1;
        else
            bits(i + 1) = 0;
        end
    end

    for i = 1:1:5
        if bits(i) == -1
            bits(i) = 0;
        end
    end

end