%This function will return the time, in ms. The first click in and last
%click in can be accessed at the ".L_vents" in the structure. 

function [first, last] = first_and_last_time_emg(strctr_eegR, nb_volunteer, nb_session, nb_protocol, nb_repetition)
    first = 0;
size_vector = length (strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events);

for i =1:size_vector %find the last click_in (which is at the top)
    if(strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).type == 'CLICK_IN')
        last = strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).pos_time;
        break;
    end

end
cont = 0;
for i =1:size_vector %find the first click_in (which is the last on the matrix). 
    %It is necessary to take into account that it is not impossibel
    %to have more thant 5 click_in`s. So, starting from the last one, we
    %will take the first 5 ones.
    
    if(string(strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).type) == 'CLICK_IN' && cont<5)
        cont = cont+1;
        first = strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).pos_time;
    end

end