%{
%% (a)
clc;clf;clear all;
inputIm = imread('wdc1.jpg');
refIm = imread('wdc2.jpg');
points1 = GetPoints(inputIm);
points2 = GetPoints(refIm);
save points.mat points1 points2 
%}
%{
%% (d): crop
clc;clf;
inputIm = imread('crop1.jpg');
refIm = imread('crop2.jpg');
t1 = importdata('cc1.mat');
t2 = importdata('cc2.mat');
H = computeH(t1,t2);
disp(H);
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);
imwrite(warpIm,'crop_warp_1.jpg');
imwrite(mergeIm,'crop_merge_1.jpg');
%}
%{
%% (d): wdc
clc;clf
load('points.mat');
H = computeH(points1,points2);
inputIm = imread('wdc1.jpg');
refIm = imread('wdc2.jpg');
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);
imwrite(warpIm,'wdc_warp.jpg');
imwrite(mergeIm,'wdc_merge.jpg');
%}
%}
%%% (e) www.card.zju.edu.cn
%% (e) photos taken by Jiayi Lei
clc;clf;clear all;
inputIm = imread('MU1.jpg');
refIm = imread('MU2.jpg');
p1 = GetPoints(inputIm);
p2 = GetPoints(refIm);
H = computeH(p1,p2);
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);
imwrite(warpIm,'MU_warp.jpg');
imwrite(mergeIm,'MU_merge.jpg');

%% (f) 
clc;clf;clear all;
inputIm = imread('slide.jpg');
refIm = imread('board.jpg');
p1 = GetPoints(inputIm);
p2 = GetPoints(refIm);
H = computeH(p1,p2);
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);
imwrite(warpIm,'slide_warp.jpg');
imwrite(mergeIm,'slide_merge.jpg');
<<<<<<< HEAD
%}
=======

%% Optional (a) RANSAC
clc;clf;
inputIm = imread('crop1.jpg');
refIm = imread('crop2.jpg');
t1 = importdata('cc1.mat');
t2 = importdata('cc2.mat');
H = RANSAC(t1,t2);
disp(H);
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);
imwrite(warpIm,'crop_warp_RANSAC.jpg');
imwrite(mergeIm,'crop_merge_RANSAC.jpg');
>>>>>>> f003eadd7b0e9697f9a0dae5d7a1ea4ff0a19cac
