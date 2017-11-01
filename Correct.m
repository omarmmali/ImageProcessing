function [ NumOfWrongAnswers ] = Corret( ModelSheet,AnswerSheet )
%CORRET Summary of this function goes here
%   Detailed explanation goes here
NumOfWrongAnswers = typecast(0,'double');
[H W L] = size(ModelSheet);
if(L==3)
    ModelSheet=rgb2gray(ModelSheet);
end
[H W L] = size(AnswerSheet);
if(L==3)
    AnswerSheet=rgb2gray(AnswerSheet);
end
X = ModelSheet-AnswerSheet;
[h,w] = size(X);
imshow(X);

for i=1:h
    for j=1:w
        if(i+7<h && j+7<w)
            sum=typecast(0,'double');
            for a=i:i+7
                for b=j:j+7
                    if(X(a,b)~= 0 && X(a,b) ~= 255)
                        sum = sum + 1;
                    end
                end
            end
            if(sum>20)
                NumOfWrongAnswers = NumOfWrongAnswers + 1;
                for a=i:i+7
                    for b=j:j+7
                        X(a,b)=typecast(0,'double');
                    end
                end
            end
        end
    end
end
end

