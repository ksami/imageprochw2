function [lv] = findLight(img, cx, cy, r)
% The function will input a greyscale image img along with the center coordinates
% of the sphere in that image (cx and cy) along with the sphere's radius r. The
% function will output lv a vector of length 3 pointing in the direction of the
% light source.

[row, col] = size(img);

% Find brightest pixel (y,x) %
%matrices indexed as
%1 4 7
%2 5 8
%3 6 9
[val, idx] = max(img(:));
y = mod(idx, row);
x = ceil(double(idx)/row);

% Find normal at brightest pixel %
%using sphere eqn, set cz = 0 ie. sphere at (cx, cy, 0)
z = sqrt( abs((x-cx)^2 + (y-cy)^2 - r^2) );

if (isa(img, 'uint8'))
    intensity = double(img(y,x))/255;
else
    intensity = img(y,x);
end

lv = [x y z];
mag = norm(lv);
lv = lv / mag;
lv = intensity * lv;

end