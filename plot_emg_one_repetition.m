function plot_emg_one_repetition(strctr_emgR,strctr_eegR, nb_volunteer, nb_session, nb_protocol, nb_repetion, hAxes, first_time)
%Created by Carlos Magno. Modified by Lucas Lemos Franco
%This function plot the EMG signal(second graph). The black traces means
%the signal that the state machine interpreted as a command, whose size
%will determinate the actions on the interface
% Filter parameters
UcutoffFreq=20;
order=7;
s_rate=strctr_emgR.srate;
i_v=nb_volunteer;
ises=nb_session;
iprt=nb_protocol;
irpt=nb_repetion;
%figure;
    
    %ax(irpt)=subplot(5,1,irpt);
    % Copy the signal
    signal=strctr_emgR.v(i_v).s(ises).prot(iprt).rpt(irpt).sgn;
    %Create the time variable
    t=0:1/1000:(length(signal)-1)/1000;%time in seconds
    %putting the first click_in as the center of the graph
    for i=1: length(signal)
        
        t(i) = t(i) - double(first_time)/1000.0;
    end
    % Plot the RAW EMG
    plot(hAxes, t,signal,'y');
    hold on;
    
    % Filter the RAW EMG
    xf = HighPassFiltButter(signal,UcutoffFreq,order,1000);
    
    % Plot the filtered EMG
    plot(hAxes, t,xf,'b');
    hold on;
    %Plot the contraction signal detected by State Machine
    max_amp=max(xf)*0.7;
    
    hold on;
    plot(hAxes, t,strctr_emgR.v(i_v).s(ises).prot(iprt).rpt(irpt).sctrct_STM*max_amp,...
        'k','LineWidth',1.5);
   % a = strctr_emgR.v(i_v).s(ises).prot(iprt).rpt(irpt).sctrct_STM;
    %if(strctr_emgR.v(i_v).s(ises).prot(iprt).rpt(irpt).sctrct_STM*max_amp ==
    hold off;
    
    %plot(t,strctr_emgR.v(i_v).s(ises).prot(iprt).rpt(irpt))
    % Title
    text_title=[ 'Collecting: ' strctr_emgR.v(i_v).s(ises).prot(iprt).rpt(irpt).collect_inf ];
    title(text_title);
    %% plot contraction markers
    nb_borders=length(strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).abecpts);
    for eb=1:nb_borders
        %% contraction borders
%         b_border=strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).abecpts(eb).start/s_rate;
%         line(hAxes, [b_border,b_border] ,[max_amp, 0],'Color',[ 0 1.0 0],'LineStyle',':','LineWidth',2);
%         e_border=strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).abecpts(eb).end/s_rate;
%         line(hAxes, [e_border,e_border] ,[max_amp,0],'Color',[ 1.0 0 0],'LineStyle',':','LineWidth',2);
%         
        ctrType=strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).ctrct(eb).type;
        if(strcmp(ctrType,'ROTATION UP'))
            ctrType='RU';
        elseif (strcmp(ctrType,'ROTATION DOWN')) 
            ctrType='RD';
        elseif (strcmp(ctrType,'ROTATION LEFT')) 
            ctrType='RL';
        elseif (strcmp(ctrType,'ROTATION RIGHT')) 
            ctrType='RR';
        elseif(strcmp(ctrType,'MOVE UP'))
            ctrType='MU';
        elseif (strcmp(ctrType,'MOVE DOWN')) 
            ctrType='MD';
        elseif (strcmp(ctrType,'MOVE LEFT')) 
            ctrType='ML';
        elseif (strcmp(ctrType,'MOVE RIGHT')) 
            ctrType='MR';    
        elseif (strcmp(ctrType,'CLICK')) 
            ctrType='CK';
        elseif (strcmp(ctrType,'BREAK')) 
            ctrType='BK';
        end
        
        b_border=strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).becpts_STM(eb).start/s_rate - double(first_time)/s_rate;
        %e_border=strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).becpts_STM(eb).end/s_rate;
       % text(hAxes,b_border+dt_time_emg,max_amp*1.3,ctrType);
       %set(gcf,'CurrentAxes',handles.left_handle) 
        %set(gcf,'CurrentAxes',hAxes);
       text(hAxes, b_border,6000,ctrType, 'Clipping', 'on');
    end
    
%     nb_target=length(strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).pairsTargetClkIn);
%     if nb_target>=1
%         for itg=1:nb_target
%             xpos=double(strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).pairsTargetClkIn(itg).targetPos/s_rate);
%             line([xpos,xpos] ,[-max_amp,0],'Color',[ 1.0 0 1.0],'LineStyle',':','LineWidth',2);
%             tg_type=num2str(strctr_eegR.v(i_v).s(ises).prot(iprt).rpt(irpt).pairsTargetClkIn(itg).targetNb);
%             text(xpos,-max_amp*1.1,tg_type);
%         end
%     end
    


