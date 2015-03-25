function [globalImg, directImg] = separateGlobalDirect(dirname)
% [globalImg directImg] = separateGlobalDirect(dirname)
% That input dirname is a path to the set of images to run your separation algorithm
% over (you may assume the images will always be .png files). The outputs globalImg
% and directImg should be images of the same size as the input images containing
% the global and direct components of the illumination respectively.

imglist = dir(sprintf('%s/*.png', dirname));

% Read in images %
for i=1:numel(imglist)

    img = imread(sprintf('%s/%s', dirname, imglist(i).name));

    if (ndims(img) == 3)
        img = rgb2gray(img);
    end

    %change img to double type
    img = double(img) / 255;

    [row, col] = size(img);
    imgs(row, col, numel(imglist)) = 0.0;

    %build 3d array of all images
    for m=1:row
        for n=1:col
            imgs(m, n, i) = img(m, n);
        end
    end

end

% Find max and min %
[row, col, ~] = size(imgs);
maxImg(row, col) = 0.0;
minImg(row, col) = 0.0;

for m=1:row
    for n=1:col
        %along 3rd dimension, obtain max and min
        maxImg(m,n) = max(imgs(m, n, :));
        minImg(m,n) = min(imgs(m, n, :));
    end
end

globalImg = 2 * minImg;
directImg = maxImg - minImg;

end