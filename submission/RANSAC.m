function [H] = RANSAC(t1, t2)
% compute the associated 3x3 homography matrix H
% input: t1,t2
% t1,t2: a set of corresponding image points
% t1,t2: 2xN matrices
% H: associated 3x3 homography matrix
% n >= 4 pairs

length1 = length(t1);
length2 = length(t2);
k = ceil(log(0.03)/log(1-0.5^length1));
optimal_count = 0;
optimal_H = [];
[height,width] = size(t1);
if height~=2||width<4
    error('Cannot Work for wrong pairs')
end
[height2,width2] = size(t2);
if height2~=2||width2<4
    error('Cannot Work for wrong pairs')
end

t_1 = t1';
t_2 = t2';

for num=1:k
    rando=randperm(length(t_1),4);
    A = [];
    for i = 1:4
        A_part = [t_1(rando(i),1) t_1(rando(i),2) 1 0 0 0 (-t_1(rando(i),1) * t_2(rando(i),1)) (-t_1(rando(i),2)*t_2(rando(i),1)) -t_2(rando(i),1);
                  0 0 0 t_1(rando(i),1) t_1(rando(i),2) 1 (-t_1(rando(i),1) * t_2(rando(i),2)) (-t_1(rando(i),2)*t_2(rando(i),2)) -t_2(rando(i),2)];
        A = [A;
             A_part];
    end
    
    [V,~] = eig(A'*A);
    H = V(:,1);
    H = reshape(H,3,3)';
    
    
    t1_H = H * [t1;ones(1,length1)];
    t1_H = t1_H./t1_H(3,:);
    
    count = sum(sum(([t2;ones(1,length2)]-t1_H).^2)<4);
    if count>optimal_count
        optimal_count = count;
        optimal_H = H;
    end
end

H = optimal_H;
end
