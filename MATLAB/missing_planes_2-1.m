%Missing Planes 2 - Eric Sanacore

%Clear workspace, set colormap to gray
colormap('gray')

%Reads in and displays picture of planes 'Before'
beforePicture = imread('planes1.bmp');
subplot(5,1,1)
imagesc(beforePicture);
axis off;
title BEFORE;


%Reads in and displays picture of planes 'After'
afterPicture = imread('planes2.bmp');
subplot(5,1,2)
imagesc(afterPicture);
axis off;
title AFTER;


%Displays the difference of the two picture, with maximum point
differencePicture = beforePicture - afterPicture;
subplot(5,1,3);
imagesc(differencePicture);
hold on
maximum = max(max(differencePicture));
[x,y] = find(differencePicture==maximum);
plot(y,x,'r.')
txt = 'max';
text(y+5,x+5,txt,'Color','red','FontSize',8)
axis off;
title DIFFERENCE;


%Displays thresholded black and white
threshold = (.13*maximum);
thresholdArray = (differencePicture >= threshold);
subplot(5,1,4)
imagesc(thresholdArray)
axis off
title 'THRESHOLD'


%Copy of thresholdValue image array
thresholdArrayCopy = thresholdArray;


%Determines values of i and j based on size of given array
[iMax,jMax] = size(thresholdArrayCopy);

%Checks value of 'inside' array entries and makes decisions
for i = 2:iMax-1;
    for j = 2:jMax-1;
        
%Creates variables with respect to linear index position in 3x3 'sub-array'
indexOne = thresholdArray(i-1,j+1);
indexTwo = thresholdArray(i-1,j);
indexThree = thresholdArray(i-1,j-1);
indexFour = thresholdArray(i,j+1);
indexFive = thresholdArray(i,j);
indexSix = thresholdArray(i,j-1);
indexSeven = thresholdArray(i+1,j+1);
indexEight = thresholdArray(i+1,j);
indexNine = thresholdArray(i+1,j-1);
sum_of_all_neighbors = indexOne+indexTwo+indexThree+indexFour+indexFive+indexSix+indexSeven+indexEight+indexNine;
    
    
%Checks if current element at index five of 3x3 'sub-array' value is one, sets to 0 if none are 
if indexFive == 1
    if sum_of_all_neighbors <= 3
        thresholdArrayCopy(i,j) = 0;
    end
end
    
end
end

% %Checks value of 'left-border' array entries and makes decisions
% j = 1;
% for i = 2:iMax-1;
%  %Creates variables with respect to linear index position in 3x2 'sub-array'
% indexOne = thresholdArray(i-1,j);
% indexTwo = thresholdArray(i,j);
% indexThree = thresholdArray(i+1,j);
% indexFour = thresholdArray(i-1,j+1);
% indexFive = thresholdArray(i,j+1);
% indexSix = thresholdArray(i+1,j+1);
% sum_of_all_neighbors = indexOne+indexTwo+indexThree+indexFour+indexFive+indexSix
% end


% %Checks value of 'right-border' array entries and makes decisions
% j = jMax;
% for i = 2:iMax-1;
% %Creates variables with respect to linear index position in 3x2 'sub-array'
% indexOne = thresholdArray(i-1,j-1);
% indexTwo = thresholdArray(i,j-1);
% indexThree = thresholdArray(i+1,j-1);
% indexFour = thresholdArray(i+1,j);
% indexFive = thresholdArray(i,j);
% indexSix = thresholdArray(i+1,j);
% sum_of_all_neighbors = indexOne+indexTwo+indexThree+indexFour+indexFive+indexSix
% end


% %Checks value of 'top-border' array entries and makes decisions, Creates variables with respect to linear index position in 3x2 'sub-array'
% i = 1;
% for j = 2:jMax-1
% indexOne = thresholdArray(i,j-1);
% indexTwo = thresholdArray(i+1,j-1);
% indexThree = thresholdArray(i,j);
% indexFour = thresholdArray(i+1,j);
% indexFive = thresholdArray(i,j+1);
% indexSix = thresholdArray(i+1,j+1);
% sum_of_all_neighbors = indexOne+indexTwo+indexThree+indexFour+indexFive+indexSix
% end


% %Checks value of 'bottom-border' array entries and makes decisions
% i = iMax;
% for j = 2:jMax-1
% indexOne = thresholdArray(i-1,j-1);
% indexTwo = thresholdArray(i-1,j);
% indexThree = thresholdArray(i,j+1);
% indexFour = thresholdArray(i,j-1);
% indexFive = thresholdArray(i,j);
% indexSix = thresholdArray(i,j+1);
% sum_of_all_neighbors = indexOne+indexTwo+indexThree+indexFour+indexFive+indexSix
% end
   
% 
% %Sets 'corner' array entries to 0
% thresholdArrayCopy(1) = 0;
% thresholdArrayCopy(251) = 0;
% thresholdArrayCopy(1,end) = 0;
% thresholdArrayCopy(end) = 0;

%Sets all 'border' entries to 0
thresholdArrayCopy(:,1) = zeros(length(thresholdArrayCopy(:,1)),1) == 1;
thresholdArrayCopy(:,end) = zeros(length(thresholdArrayCopy(:,1)),1) == 1;
thresholdArrayCopy(1,:) = zeros(1,length(thresholdArrayCopy(1,end))) == 1;
thresholdArrayCopy(end,:) = zeros(1,length(thresholdArrayCopy(1,end))) == 1;


%Use find_clusters function to create cell array with cluster data
clusterArray = find_clusters((thresholdArrayCopy),1,sqrt(2),threshold);

%Create box around planes
%rectangle('Position',pos)

max_1 = max(clusterArray{1}(:,1));
min_1 = min(clusterArray{1}(:,1));

max_1_2 = max(clusterArray{1}(:,2));
min_1_2 = min(clusterArray{1}(:,2));

max_2 = max(clusterArray{2}(:,1));
min_2 = min(clusterArray{2}(:,1));

max_2_2 = max(clusterArray{2}(:,2));
min_2_2 = min(clusterArray{2}(:,2));

max_3 = max(clusterArray{3}(:,1));
min_3 = min(clusterArray{3}(:,1));

max_3_2 = max(clusterArray{3}(:,2));
min_3_2 = min(clusterArray{3}(:,2));


%Display masked image
subplot(5,1,5)
imagesc(thresholdArrayCopy);
title 'MASKED AND CLUSTERED'
rectangle('Position',[min_1_2,min_1,max_1-min_1,max_1_2-min_1_2],'Edgecolor','g');
rectangle('Position',[min_2_2,min_2,max_2-min_2,max_2_2-min_2_2],'Edgecolor','g');
rectangle('Position',[min_3_2,min_3,max_3-min_3,max_3_2-min_3_2],'Edgecolor','g');
axis off

        