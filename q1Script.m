datadir     = '../data/q1/scene';
sceneNum    = 1;

dirname = sprintf('%s%d', datadir, sceneNum);
[globalImg, directImg] = separateGlobalDirect(dirname);

figure(1);
imshow(globalImg);
title('global');
figure(2);
imshow(directImg);
title('direct');
% subplot(1,2,1), subimage(globalImg)
% subplot(1,2,2), subimage(directImg);
pause;

sceneNum = sceneNum + 1;
dirname = sprintf('%s%d', datadir, sceneNum);
[globalImg, directImg] = separateGlobalDirect(dirname);
% subplot(1,2,1), subimage(globalImg)
% subplot(1,2,2), subimage(directImg);

figure(1);
imshow(globalImg);
title('global');
figure(2);
imshow(directImg);
title('direct');