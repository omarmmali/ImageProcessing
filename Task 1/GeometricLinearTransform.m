function result = GeometricLinearTransform( I,M )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% Get image dimnsions

[H, W ,L] = size(I) ;
a = M*[1;1;1];
b = M*[1;W;1];
c = M*[H;1;1];
d = M*[H;W;1];
% Create new buffer
minX=ceil(min([a(1,1),b(1,1),c(1,1),d(1,1)]));
minY=ceil(min([a(2,1),b(2,1),c(2,1),d(2,1)]));

trans = [1,0,-minX+1;0,1,-minY+1;0 0 1];

maxX=ceil(max([a(1,1),b(1,1),c(1,1),d(1,1)]));
maxY=ceil(max([a(2,1),b(2,1),c(2,1),d(2,1)]));

result = uint8(zeros(maxX, maxY, L));

% Apply the translation (pixel by pixel)
for	x=1:H
	for y=1:W
		temp = trans*M*[x ; y ;1];
        result(temp(1,1),temp(2,1),:) = I(x,y,:);
	end
end
end

