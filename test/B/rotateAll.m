% Script to rotate images of folder B and save them 

% Complex
for i = 1:1:41

    filename = ['B-complex' num2str(i) '.ppm'];

    image = imread(filename);

    image = rot90(rot90(rot90(image)));

    imwrite(image,filename);

end

% Uniform
for i = 1:1:61

    filename = ['B-uniform' num2str(i) '.ppm'];

    image = imread(filename);

    image = rot90(image);

    imwrite(image,filename);

end