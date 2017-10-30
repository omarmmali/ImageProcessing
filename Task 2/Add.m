function C = Add( A,B )
%ADD Summary of this function goes here
%   Detailed explanation goes here

[H, W, L] = size(A);
B = imresize(B,[H W]);
C =A+B;

end

