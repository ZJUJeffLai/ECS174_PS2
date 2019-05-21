function H = computeH(t1, t2)
% compute the associated 3x3 homography matrix H
% input: t1,t2
% t1,t2: a set of corresponding image points
% t1,t2: 2xN matrices
% H: associated 3x3 homography matrix
% n >= 4 pairs
t1 = t1';
t2 = t2';
A = [];
for i = 1 : length(t1)
    A_part = [t1(i,1) t1(i,2) 1 0 0 0 (-t1(i,1) * t2(i,1)) (-t1(i,2)*t2(i,1)) -t2(i,1);
        0 0 0 t1(i,1) t1(i,2) 1 (-t1(i,1) * t2(i,2)) (-t1(i,2)*t2(i,2)) -t2(i,2)];
    A = [A;A_part];
end
[V,~] = eig(A'*A);
H = V(:,1);
H = reshape(H,3,3)';
end

