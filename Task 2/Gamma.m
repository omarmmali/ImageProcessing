function R = Gamma(I, gammaValue)
%GAMMA Summary of this function goes here
%   Detailed explanation goes here
I = double(I);
R = I.^(gammaValue);
R = Contrast(R , 0 , 255);
R = uint8(R);
end