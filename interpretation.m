% Function interpretation: Performs the interpretation of the
%                          classification obtained
%
% Usage: res = interpretation(bits);
%   Input:
%     bits - array representing the fingers
%     orientation - vertical/horizontal
%   Output:
%     gesture - hand gesture recognized

function gesture = interpretation (bits, orientation)
    
    % Bits and gestures that correspond
    if strcmp(orientation,'vertical')
        if bits == [1 1 1 1 1]
            gesture = 'five';
        elseif bits == [0 0 0 0 0]
            gesture = 'A';
        elseif bits == [1 1 1 1 0]
            gesture = 'B';
        elseif bits == [0 0 0 1 0]
            gesture = 'Point';
        elseif bits == [0 0 1 1 0]
            gesture = 'V';
        end
    end
    
end