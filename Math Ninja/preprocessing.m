%% Image segmentation and extraction

%% Read Image
I = imread('Case 3/3.2.jpg');

%% Show image
figure(1) 
imshow(I);
title('INPUT IMAGE WITH NOISE')

%% Convert to gray scale
if size(I,3)==3 % RGB image
  I=rgb2gray(I);
end

[H, W] = size(I);
%% Convert to binary image
threshold = graythresh(I);
I = ~im2bw(I,threshold);

%% Remove all object containing fewer than 30 pixels
I = bwareaopen(I, 30);


pause(1)

%% Show image binary image
figure(2)
imshow(~I);
title('INPUT IMAGE WITHOUT NOISE')

%% Label connected components
[L, number_of_cc] = bwlabel(I);
[L1, number_of_cc2] = bwlabel(~I);
if(number_of_cc2 > number_of_cc)
    L = L1;
    number_of_cc = number_of_cc2;
    I = ~I;
end
%% Measure properties of image regions
region_props = regionprops(L,'BoundingBox');

hold on

%% Plot Bounding Box
for n = 1 : size(region_props, 1)
  rectangle('Position',region_props(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
holdimclearborder off