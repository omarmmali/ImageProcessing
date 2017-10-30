function R = Warp(I1, Pts1, Pts2)
%IMWARP Summary of this function goes here
% I1: first image (rgb) to be warped
% Pts1(P): 2×N matrix containing N points (x, y) on the first image
% Pts2(Q): 2×N matrix containing the corresponding N points on the second image

%Append ones row to the points
[H1 , W1] = size(Pts1);
[H2 , W2] = size(Pts2);
Pts1 = [Pts1;ones(1,W1)];
Pts2 = [Pts2;ones(1,W2)];

% Apply Equation W = QP^T (PP^T)^-1 Get W 
TransposedP = transpose(Pts1);
FirstHalf  = Pts2 * TransposedP;
SecondHalf = Pts1 * TransposedP;
SecondHalf = SecondHalf^-1;
W = FirstHalf * SecondHalf;

%Apply Reverse mapping
R = GeometricLinearTransform(I1,W);

DW = Pts2(1,3);
DH =  Pts2(2,3);

R = imcrop(R,[1 1 DW DH]);
end

