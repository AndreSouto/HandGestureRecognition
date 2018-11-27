% Function imageSegmentation: Performs image segmentation
%
% Usage: [segmented]=imageSegmentation(image_rgb,filename);
%   Input:
%     image_rgb - image in RGB color space 
%     filename - image filename (necessary for 'uniform' or 'complex'
%     setting)
%   Output:
%     segmented - image with hand segmented
%     rb - bottom border row
%     rt - top border row
%     colr - right border column
%     coll - left border column

function [rb,rt,colr,coll,segmented] = imageSegmentation(image_rgb, filename)
    
    % setup of blur and clustering parameters (complex images require more
    % work)
    k = strfind(filename,'uniform');
    if ~isempty(k)
        nColors = 2;
        nBlur = 3;
    else 
        nColors = 5;
        nBlur = 7;
    end

    % create blurred image to eliminate details and improve grouping
    H = ones(nBlur,nBlur)/(nBlur^2);
    image_blur = imfilter(image_rgb, H);

    % transform to L*a*b* color space (distance between colors can be
    % measured using euclidean distance in this color space) 
    cform = makecform('srgb2lab');
    image_lab = applycform(image_blur, cform);

    % set clustering parameters 
    ab = double(image_lab(:,:,2:3));
    nrows = size(ab,1);
    ncols = size(ab,2);
    ab = reshape(ab,nrows*ncols,2);

    % repeat the clustering 10 times to avoid local minima
    [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
                                          'Replicates',10);
    
    % create clusters grayscale image
    pixel_labels = reshape(cluster_idx, nrows, ncols);
    %figure, imshow(pixel_labels,[]), title('image labeled by cluster index');
    
    % find cluster number associated with hand color 
    mean_cluster_value = mean(cluster_center,2);
    [tmp, idx] = sort(mean_cluster_value);
    cluster_num = idx(nColors);

    % create segmented image 
    [r,c] = size(image_rgb(:,:,1));
    image_seg = ones(r,c);
    for i=1:1:r
        for j=1:1:c
            if pixel_labels(i,j) ~= cluster_num
                image_seg(i,j) = 0;
            end
        end
    end
    
    % Filling holes in the image
    image_seg = imfill(image_seg);

    segmented = image_seg;
    % Top border coordinates
    [rt,colt] = findBorder(image_seg,'top');
    % Bottom border coordinates
    [rb,colb] = findBorder(image_seg,'bottom');
    % Right border coordinates
    [rr,colr] = findBorder(image_seg,'right');
    % Left border coordinates
    [rl,coll] = findBorder(image_seg,'left');

    % Plotting segmented image with its localization
    imshow(image_seg);
    hold on;
    rectangle('Position',[coll,rt,(colr - coll),(rb - rt)],...
             'LineWidth',2,'LineStyle','--','EdgeColor','r');
    hold off;

end