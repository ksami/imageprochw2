function [lv] = findLight(img, cx, cy, r)
% The function will input a greyscale image img along with the center coordinates
% of the sphere in that image (cx and cy) along with the sphere's radius r. The
% function will output lv a vector of length 3 pointing in the direction of the
% light source.

[row, col] = size(img);

% Find brightest pixel %
%matrices indexed as
%1 4 7
%2 5 8
%3 6 9
[val, idx] = max(img(:));
i = mod(idx, row);
j = ceil(double(idx)/row);

% Find normal %
%using sphere eqn and distance away from cx cy can get z?

end