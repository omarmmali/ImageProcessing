function R = GeometricLinearTransform( I,W )

%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Get image dimnsions
[Hi, Wi ,L] = size(I) ;
a = W*[0;0;1];
b = W*[Wi;Hi;1];
c = W*[Wi;0;1];
d = W*[0;Hi;1];

minX=min([a(1,1),b(1,1),c(1,1),d(1,1)]);
minY=min([a(2,1),b(2,1),c(2,1),d(2,1)]);

maxX=max([a(1,1),b(1,1),c(1,1),d(1,1)]);
maxY=max([a(2,1),b(2,1),c(2,1),d(2,1)]);


%trans = [-minX;-minY];


newH = maxY - minY;
newW = maxX - minX;

%W = [W trans];
%W = [W ; 0 0 1];

result = uint8(zeros(newH,newW, L));

trans= [-minX;-minY;0];

% Apply the translation (pixel by pixel)
  for hight = 1:Hi
    for width = 1:Wi
        newP = double(W * [width;hight;1]);
        newP = int32(trans + newP + 1);
        X = newP(1);
        Y = newP(2);
        result(Y,X,:) = I(hight,width,:);
    end
  end
  R = result;
end


