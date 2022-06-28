clear all;  clc; close all;

path_directory='E:\codes'; % 'Folder name'
original_files=dir([path_directory '/*.png']); 
for x=1:length(original_files)
      filename=[path_directory '/' original_files(x).name];
      img=im2double(imread(filename));
      
tic
% Bilateral(img,d,sigmaColor,sigmaSpace)
% d: Diameter of each pixel neighborhood.
% sigmaColor: Value of \sigma  in the color space. The greater the value, the colors farther to each other will start to get mixed.
% sigmaSpace: Value of \sigma  in the coordinate space. The greater its value, the more further pixels will mix together, given that their colors lie within the sigmaColor range.
bf=Bilateral(img,5,3,.1);
out = Butterworth(bf,120);
k=1.5;
AUSM=img+ k.*(img-out);
toc

ImageFolder='E:\codes\save2';
baseFileName = sprintf('Image%d.png',x);
fullFileName = fullfile(ImageFolder,baseFileName);
imwrite(AUSM,fullFileName);
end


