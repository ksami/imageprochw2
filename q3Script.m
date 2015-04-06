darkThreshold   = 0.2;

path = '../data/q3';

load(sprintf('%s/lights.mat', path));
% 
% img1 = double(imread(sprintf('%s/light01.png', path)))/255;
% img2 = double(imread(sprintf('%s/light02.png', path)))/255;
% img3 = double(imread(sprintf('%s/light03.png', path)))/255;
% 
% %compute normals and albedos with photometric stereo
% [normals albedo] = computeNormals( img1, img2, img3, lv1, lv2, lv3, darkThreshold);
% 
% normals = reshape(normals, size(img1,1), size(img1,2), 3);
% [Ni,Z] = integrability2(normals);
% 
% surfl(Z);
% shading interp;
% colormap gray;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
datadir = '../data/q3';

file = 'light01_checkerboard';
dirname = sprintf('%s/%s', datadir, file);
[globalImg1, directImg1] = separateGlobalDirect(dirname);

file = 'light02_checkerboard';
dirname = sprintf('%s/%s', datadir, file);
[globalImg2, directImg2] = separateGlobalDirect(dirname);

file = 'light03_checkerboard';
dirname = sprintf('%s/%s', datadir, file);
[globalImg3, directImg3] = separateGlobalDirect(dirname);


%compute normals and albedos with photometric stereo
[normals albedo] = computeNormals( directImg1, directImg2, directImg3, lv1, lv2, lv3, darkThreshold);

normals = reshape(normals, size(directImg1,1), size(directImg1,2), 3);
[Ni,Z] = integrability2(normals);

surfl(Z);
shading interp;
colormap gray;