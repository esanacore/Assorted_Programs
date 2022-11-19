%Eric Sanacore - Normal Distribution - CS133 - CRN64535

clear
meanInRange = 0;
meanOutOfRange = 0;
deviationInRange = 0;
deviationOutOfRange = 0;

for i = 1:1000;

x = randn([28000,1]);

mean1 = mean(x);

standardDeviation = std(x);

histogram(x,20)

if mean1 >= -0.1 && mean1 <= 0.1;
    meanInRange = meanInRange + 1;
else
    meanOutOfRange = meanOutOfRange + 1;
end

if standardDeviation >= 0.99 && standardDeviation <= 1.01;
    deviationInRange = deviationInRange + 1;
else
    deviationOutOfRange = deviationOutOfRange + 1;
end
end


meanInRange
meanOutOfRange
deviationInRange
deviationOutOfRange