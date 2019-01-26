%This function will change the data. It will take the first 'click-in' as
%the first frame.


function [X]=workData(A, y_max)
    [X.time, X.firstframe, X.x, X.y] = calculateTimeandPosition(A, y_max);
end

function [time, firstframe, x, y] = calculateTimeandPosition(A, y_mx) %generates time_vector
                   
                %First Click_in Frame - in terms of app.A.data
                size_vector = length(A.textdata); %the complete size, including before-first-click-in
                aux = zeros(size_vector, 1); %from 0 ms to the end (first to last frame)
                
                %identifies the first click in FRAME (cont)
                for i=2:size_vector
                    text = string(A.textdata(i, 2));
                    if(text == 'CLICK_IN')
                      cont = i; %index like app.A.textdata index
                      break;
                    end
                end
                begin_time_total = A.textdata(cont); %it takes the first date-time from the array
                
                %vector_time calculating
                for i=cont:size_vector
                    current_time_total =  A.textdata(i,1);
                    current_time = char(current_time_total); %convert it to char, so we can handle characters
                    aux(i,1) = milliseconds(diff(datetime([begin_time_total;current_time],'InputFormat','dd/MM/yyyy HH:mm:ss.SSS')));
                end
             
                time = aux(cont:end, 1);
                firstframe = cont; %the frame (in textdata) of the first click_in
                size_time = length(time); %number of frames (time vector)
                %Creating x and y
                x = zeros(size_time, 1);
                y = zeros(size_time, 1);
                
                %in case of target_x appears, the x and y coordinates will
                %be replaced by the last one
                for i=1:size_time
                   text = string(A.textdata(i+firstframe-1, 2));
                   if(text== 'MOVE' || text == 'CLICK_IN' || text == 'CLICK_OUT')
                        x(i) = round((A.data(i+firstframe-2, 1))/2);
                        y(i) = round(y_mx - (A.data(i+firstframe-2, 2)/2));                    
                   end     
                end
                
                for i=2:size_time-1
                        if(x(i) == 0 && y(i) == 0)
                        x(i) = x(i-1);
                        y(i) = y(i-1);  
                        end
                end             
end
            