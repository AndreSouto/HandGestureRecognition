% FINAL PROJECT - IPI - HAND GESTURE RECOGNITION  %
% Paper: Hand Gesture Recognition based on Shape  %
% Parameters                                      %
%                                                 %
% Students:                                       %
% Rafaela Sinhoroto -                             %
% Andr� Luis Souto - 14/0016261                   %
% Raphael Soares Ramos - 14/0160299               %


% Function main: Calls all other functions to     %
%                perform recognition of gestures  %
%                                                 %
% Usage: main();                                  %
%   Input:                                        %
%                                                 %
%   Output:                                       %
%                                                 %

function main()
    
    %TODO: Fazer para varias imagens

    % Reading images
    filename = './images/A-complex04.ppm';
    image_rgb = imread(filename);
    
    % Hand segmentation
    [rb,rt,colr,coll,image_seg] = imageSegmentation(image_rgb);

    % Hand orientation detection
    image_orientation = orientationDetection(rb,rt,colr,coll,image_seg);

    % Features extraction
    [thumb_side, ed] = featuresExtraction(rb,rt,colr,coll,image_seg,image_orientation);

    % Classification and bits generation
    bits = classification(thumb_side,ed);
    
    % Interpretation of bits array
    gesture = interpretation (bits, image_orientation);

    % Checking result
    
end