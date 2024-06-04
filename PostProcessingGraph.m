% Load the data from the file
data = readtable('dataPressureSensor11.txt', 'Delimiter', '\t');

% Extract the columns
x = data.Var1;
y = data.Var2;

% Calculate the mean of pressure readings (original scale)
average_pressure = mean(y);

% Apply conversion factor to y-axis values and mean
converted_y = (y * 5 / 1023) * 0.25;
converted_average_pressure = (average_pressure * 5 / 1023) * 0.25;

% Plot the converted data with a blue line
plot(x, converted_y, 'b');
hold on;  % This allows plotting multiple lines on the same figure

% Plot the converted mean value as a red horizontal line
plot(x, ones(size(x))*converted_average_pressure, 'r--');

% Calculate the mean of the calibrated curve (offset applied)
mean_calibrated_y = mean(converted_y) - 0.145;

% Plot the mean calibrated curve (red dashed line)
plot(x, ones(size(x))*mean_calibrated_y, 'b--');

% Plot the calibrated curve with offset (green solid line)
plot(x, converted_y - 0.145, 'g');  % Green solid line for calibrated curve

% Label and title the plot (update y-axis label)
xlabel('Steps ');
ylabel('Pressure in MPa');  
title('Pressure Sensor Readings (Converted)');
grid on; % Optional, adds a grid to the plot
legend('Converted Data', 'Converted Mean Pressure', ...
       'Mean Calibrated Curve', 'Calibrated Curve');  

% Set y-axis limits (optional, if needed)
ylim([0 0.3]);  % Adjust based on your data range 
