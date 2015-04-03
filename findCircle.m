function [cx cy r] = findCircle(img1, circleThreshold)
% The function will input a greyscale image img and a scalar threshold circleThreshold
% for binarizing the image. The outputs are the image coordinates of the center
% of the sphere cx and cy and the raidus of the sphere in pixels r.

BLACK = 0.0;
WHITE = 1.0;

[row, col] = size(img1);
binarized = zeros(row, col);

for i=1:row
    for j=1:col
        if(img1(i,j)>circleThreshold)
            binarized(i,j) = BLACK;
        else
            binarized(i,j) = WHITE;
        end
    end
end

% %//debug: shows a black circle on white
% %assume perfect thresholding, perfect circle
% imshow(binarized);
% pause;

isStart1Found = false;
isStart2Found = false;
isEnd1Found = false;
isEnd2Found = false;

%probable circle, S for startpts, E for endpts
%
%   S1E11S
%  11111111
% 1111111111
%  11111111
%   11E111

for i=1:row
    for j=1:col
        if(binarized(i,j) == BLACK)
            if(isStart1Found == false)
                startpt1 = [i j];
                isStart1Found = true;
            elseif(isStart2Found == false)  %redundant if
                startpt2 = [i j];
            end
        else
            if(isStart1Found == true)
                isStart2Found = true;  %redundant, can replace w break?
            end
        end
    end
end

cx = round( ((double(startpt2(2)-startpt1(2))) / 2.0) + startpt1(2) );

for i=startpt1(1):row
    if(binarized(i,cx) == BLACK)
        if(isEnd1Found == false)
            endpt1 = [i cx];
            isEnd1Found = true;
        elseif(isEnd2Found == false)  %redundant if
            endpt2 = [i cx];
        end
    else
        if(isEnd1Found == true)
            isEnd2Found = true;  %redundant, can replace w break?
        end
    end

end

r = (double(endpt2(1)-endpt1(1))) / 2.0;
cy = round(endpt1(1)+r);

% %draw centre
% for dy=-10:10
%     binarized(cy+dy, cx) = 0.75;
% end
% for dx=-10:10
%     binarized(cy, cx+dx) = 0.75;
% end
% 
% %draw radius
% for dr=1:r
%     binarized(cy, cx-dr) = 1.0;
% end
% 
% %//debug
% imshow(binarized);

end