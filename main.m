% Final Project - IPI - Hand Gesture Recognition  %
% Source: Hand Gesture Recognition based on Shape %
% Parameters                                      %

% Rafaela Sinhoroto - %
% André Luis Souto - 140016261 %
% Raphael Soares Ramos - 14/0160299%

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
    res = interpretation (bits, orientation);

end