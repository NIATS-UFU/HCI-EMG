%This function will return, for example, "21342" if the first Target is the
%Target2, the second the Target1, the third Target3, ...

function result = get_sequence_targets (textdata, size_vector, first_time_vector)
         result = char(5);
         cont_bt = 1;
             for i= 2 : (size_vector+first_time_vector-1) 
                        text = string(textdata(i, 2));
                        if(text~= 'MOVE' && text~='CLICK_IN' && text~='CLICK_OUT' && text~="")
                            a = char(text);
                            a = a(8);
                            result(cont_bt) = a;                                      
                            cont_bt = cont_bt+1;
                        end
            end %for

end

