%Planet Hunter - Eric Sanacore - CS 133


function [noiseRange, radius, volume, orbitalPeriod, orbitalRadius, transitTime] = detect_planet(starBrightness, starRadius, starMass)
%Gravity
gravity = 6.67 * (10^ -11);


%Set up N * 2 vector of star brightness vs. time in days
brightness = starBrightness(:,2);
daysElapsed = starBrightness(:,1);


%maximum value of the calibration period minus the minimum value of the calibration period.noiseRange = 
%Calibration step here:
dayOne = (daysElapsed <= 1);
calibration = brightness(dayOne);
averageBrightness = mean(calibration);
noiseRange = max(calibration) - min(calibration);


%Logic to determine if transit is occuring
%threshold = averageBrightness - noiseRange * 2; 
threshold = 1 - (noiseRange*2); 
transitOccurs = brightness <= threshold;
%transitDoesNotOccur = brightness > threshold;
    
%TWO SCENARIOS - Transit occurs or does not
if sum(transitOccurs) >= 1;
    deltaBrightness = (averageBrightness - mean(brightness(transitOccurs))); %#ok<NASGU>
    
    differenceOfBrightness = abs(diff(brightness));
    
    daysInTransit = daysElapsed(find(differenceOfBrightness >= noiseRange * 2)); %#ok<NASGU,FNDSB>
    
%The planet's orbital period, in days.  As noted above, the orbital period is defined as the time between the start of each transit dip
orbitalPeriod = daysInTransit(3) - daysInTransit(1);


%Orbital Period in seconds
orbitalPeriodSeconds = (orbitalPeriod) * (86400);


%The planet's orbital radius, in meters
%Orbital Period in Seconds squared times gravity times star mass divided by
%4 times pi squared cubed
orbitalRadius = (((orbitalPeriodSeconds ^ 2) * gravity * starMass) / (4 * pi^2)) ^ (1/3);

    
%Planet radius in terms of star radius
%radius_planet = square root of absolute value of the change in
%brightness times the radius of the star
radius = (sqrt(abs(deltaBrightness) * (starRadius) .^2));


%The planet's volume, in cubic meters.  Assume that the planet is spherical.
%4/3 times pi times radius cubed
volume = ((4/3) * pi * ((radius) .^3));

transitTime = mean(daysElapsed(find(diff(transitOccurs) == -1)) - daysElapsed(find(diff(transitOccurs) == 1)));

else
    transitTime = NaN;

    radius = NaN;
    
    volume = NaN;
    
    orbitalPeriod = NaN;
    
    orbitalRadius = NaN;
end

