% THIS IS THE main function of this project

%With all the other functions and also with the corresponding folder
%Volunteer Number (e.g. V11/V11.mat) you will be able to see the running
%application correctly

%Here in GitHub will be located all the required functions of this project,
%and in all of them, just like in this one, will be a short exaplantion.
%Unfortunatelly, the DATA can not be shared.

%So, about this very function (DrawOut): this is the main function. You
%need to run this function and see if it works as expected.

%This function send and receive many data with other functions. Better
%exeplanation will be seen in those functions and in the internal
%subfunctions of this very one.

%DEFAULT FUNCTION - DO NOT EDIT
function varargout = DrawOut(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DrawOut_OpeningFcn, ...
                   'gui_OutputFcn',  @DrawOut_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

% Executes just before DrawOut is made visible.
function DrawOut_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
%definition of global structure with key variables
global guiVar;
guiVar.A = [];
guiVar.N = [];
guiVar.H = [];
guiVar.i_v = 11; %volunteer
guiVar.ises = 1; %section
guiVar.iprt = 1; %protocol
guiVar.irpt = 1; %repetition
guiVar.speed = 1;

% --- Outputs from this function are returned to the command line.
function varargout = DrawOut_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% BUTTON PLAY/PAUSE
function pushbutton1_Callback(hObject, eventdata, handles)
global guiVar;
guiVar.btValue = get(hObject,'Value');
%Changing button label
if(guiVar.btValue==1)
    set(hObject,'String','PAUSE');
else
    set(hObject,'String','PLAY');
end
sliderVal = round(get(handles.slider2,'Value'));
%Find last event - FORMER USED FUNCTION
% for i=2: sliderVal
%     text = string(guiVar.V.textdata(guiVar.A.firstframe+round(sliderVal-i), 2));
%     if(text) ~= 'MOVE'
%         set(handles.text5,'String', text);
%         break;
%     end
% end
%Plot the Targets
plotAll(guiVar.iprt);

%FORMER CLEANING THE SPACE FUNCTION - NOT NECESSARY ANYMORE
%Delete all green dots and find all click_in already passed and pait them
% if('PAUSE' == string(get(handles.pushbutton1,'String')))
%     delete (findobj(handles.axes1,'MarkerFaceColor',[0.2 0.8 0.0]));%deleting GREEN DOTS
%     delete (findobj(handles.axes1,'MarkerFaceColor',[0.9 0.0 0.0]));%deleting RED DOTS
%     refreshdata(handles.axes1);
%     
%     for i=1: round(sliderVal)
%         text = string(guiVar.V.textdata(guiVar.A.firstframe+i-1, 2));
%         if(text) == 'CLICK_IN'
%          plotTraceClicks(handles.axes1,guiVar.A.x(i),guiVar.A.y(i), [0.2 0.8 0.0]);  
%         
%         elseif(text == 'CLICK_OUT')
%          plotTraceClicks(handles.axes1,guiVar.A.x(i),guiVar.A.y(i), [0.9 0.0 0.0]);   
%         end
%     end
% end

% if(sliderVal ~= 1)
%     x_before = guiVar.A.x(sliderVal - 1);
%     y_before = guiVar.A.y(sliderVal - 1);
% else
%     x_before = guiVar.A.x(1);
%     y_before = guiVar.A.y(1);

flag_trace = true;
%THIS IS A POSTIVE AND NEGATIVE SOUNDS, WHEN THE VOLUNTEER CLICK IN OR OUT,
%ON THE TARGET
[y,Fs] = audioread('positive.mp3');
[z,Fz] = audioread('negative.mp3');

%FORMER FUNCTIONS, BEFORE THAT AN INTERPOLATION FUNCTION WAS IMPLEMENTED
% %Defining if is x or y constant at the begin
% 
% if(guiVar.A.x(4) == guiVar.A.x(3))
%     flag = true;
% end
% if(guiVar.A.y(4) == guiVar.A.y(3))
%     flag = false;
% end
%     
    
%     for i=round(sliderVal):guiVar.N
%         set(handles.axes2,'XLim',guiVar.EmgGraphAxisVector(i, :)); %changing axis x of emg graph
%         plot_vertical_line_red(handles.axes2,guiVar.EmgGraphAxisVector(i, 1)+5,[1 0.0 0.0])
%         if guiVar.btValue == 0
%            return;
%         end
%         text = string(guiVar.V.textdata(i+guiVar.A.firstframe-1, 2));
%                         
%         if(text) == 'MOVE'
%              if (handles.checkbox1.Value && flag_trace)
%                 plotTrace(handles.axes1,guiVar.A.x(round(i)),guiVar.A.y(round(i)), [0.0 0.0 0.8])
%             end
%         
%             
%             if(i>1)
% %                 %Identifing rotation frames
% %                 if(flag == true && guiVar.A.x(round(i))~= x_before) % && guiVar.A.y(round(i))== y_before)
% %                 %set(handles.text7, 'String', num2str(round(i)));
% %                 pause(0.1);
% %                 flag = false;
% %                 end
% %                 if(flag == false && guiVar.A.y(round(i))~= y_before) % && guiVar.A.y(round(i))~= y_before)
% %                 %set(handles.text7, 'String', num2str(round(i)));
% %                 flag = true;
% %                 pause(0.1);
% %                 end
%               
%                 %Identifying directions
%                 if(guiVar.A.x(round(i)) == x_before)
%                     if (guiVar.A.y(round(i)) > y_before) %up
%                         set(handles.text11, 'String', 'UP');
%                         direction = 'UP';
%                     else %down
%                         set(handles.text11, 'String', 'DOWN');
%                         direction = 'DOWN';
%                     end
%                 else 
%                     if (guiVar.A.x(round(i)) > x_before) %right
%                         set(handles.text11, 'String', 'RIGHT');
%                         direction = 'RIGHT';
%                     else %left
%                         set(handles.text11, 'String', 'LEFT');
%                         direction = 'LEFT';
%                     end
%                 end
%                 x_before = guiVar.A.x(round(i));
%                 y_before = guiVar.A.y(round(i));  
%             end
%             AnimatePointOnWave(handles.axes1,guiVar.A.x(round(i)),guiVar.A.y(round(i)), [1 0.0 0.0], direction);
%             flag_trace = ~flag_trace;
%         else
%         set(handles.text5, 'String', text);
%             if(text) == 'CLICK_IN'
%                 plotTraceClicks(handles.axes1,guiVar.A.x(i),guiVar.A.y(i), [0.2 0.8 0.0]);
% %ENABLE SOUNDs  sound(y,Fs);
%             elseif(text == 'CLICK_OUT')
%                 plotTraceClicks(handles.axes1,guiVar.A.x(i),guiVar.A.y(i), [0.9 0.0 0.0]);
%                 %sound(z,Fz);
%             end
%         end
%         set(handles.slider2,'Value',round(i));
%         set(handles.text2,'String',[num2str(guiVar.A.time(i)/1000.0) '/']);
%         
%         pause(0.5* (1.0/guiVar.speed));%delay
%     
%         if i==guiVar.N
%             set(hObject,'Value',0);
%             set(hObject,'String','PLAY');
%             set(handles.slider2,'Value',1);
%         end
%     end
% if(sliderVal ~= 1)
%     x_before = guiVar.newX(sliderVal - 1);
%     y_before = guiVar.newY(sliderVal - 1);
% else
%     x_before = guiVar.newX(1);
%     y_before = guiVar.newY(1);
%end

direction = '';
click_count = 1;
click_out_count = 1;
for i=sliderVal: length(guiVar.newX)
   if('PAUSE' == string(get(handles.pushbutton1,'String')))
        if(i>1)   
               if(guiVar.newX(i) == guiVar.newX(i-1))
                   %x_before = guiVar.newX(i);
                    if (guiVar.newY(i) > guiVar.newY(i-1)) %up
                        set(handles.text11, 'String', 'UP');
                        direction = 'UP';
                    %elseif(guiVar.newY(i) < y_before+5)
                    elseif(guiVar.newY(i) < guiVar.newY(i-1))
                        set(handles.text11, 'String', 'DOWN');
                        direction = 'DOWN';
                    end
               else %y still the same
                   % y_before = guiVar.newY(i);
                    if (guiVar.newX(i) > guiVar.newX(i-1)) %right
                        set(handles.text11, 'String', 'RIGHT');
                        direction = 'RIGHT';
                    elseif(guiVar.newX(i) < guiVar.newX(i-1))
                        set(handles.text11, 'String', 'LEFT');
                        direction = 'LEFT';
                    end
              end
%                 if(i>10)
%                 x_before = guiVar.newX(i-10);
%                 y_before = guiVar.newY(i-10);  
%                 end
        end
        %Printing click ins green dot
        if(click_count <5)
            if(guiVar.newTimeVector(i) > guiVar.clickin_time(click_count, 1))
                plotTraceClicks(handles.axes1,guiVar.clickin_time(click_count, 2),guiVar.clickin_time(click_count, 3), [0.2 0.8 0.0]);
                click_count = click_count + 1;
                text = 'CLICK_IN';
                set(handles.text5,'String', text);
            end
        end
        %Printing click outs red dot
        size_clickout = length(guiVar.clickout_time);
        if(guiVar.clickout_bool && click_out_count < size_clickout)
            if(guiVar.newTimeVector(i) > guiVar.clickout_time(click_out_count, 1) )
                if(guiVar.clickout_time(click_out_count, 1)>0)
                plotTraceClicks(handles.axes1,guiVar.clickout_time(click_out_count, 2),guiVar.clickout_time(click_out_count, 3), [0.9 0.0 0.0]);
               
                text = 'CLICK_OUT';
                set(handles.text5,'String', text);
                end
                click_out_count = click_out_count + 1;
            end
             
        end
        
    if(mod(i, 10) == 0)
        pause(0.0005*(1.0/guiVar.speed)); 
%         if(i==1000)
%             plotTraceClicks(handles.axes1,guiVar.newX(i),guiVar.newY(i), [0.9 0.0 0.0]);
%         end
        if (handles.checkbox1.Value && flag_trace)
           plotTrace(handles.axes1,guiVar.newX(i),guiVar.newY(i), [0.0 0.0 0.8]);
        end
        %UPTADE X-AXIS LIMITS - IT IS A CONSTANT GRAPH THAT HAS HIS AXIS
        %MOVED, IN ORDER TO SHOW AS "REAL-TIME" GRAPH
         set(handles.axes2,'XLim',guiVar.EmgGraphAxisVector(i, :));
         plot_vertical_line_red(handles.axes2,guiVar.EmgGraphAxisVector(i, 1)+5,[1 0.0 0.0]);
         flag_trace = ~flag_trace;
         %PUT THE CORRESPONDING MOUSE CURSOR ACCORDING TO THE TIME
         AnimatePointOnWave(handles.axes1,guiVar.newX(i),guiVar.newY(i), [1 0.0 0.0], direction);
         %UPDATE SLIDE BAR AND ITS COUNTER
         set(handles.slider2,'Value', i);
         set(handles.text2,'String',[num2str(guiVar.newTimeVector(i)/1000.0) '/']);
         
    end
    %FOR THE INTERPOLATION METHOD, PAUSE DOES NOT WORK VERY WEEL
   % pause(0.0005*(1.0/guiVar.speed));
   else
       break;
   end
   pause(0.0005*(1.0/guiVar.speed)); 
   %pause(0.0005);
end



% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
global guiVar;
%axes(handles.axes1);
i = get(hObject,'Value');
set(handles.text2,'String',[num2str(round(i)) '/']);

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
global guiVar;
i = get(hObject,'Value');
guiVar.speed = round(i);
set(handles.text9, 'String', num2str(round(i)));

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)

function popupmenuVol_Callback(hObject, eventdata, handles)
global guiVar;
contents = cellstr(get(hObject, 'String'));
guiVar.i_v = str2double(contents(get(hObject, 'Value'))); 

% --- Executes during object creation, after setting all properties.
function popupmenuVol_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenuSec.
function popupmenuSec_Callback(hObject, eventdata, handles)
global guiVar;
contents = cellstr(get(hObject, 'String'));
guiVar.ises = str2double(contents(get(hObject, 'Value'))); 


% --- Executes during object creation, after setting all properties.
function popupmenuSec_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenuPro.
function popupmenuPro_Callback(hObject, eventdata, handles)
global guiVar;
contents = cellstr(get(hObject, 'String'));
guiVar.iprt = str2double(contents(get(hObject, 'Value'))); 

% --- Executes during object creation, after setting all properties.
function popupmenuPro_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on selection change in popupmenuRep.
function popupmenuRep_Callback(hObject, eventdata, handles)
global guiVar;
contents = cellstr(get(hObject, 'String'));
guiVar.irpt = str2double(contents(get(hObject, 'Value'))); 

% --- Executes during object creation, after setting all properties.
function popupmenuRep_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)


% --- Executes on button press in togglebutton3.
function togglebutton3_Callback(hObject, eventdata, handles)

%LOAD button - button3
function pushbutton3_Callback(~, eventdata, handles)
%read input parameters
global guiVar;
guiVar.i_v = (get(handles.popupmenuVol, 'Value')); 
guiVar.ises = ((get(handles.popupmenuSec, 'Value'))); 
guiVar.iprt = ((get(handles.popupmenuPro, 'Value'))); 
guiVar.irpt = ((get(handles.popupmenuRep, 'Value'))); 
%Clear variables and other things
set(handles.pushbutton1, 'Enable', 'off');
set(handles.text2, 'String', '');
set(handles.text5, 'String', '');
set(handles.text15, 'String', '');
set(handles.text16, 'String', '');
set(handles.text11, 'String', '');
set(handles.slider2, 'Value', 1);
set(handles.pushbutton1,'String','PLAY');
%setting default values for axes
cla(handles.axes1,'reset');
cla(handles.axes2, 'reset');
set(handles.axes1, 'Visible', 'off');
set(handles.axes2, 'Visible', 'off');
axes(handles.axes1); %(re)creating axes
 %in case it is not the first time
set(handles.axes1,'Color',[.8 .8 .8]);
%In case of error, it will stop jut above the error
dbstop if error;
clc;

switch guiVar.iprt %according to the protocol
     case 1
            window_xmax = (636 + 84 + 2*323)/2;
            window_ymax = (636 + 84 + 2*24)/2;
            %size_target = 84/2;
     case 2
             window_xmax = (636 + 42 + 2*344)/2;
             window_ymax = (636 + 42 + 2*45)/2;
             %size_target = 42/2;
     case 3
             window_xmax = (636 + 21 + 2*355)/2;
             window_ymax = (636 + 21 + 2*56)/2;
             %size_target = 21/2;
end
 %loading data
 vnb_final = strcat('.\V', num2str(guiVar.i_v), '\V', num2str(guiVar.i_v), '.mat'); 
 Structure = load(vnb_final);
 [V, pathName] = loadFileTxt(Structure.emgR, guiVar.i_v, guiVar.ises, guiVar.iprt, guiVar.irpt);
 %Changing the "DrawOut" name - Figure Title
 set(handles.figure1, 'Name', pathName);
 guiVar.V = V;
 clear V;
 guiVar.A  = workData(guiVar.V, window_ymax);
 guiVar.N = length(guiVar.A.time);
 guiVar.sequence  = get_sequence_targets (guiVar.V.textdata, guiVar.N, guiVar.A.firstframe);
 set(handles.text15, 'String', guiVar.sequence);
 
 %Creating new time vector - 100Hz frequency - dt = 10ms
 [guiVar.FirstTimeEmg, guiVar.LastTimeEmg] = first_and_last_time_emg(Structure.eegR, guiVar.i_v, guiVar.ises, guiVar.iprt, guiVar.irpt);
 guiVar.newTimeVector = 0:10: (guiVar.LastTimeEmg-guiVar.FirstTimeEmg); %in frames, in milisec
 guiVar.newTimeVector = double(guiVar.newTimeVector);
 [guiVar.newX, guiVar.newY] = interpolate_axes(guiVar.A.time, guiVar.newTimeVector, guiVar.A.x, guiVar.A.y);
 
 %Click in and target time
 [guiVar.clickin_time, guiVar.target_time, guiVar.clickout_time, guiVar.clickout_bool] = click_in_out_target_time(Structure.eegR, guiVar.i_v, guiVar.ises, guiVar.iprt, guiVar.irpt,  window_ymax, guiVar.FirstTimeEmg);
 
 %dt_time = calculate_dt_time (guiVar.A.time); just for statistical
 %comparison

 %Plot Graph 2
  set(handles.axes2, 'XLimMode', 'Manual');
  
  guiVar.lastTimeSeconds = guiVar.LastTimeEmg/1000.0;
  guiVar.dt =  guiVar.LastTimeEmg - guiVar.A.time(guiVar.N); %Difference Time between last emg sinal and last mouse control
  %Get time vector for the axes of emg signal
  guiVar.EmgGraphAxisVector = emg_graphaxis_x(guiVar.newTimeVector);
  guiVar.sizeNewTimeVector = length(guiVar.newTimeVector);
 % set(handles.axes2,'XLim',guiVar.EmgGraphAxisVector(1, :));
  set(handles.axes2,'XLim', [-5 5]);
  set(handles.axes2, 'NextPlot', 'add'); %to plot just and not erase before plot
  plot_emg_one_repetition(Structure.emgR, Structure.eegR, guiVar.i_v, guiVar.ises, guiVar.iprt, guiVar.irpt, handles.axes2, guiVar.FirstTimeEmg);
 
  %Defining axes1 position, width and height
 position = [40 200 window_xmax window_ymax];
 setpixelposition(handles.axes1,position);
 set(handles.axes1, 'XLimMode', 'Manual');
 set(handles.axes1, 'YLimMode', 'Manual');
 set(handles.axes1,'XLim',[0 window_xmax]);
 set(handles.axes1,'YLim',[0 window_ymax]);
 hold(handles.axes1,'on');
 set(handles.axes1, 'XColor', 'w');
 set(handles.axes1, 'YColor', 'w');
 set(handles.axes1, 'ColorOrder', [0.0 0.0 0.0]);
 set(gcf, 'doublebuffer', 'on');


 %Slider2 and Slider3 definition
 set(handles.slider2, 'Max', guiVar.sizeNewTimeVector); % it will change, the number of points will be according to clickin - clickin
 set(handles.slider2, 'Min', 1);
 set(handles.text2, 'String', '');
 set(handles.slider3, 'Min', 1);
 set(handles.slider3, 'Max', 1000);
 
 set(handles.axes1, 'Visible', 'on');
 set(handles.axes2, 'Visible', 'on');
 set(handles.pushbutton1, 'Enable', 'on');
 set(handles.text16, 'String', num2str(guiVar.A.time(guiVar.N)/1000.0)); 

% --- Executes on button press in togglebutton4.
function togglebutton4_Callback(hObject, eventdata, handles)

function togglebutton5_Callback(hObject, eventdata, handles)

function togglebutton6_Callback(hObject, eventdata, handles)
