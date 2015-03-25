datadir     = '../data/q1/scene';
sceneNum    = 1;

dirname = sprintf('%s%d', datadir, sceneNum);
[globalImg, directImg] = separateGlobalDirect(dirname);
subplot(1,2,1), subimage(globalImg)
subplot(1,2,2), subimage(directImg);
pause;

sceneNum = sceneNum + 1;
dirname = sprintf('%s%d', datadir, sceneNum);
[globalImg, directImg] = separateGlobalDirect(dirname);
subplot(1,2,1), subimage(globalImg)
subplot(1,2,2), subimage(directImg);