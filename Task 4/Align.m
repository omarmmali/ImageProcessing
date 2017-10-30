function [AlignedImage, Corners] = Align(InputImage, DW, DH)
%PREPROCCESSING Summary of this function goes here
%   Detailed explanation goes here

[Hi Wi L] = size(InputImage);
red = 0;
green = 0;
blue = 0;

for i =  1:Hi
    for j =  1:Wi
       if(InputImage(i,j,1) >= 205 && InputImage(i,j,2) >= 205 && InputImage(i,j,3) >= 205)
           red = 0;
           green = 0;
       end
        if (InputImage(i,j,1) > InputImage(i,j,2) && InputImage(i,j,1) > InputImage(i,j,3))
            red = 1;
        end
        if (InputImage(i,j,2) > InputImage(i,j,1) && InputImage(i,j,2) > InputImage(i,j,3))
        green = 1;
        end
        if (red == 1 && green ==1)
            col = j;
            break;
        end
    end
        if (red == 1 && green ==1)
            Corners = [i;col];
        if(InputImage(i,col+1,1) >= 205 && InputImage(i,col+1,2) >= 205 && InputImage(i,col+1,3) >= 205)
           break; 
       end
       end      
end

red = 0;
green = 0;
blue = 0;

for i =  1:Hi
    for j =  1:Wi
        
        if (InputImage(i,j,1) >= 205 && InputImage(i,j,2) >= 205 && InputImage(i,j,3) >= 205)
        red = 0;
        
        elseif (InputImage(i,j,1) > InputImage(i,j,2) && InputImage(i,j,1) > InputImage(i,j,3))
        red = 1;
            if (InputImage(i,j+1,1) >= 205 && InputImage(i,j+1,2) >= 205 && InputImage(i,j+1,3) >= 205)
                break;
            end
        end
        
    end
    if(red == 1)
        Corners = [Corners [i;j]];
        break;
    end
end

red = 0;
green = 0;
blue = 0;

for i =  1:Hi
    for j =  1:Wi
        
        if (InputImage(i,j,1) >= 205 && InputImage(i,j,2) >= 205 && InputImage(i,j,3) >= 205)
        blue = 0;
        
        elseif (InputImage(i,j,3) > InputImage(i,j,2) && InputImage(i,j,3) > InputImage(i,j,1))
        blue = 1;
            if (InputImage(i,j+1,1) >= 205 && InputImage(i,j+1,2) >= 205 && InputImage(i,j+1,3) >= 205)
                break;
            end
        end
        
    end
    if(blue == 1)
        Corners = [Corners [i;j]];
        break;
    end
end

red = 0;
green = 0;
blue = 0;


for i =  1:Hi
    for j =  1:Wi
        
        if (InputImage(i,j,1) >= 205 && InputImage(i,j,2) >= 205 && InputImage(i,j,3) >= 205)
        green = 0;
        
        elseif (InputImage(i,j,2) > InputImage(i,j,1) && InputImage(i,j,2) > InputImage(i,j,3))
        green = 1;
            if (InputImage(i,j+1,1) >= 205 && InputImage(i,j+1,2) >= 205 && InputImage(i,j+1,3) >= 205)
                break;
            end
        end
        
    end
    if(green == 1)
        Corners = [Corners [i;j]];
        break;
    end
end

desired = [1 DW DW 1;1 1 DH DH];
temp = Corners;
Corners(1,:) = temp(2,:);
Corners(2,:) = temp(1,:);
AlignedImage = Warp(InputImage,Corners,desired);

end

