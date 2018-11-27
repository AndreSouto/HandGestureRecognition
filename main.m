% FINAL PROJECT - IPI - HAND GESTURE RECOGNITION  %
% Paper: Hand Gesture Recognition based on Shape  %
% Parameters                                      %
%                                                 %
% Students:                                       %
% Rafaela Sinhoroto -                             %
% Andr� Luis Souto - 14/0016261                   %
% Raphael Soares Ramos - 14/0160299               %


% Function main: Calls all other functions to     
%                perform recognition of gestures  
%                                                 
% Usage: main();                                  
%   Input:                                        
%                                                 
%   Output:                                       
%                                                 

function main()

    % Vectors
    choice = [];
    truth = [];

    % Directories of the images
    folder = './test/';
    subFolder = {'A', 'B', 'C', 'Five', 'Point', 'V'};
    
    % Variables for accuracy evaluation
    curr_points = 0;
    total_points = 0;
    curr_images = 0;
    total_images = 0;

    for i = 1:1:6 
    
        % Finding folder
        myFolder = [folder subFolder{i}];
        filePattern = fullfile(myFolder, '*.ppm');
        ppmFiles = dir(filePattern);
        fprintf(1, 'Accuracy for Gesture %s\n',subFolder{i});
    
        for j = 1:length(ppmFiles)
   
            % Reading images
            baseFileName = ppmFiles(j).name;
            filename = fullfile(myFolder, baseFileName);
            %filename = './test/Five/Five-uniform21.ppm';
            image_rgb = imread(filename);

            % Hand segmentation
            [rb,rt,colr,coll,image_seg] = imageSegmentation(image_rgb,filename);

            % Hand orientation detection
            image_orientation = orientationDetection(rb,rt,colr,coll,image_seg);

            % Features extraction
            [thumb_side, ed, no_fingers] = featuresExtraction(rb,rt,colr,coll,image_seg,image_orientation);
            
            if isempty(ed) ~= 1

                % Classification and bits generation
                bits = classification(thumb_side,ed,no_fingers);

                % Interpretation of bits array
                gesture = interpretation (bits, image_orientation);

                % Checking obtained results
                if strcmp(gesture,subFolder{i})
                    curr_points = curr_points + 1;
                    total_points = total_points + 1;
                end
            
                if strcmp(gesture,'A')
                    cho = 1;
                elseif strcmp(gesture,'B')
                    cho = 2;
                elseif strcmp(gesture,'C')
                    cho = 3;
                elseif strcmp(gesture,'Five')
                    cho = 4;
                elseif strcmp(gesture,'Point')
                    cho = 5;
                elseif strcmp(gesture, 'V')
                    cho = 6;
                elseif strcmp(gesture , 'none')
                    cho = 7;
                end

                if strcmp(subFolder{i} , 'A')
                    tru = 1;
                elseif strcmp(subFolder{i} , 'B')
                    tru = 2;
                elseif strcmp(subFolder{i} , 'C')
                    tru = 3;
                elseif strcmp(subFolder{i} , 'Five')
                    tru = 4;
                elseif strcmp(subFolder{i} , 'Point')
                    tru = 5;
                elseif strcmp(subFolder{i} , 'V')
                    tru = 6;
                end
                
                choice = [choice;cho];
                truth = [truth;tru];
            
            else
            
                if strcmp(subFolder{i} , 'A')
                    tru = 1;
                elseif strcmp(subFolder{i} , 'B')
                    tru = 2;
                elseif strcmp(subFolder{i} , 'C')
                    tru = 3;
                elseif strcmp(subFolder{i} , 'Five')
                    tru = 4;
                elseif strcmp(subFolder{i} , 'Point')
                    tru = 5;
                elseif strcmp(subFolder{i} , 'V')
                    tru = 6;
                end

                choice = [choice;-1];
                truth = [truth;tru];

            end
            
            curr_images = curr_images + 1;
            total_images = total_images + 1;
            
        end
       
        % Checking accuracy for each folder
        acc = (curr_points * 100)/curr_images;
        curr_images = 0;
        curr_points = 0;
        fprintf(1, '%.2f%% \n',acc);
    
    end

    % Checking accuracy for all folders
    acc = (total_points * 100)/total_images;
    fprintf(1, 'Accuracy for Total Dataset %.2f%% \n',acc);

end