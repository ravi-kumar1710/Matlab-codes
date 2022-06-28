%% Title: Amended Unsharp Mask Filter for Image Sharpening 

%% Created by Zohair Al-Ameen.
% Department of Computer Science, 
% College of Computer Science and Mathematics,
% University of Mosul, 
% Mosul, Nineveh, Iraq

%% Please report bugs and/or send comments to Zohair Al-Ameen.
% Email: qizohair@uomosul.edu.iq

%% When you use this code or any part of it, please cite the following article:  
% Zohair Al-Ameen, Alaa Muttar, and Ghofran Al-Badrani, 
% "Improving the Sharpness of Digital Image Using an Amended Unsharp Mask Filter." 
% International Journal of Image, Graphics and Signal Processing, vol. 11, no. 3, (2019): pp. 1-9. DOI: 10.5815/ijigsp.2019.03.01 
%% INPUTS
% img --> is a given unclear image
% k -- > controls the amount of sharpness enhancement

%% OUTPUT
% AUSM --> sharpened image.

%% Starting implementation %%
clear all;  clc; close all;
img=im2double(imread('3.jpg'));

tic
bf=Bilateral(img,5,3,.1);
out = Butterworth(bf,120);
k=1.5;
AUSM=img+ k.*(img-out);
toc

figure;imshow(img); title('Orignal')
figure;imshow(AUSM); title('AUSM-Enhanced')
% imwrite(result,'3_AUSM_k1.5.jpg')