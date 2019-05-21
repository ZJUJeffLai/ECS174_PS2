function [warpIm, mergeIm] = warpImage(inputIm, refIm, H)
inputIm = double(inputIm);
refIm = double(refIm);

[height,width,dim] = size(refIm);
[hi,wi,~] = size(inputIm);
warpIm = zeros(height,width,dim);

H_inv = H^-1;
frame = H*[1,1,wi,wi;
           1,hi,1,hi;
           1,1,1,1];
       
frame = frame./frame(3,:);

max_frame1 = max([frame(1,:),width]);
min_frame1 = min([frame(1,:),0]);
max_frame2 = max([frame(2,:),height]);
min_frame2 = min([frame(2,:),0]);
max_x = fix(max_frame1) - fix(min_frame1);
max_y = fix(max_frame2) - fix(min_frame2);
mergeIm = zeros(max_y,max_x,dim);


for i=1:max_y
    for j=1:max_x
        s = H_inv*[j+fix(min_frame1);
                   i+fix(min_frame2);
                   1];
        x = s(2)/s(3);
        y = s(1)/s(3);
        if x>=1&&y>=1&&x<=hi&&y<=wi
            mergeIm(i,j,:) = (fix(x+1)-x)*(fix(y+1)-y)*inputIm(fix(x),fix(y),:)...
                             + (x-fix(x))*(fix(y+1)-y)*inputIm(fix(x+1),fix(y),:)...
                             + (x-fix(x))*(y-fix(y))*inputIm(fix(x+1),fix(y+1),:)...
                             + (fix(x+1)-x)*(y-fix(y))*inputIm(fix(x),fix(y+1),:);
        end
        if j>-fix(min_frame1)&&i>-fix(min_frame2)&&j<width+1-fix(min_frame1)&&i<height-fix(min_frame2)
            warpIm(i+fix(min_frame2),j+fix(min_frame1),:) = mergeIm(i,j,:);
            mergeIm(i,j,:) = refIm(i+fix(min_frame2),j+fix(min_frame1),:);
        end       
    end
end
warpIm = uint8(warpIm);
mergeIm = uint8(mergeIm);
end