%Missing Planes - Eric Sanacore

%Clear workspace, set colormap to gray
colormap('gray');

%Reads in and displays picture of planes 'Before'
beforePicture = imread('planes1.bmp');
subplot(4,1,1);
imagesc(beforePicture);
axis off;
title BEFORE;

%Reads in and displays picture of planes 'After'
afterPicture = imread('planes2.bmp');
subplot(4,1,2);
imagesc(afterPicture);
axis off;
title AFTER;

%Displays the difference of the two picture, with maximum point
differencePicture = beforePicture - afterPicture;
subplot(4,1,3);
imagesc(differencePicture);
hold on
maximum = max(max(differencePicture));
[x,y] = find(differencePicture==maximum)
plot(y,x,'r.')
txt = 'max';
text(y+5,x+5,txt,'Color','red','FontSize',8)
axis off;
title DIFFERENCE;


%Displays thresholded black and white
threshold = (.15*maximum)
thresholdArray = (differencePicture >= threshold);
subplot(4,1,4);
imagesc(thresholdArray);
axis off;
title THRESHOLD;