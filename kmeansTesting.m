%%%kmeans testing%%%
close all

filename = 'test/A/A-complex04.ppm';

image_rgb = imread(filename);
imshow(image_rgb);

k = strfind(filename,'uniform');
if ~isempty(k)
    nColors = 2;
    nBlur = 3;
else 
    nColors = 5;
    nBlur = 7;
end

H = ones(nBlur,nBlur)/(nBlur^2);
image_blur = imfilter(image_rgb,H);

cform = makecform('srgb2lab');
lab_img = applycform(image_blur,cform);

ab = double(lab_img(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

% repeat the clustering 3 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                      'Replicates',10);
                                  
pixel_labels = reshape(cluster_idx,nrows,ncols);
figure, imshow(pixel_labels,[]), title('image labeled by cluster index');

segmented_images = cell(1,3);
rgb_label = repmat(pixel_labels,[1 1 3]);

mean_cluster_value = mean(cluster_center,2);
[tmp, idx] = sort(mean_cluster_value);
cluster_num = idx(nColors);

[r,c] = size(image_rgb(:,:,1));
image_seg = ones(r,c);
for i=1:1:r
    for j=1:1:c
        if pixel_labels(i,j) ~= cluster_num
            image_seg(i,j) = 0;
        end
    end
end

figure, imshow(image_seg);