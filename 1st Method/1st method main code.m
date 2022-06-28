close all
clear all

%I = (double(imread('kodim19.png'))/255);

path_directory='E:\codes'; % 'Folder name'
original_files=dir([path_directory '/*.png']); 
for x=1:length(original_files)
     filename=[path_directory '/' original_files(x).name];
     I=(double(imread(filename))/255);
      
      % Image read is done
    %%Image Operation as per your work
  

G= I;
radius = [11];
Epsilon = [0.01];
kappa = [0.01 0.1 1 5 7.5]; % Kappa controls the sharpening/smoothing level. 
scale = 1;
R = [];
K =[];

   for i=1:length(radius)
     K= []
      for j=1:length(kappa)
         J = SSIF(I,G,radius(i),Epsilon,kappa(j),scale);
         K = [K J];
      end
      R = [R;K];
   end



%destination folder where images needs to be saved
ImageFolder='E:\codes\save3';
baseFileName = sprintf('Image #%d.png',x);
fullFileName = fullfile(ImageFolder,baseFileName);
imwrite (R, fullFileName);

end