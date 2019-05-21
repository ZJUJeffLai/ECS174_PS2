% (a) Getting correspondences
function [p1,p2] = get_points(img1,img2,n)
im1 = imread(img1);
im2 = imread(img2);
imshow(im1);
[x1,y1] = ginput(n);
imshow(im2);
[x2,y2] = ginput(n);
p1 = [x1 y1]';
p2 = [x2 y2]';
end
