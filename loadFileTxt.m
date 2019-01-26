%This function returns the .txt file that is found using the volunteer
%number, section number... choseb by te user. The FileName uses the ".log",
%that is part of the structure created. After that, we use the importdata
%function. Besides, in order to protect the volunteers identity, we send
%the string with the file name, without the volunteer`s name
function [results, path_noPersonalName] = loadFileTxt(emgR, i_v, ises, iprt, irpt)
           FileName = emgR.v(i_v).s(ises).prot(iprt).rpt(irpt).file_name.log;
           %File entire address - no need to 'add to path' anymore
           Path_File = strcat('.\V', num2str(i_v), '\S', num2str(ises), '\', FileName);
           %Importing everything to the results
           auxiliar = strsplit(FileName, '_');
           path_noPersonalName = char(strcat('.\V', num2str(i_v), '\S', num2str(ises), '\..._', auxiliar(2), '_', auxiliar(3), '_', auxiliar(4)));
           results = importdata(Path_File);            
end