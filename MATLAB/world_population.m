% world_population
% {Eric Sanacore}
%-- 1/18/2019 11:10 AM --%
pops = csvread('World_Population_Over_Time.csv', 1, 0);
pops(14,: ) = [];
plot(pops(:,1), pops(:,2));
title('WORLD POPULATION');
xlabel('Year');
ylabel('Population in millions');
axis([0 2200 0 7000]);