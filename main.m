% Final Project - IPI - Hand Gesture Recognition  %
% Source: Hand Gesture Recognition based on Shape %
% Parameters                                      %

% Rafaela Sinhoroto - %
% André Luis Souto - 140016261 %
% Raphael %

function main()
    
    %TODO: Fazer para varias imagens

    % Reading images
    filename = ['./images/A-complex04.ppm']
    image_rgb = imread(filename);
    
    % Hand segmentation
    %image_seg = imageSegmentation(image_rgb);
    %image_seg = image_rgb;

    % Hand orientation detection
    %orientationDetection(image_seg);

end