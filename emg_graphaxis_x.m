%This function will return a vector (i, 2) being i the number of points of
%the time_vector. The two times, in all the lines, will be time-spaced of
%10 seconds. So, it will take a specific time from the time_vector, and add
%or reduce 5 seconds (space_left_right). It will be used to determinate the
%X-axis that will desplayed, with the current event always on the center

function axis_x = emg_graphaxis_x(time_vector) 
    space_left_right = 5; %in order to put the current point in the middles, 5 seconds to the left and 5 to the right
    N = length(time_vector);
    axis_x = zeros(N, 2);
    for i=1:N
        axis_x(i, 1) = double(time_vector(i))/1000.0 - space_left_right; %axes x in seconds
        axis_x(i, 2) = double(time_vector(i))/1000.0 + space_left_right;
    end
end