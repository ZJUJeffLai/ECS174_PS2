%% (a)
clc;clf;clear all;
inputIm = imread('wdc1.jpg');
refIm = imread('wdc2.jpg');
points1 = GetPoints(inputIm);
points2 = GetPoints(refIm);
save points.mat points1 points2 

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


%% (d): wdc
clc;clf
load('points.mat');
H = computeH(points1,points2);
inputIm = imread('wdc1.jpg');
refIm = imread('wdc2.jpg');
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);
imwrite(warpIm,'wdc_warp.jpg');
imwrite(mergeIm,'wdc_merge.jpg');

%% (e) www.card.zju.edu.cn
clc;clf;clear all;
inputIm = imread('zju2.jpg');
refIm = imread('zju1.jpg');
p1 = GetPoints(inputIm);
p2 = GetPoints(refIm);
H = computeH(p1,p2);
[warpIm, mergeIm] = warpImage(inputIm, refIm, H);
imwrite(warpIm,'zju_warp.jpg');
imwrite(mergeIm,'zju_merge.jpg');

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