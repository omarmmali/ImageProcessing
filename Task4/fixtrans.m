function [ Fixed ,Xtrans,Ytrans ] = fixtrans( Model , Trans )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[H W L] = size(Model);
if(L==3)
    Model=rgb2gray(Model);
end
[H W L] = size(Model);
if(L==3)
    Trans=rgb2gray(Trans);
end
FT_Model = fft2(Model);
FT_Trans = fft2(Trans);
Cofficient = (FT_Trans.*conj(FT_Model))./(abs(FT_Trans.*conj(FT_Model)));
I_Coffiecient = ifft2(Cofficient);
[h , w] = size(I_Coffiecient);
max=-100;
Xtrans = 0;
Ytrans = 0;
 for i = 1:h
     for j = 1:w
       if(I_Coffiecient(i,j)>max)
         max =  I_Coffiecient(i,j);
         Xtrans = i;
         Ytrans = j;
       end
     end
 end
 
if(Xtrans >= h/2) 
    Xtrans = h-Xtrans;
    Xtrans = Xtrans*-1;
end
Xtrans = Xtrans-1;

if(Ytrans >= w/2) 
    Ytrans = w-Ytrans;
    Ytrans = Ytrans*-1;
end
Ytrans = Ytrans-1;

Fixed = uint8(zeros(h,w));
 for i = 1:h
     for j = 1:w
         if((i-Xtrans >0 && j-Ytrans>0)&&(i-Xtrans < h && j-Ytrans < w))
            Fixed(i-Xtrans,j-Ytrans) = Trans(i,j) ;
         end
     end
 end
end

