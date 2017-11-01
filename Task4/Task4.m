ans1 =imread('Ans1.bmp');
ans2 = imread('Ans2.bmp');
model = imread('Model.bmp');
[Fixed,X,Y] = fixtrans(model,ans2);
WrongAns = Correct(model,Fixed);
WrongAns
