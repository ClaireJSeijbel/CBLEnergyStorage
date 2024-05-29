
% Load the data from the file
data = readtable('data100hz.txt', 'Delimiter', '\t');

% Extract the columns
x = data.Var1;
y = data.Var2;

% Plot the data

plot(x, y);
xlabel('X-axis '); 
ylabel('Y-axis ');  
title('Your Graph Title'); % Title
grid on; % Optional, adds a grid to the plot
