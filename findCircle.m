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

%//debug: shows a black circle on white
%ie. perfect thresholding
imshow(binarized);
pause;

isStart1Found = false;
isStart2Found = false;
isConsidering = false;
prevRowBlackFound = 0;

for i=1:row
    for j=1:col
        if(binarized(i,j) == BLACK)
            if(isStart1Found == false)
                startpt1 = [i j];
                isStart1Found = true;
            elseif(isStart2Found == false)
                startpt2 = [i j];
            end
        else
            if(isStart1Found == true)
                isStart2Found = true;
            end
        end
%         if(binarized(i,j) == BLACK)
%             prevRowBlackFound = i;
%             if(isStartFound == false)
%                 startpt = [i j];
%                 isStartFound = true;
%             else
%                 endpt = [i j];
%             end
%         elseif(isStartFound == true && i~=prevRowBlackFound)
%             break;
%         end
    end
end

r = (double(endpt(1)-startpt(1))) / 2.0;
cx = startpt(2);
cy = startpt(1)+r;

end