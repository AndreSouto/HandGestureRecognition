% Function thumbDetection: Finds thumb
%
% Usage: thumbDetection(rb,rt,colr,coll,image);
%   Input:
%     image - binary image
%     rb - bottom border row
%     rt - top border row
%     colr - right border column
%     coll - left border column
%     image_orientation - vertical/horizontal
%   Output:
%     thumb_side - side of the thumb

function thumb_side = thumbDetection (rb,rt,colr,coll,image,image_orientation)
    
    % Calculating the total of white pixels in the image
    white = 0;
    [r,c] = size(image);

    for i = 1:1:r
        for j = 1:1:c
            if image(i,j) == 1
                white = white + 1;
            end
        end
    end

    if strcmp(image_orientation,'vertical')
        % Calculating the number of pixels in the left box
        white_left = 0;
        pixels = round((c * 30)/250);

        for i = rt:1:rb
            for j = coll:1:(coll + pixels)
                if image(i,j) == 1
                    white_left = white_left + 1;
                end
            end
        end

        % Calculating the number of pixels in the right box
        white_right = 0;

        for i = rt:1:rb
            for j = (colr - pixels):1:colr
                if image(i,j) == 1
                    white_right = white_right + 1;
                end
            end
        end

        % Calculating percentage of white pixels in the boxes compared
        % to the total of white pixels in the image
        percentage_left = (100 * white_left) / white;
        percentage_right = (100 * white_right) / white;

        % The thumb exists in the box with less than 7% of white pixels of 
        % the total image. If both boxes have less than 7% of both have 
        % more than 7%, so none of them have the thumb
        if (percentage_left <= 7 &&  percentage_right <= 7) || (percentage_left > 7 &&  percentage_right > 7)
                thumb_side = 'none';   
        elseif percentage_left > 7
                thumb_side = 'left';
        elseif percentage_right > 7
                thumb_side = 'right';
        end
    
    else
        % Calculating the number of pixels in the left box
        white_left = 0;
        pixels = round((c * 30)/250);

        for i = rt:1:rb
            for j = coll:1:(coll + pixels)
                if image(i,j) == 1
                    white_left = white_left + 1;
                end
            end
        end

        % Calculating the number of pixels in the right box
        white_right = 0;

        for i = rt:1:rb
            for j = (colr - pixels):1:colr
                if image(i,j) == 1
                    white_right = white_right + 1;
                end
            end
        end

        % Calculating percentage of white pixels in the boxes compared
        % to the total of white pixels in the image
        percentage_left = (100 * white_left) / white;
        percentage_right = (100 * white_right) / white;

        % The thumb exists in the box with less than 7% of white pixels of 
        % the total image. If both boxes have less than 7% of both have 
        % more than 7%, so none of them have the thumb
        if (percentage_left <= 7 &&  percentage_right <= 7) || (percentage_left > 7 &&  percentage_right > 7)
                thumb_side = 'none';   
        elseif percentage_left > 7
                thumb_side = 'left';
        elseif percentage_right > 7
                thumb_side = 'right';
        end
    
    end
    
end