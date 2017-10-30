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

%translationMatrix = [1.0, 0.0, double(-minX); 0.0, 1.0, double(-minY); 0.0, 0.0, 1.0];
%W = translationMatrix * W;

% Apply the translation (pixel by pixel)
  for hight = 1:newH
    for width = 1:newW
        P = int32((W^-1) * double([width;hight;1]));
        OldY = P(2);
        OldX = P(1);
    if ((OldX > 0 && OldX < Wi) && (OldY > 0 && OldY < Hi))
            result(hight,width,:) = I(OldY,OldX,:);
    end
    end
  end
  R = result;
end

