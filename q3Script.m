darkThreshold   = 0.2; %set

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
% 
% % %Visualization only below this line
% %  step = 10;
% %  X = 1:step:size(img1,2);
% %  Y = 1:step:size(img1,1);
% %  U = reshape(normals(1,:), size(img1));
% %  V = reshape(normals(2,:), size(img1));
% %  U = U(1:10:end, 1:10:end);
% %  V = V(1:10:end, 1:10:end);
% %  
% %  figure(1);
% %  hold off;
% %  imshow(img1);
% %  hold on;
% %  quiver(X,Y,U,V);
% %  title('Computed Surface Normals');
% %  
% %  figure(2);
% %  imagesc(albedo);
% %  title('Unnormalized Albedo');
% 
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