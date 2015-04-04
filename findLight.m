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
z = sqrt( r^2 - (x-cx)^2 - (y-cy)^2 );

intensity = img(y,x);
centre = [cx cy 0];
brightest = [x y z];
lv = brightest - centre;
mag = sqrt( abs(lv(1)^2 + lv(2)^2 + lv(3)^2) );
lv = lv / mag;
lv = intensity * lv;

% % //debug: check lv
% imshow(img);
% hold on;
% line([cx,x],[cy,y],'Color','r','LineWidth',2);
% hold off;
% pause;

end