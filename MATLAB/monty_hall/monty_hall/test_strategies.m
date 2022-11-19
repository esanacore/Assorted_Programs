%Eric Sanacore
%test_strategies
disp(' ')

%Run stay strategy 100K times
numOfGames = 100000;
strategy = 'stay';
stay_win_prob = simulate_monty_hall_strategy(strategy, numOfGames);
disp('Probability of wins if you stay:')
disp(stay_win_prob);

%Run switch strategy 100K times
strategy = 'switch';
switch_win_prob = simulate_monty_hall_strategy(strategy, numOfGames);
disp('Probability of wins if you switch:')
disp(switch_win_prob);
