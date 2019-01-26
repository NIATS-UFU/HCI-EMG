%As the name says, this function will return vectors for the click in, 
%click out time, as well the time when the target appears. And if there was
%a click_out or not (a boolean)

function [click_in, target_time, click_out, bool_clickout] = click_in_out_target_time(strctr_eegR, nb_volunteer, nb_session, nb_protocol, nb_repetition, y_mx, first_clickin)
    
size_vector = length (strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events);
click_in = zeros(5,3);
target_time = zeros(5,1);
cont_clickin = 5;
cont_target = 5;
cont_clickout = 0;
bool_clickout = false;
for i =1:size_vector %find all click_in time
    if(strcmp(strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).type, 'CLICK_IN') && cont_clickin>0)
       click_in(cont_clickin,1) = strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).pos_time - first_clickin;
       
       click_in(cont_clickin,2) = round((strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).x_pos)/2);
       click_in(cont_clickin,3) = round(y_mx - (strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).y_pos)/2); 
       cont_clickin = cont_clickin - 1;
    end
    if(string(strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).type) == 'CLICK_OUT')
    bool_clickout = true;
    cont_clickout = cont_clickout + 1;
    end
end

for i =1:size_vector %find all targets time
    a = char(strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).type);
    if(a(1:6) == 'TARGET')
       target_time(cont_target,1) = strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).pos_time;
       cont_target = cont_target - 1;
    end

end

if(bool_clickout)
    %cont = cont_clickout;
    click_out = zeros(cont_clickout, 3);
    for i =1:size_vector %find all click_in time
        
        if(strcmp(strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).type, 'CLICK_OUT'))
            click_out(cont_clickout,1) = strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).pos_time - first_clickin;
            click_out(cont_clickout,2) = round((strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).x_pos)/2);
            click_out(cont_clickout,3) = round(y_mx - (strctr_eegR.v(nb_volunteer).s(nb_session).prot(nb_protocol).rpt(nb_repetition).L_events(i).y_pos)/2); 
            cont_clickout = cont_clickout - 1;
        end
    end
else
    click_out = 0;
end
