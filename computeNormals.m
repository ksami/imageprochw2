function [normals albedo] = computeNormals(img1, img2, img3, lv1, lv2, lv3, threshold)
% The function will input 3 greyscale images img1, img2 and img3 and the light
% sources for each of those images lv1, lv2 and lv3 respectively. threshold
% decides which pixels to ignore when calculating normals.

[row, col] = size(img1);
albedo = zeros(size(img1));
normals = zeros(3, row*col);

idx = 0;

for y=1:row
    for x=1:col
        idx = idx + 1;
        
        if(img1(y,x)<threshold || img2(y,x)<threshold || img3(y,x)<threshold)
            continue;  %consider next pixel
        end

        % Compute normal %
        I = [img1(y,x); img2(y,x); img3(y,x)];
        S = [lv1; lv2; lv3];

        n = inv(S)*I;
        mag = norm(n);
        albedo(y,x) = mag;
        normals(1,idx) = n(1)/mag;
        normals(2,idx) = n(2)/mag;
        normals(3,idx) = n(3)/mag;
    end
end