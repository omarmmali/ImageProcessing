function  R = Brightness(I, Ch, Offset)
%Add specific value to a specific channel
%R = Red , G = Green , B = Blue .
[H W L] = size(I);
if (L == 1)
    I = I + Offset;
    R = I;
    return;
end
if (strcmp(Ch, 'R'))
    I(:,:,1) =  I(:,:,1) + Offset;
elseif (strcmp(Ch, 'G'))
    I(:,:,2) =  I(:,:,2) + Offset;
elseif (strcmp(Ch, 'B'))
    I(:,:,3) =  I(:,:,3) + Offset;
end
 R = I;
end

