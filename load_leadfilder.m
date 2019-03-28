
% Script to load the leadfield

% first time for only one leadfield


str ={'select file','select folder'};
s = listdlg('PromptString','Select a file:','SelectionMode','single','ListString',str);
if s==1
    % if the user selected a file .mat then the script will load this file
    [archivo,ruta]=uigetfile('*.mat','Abrir un archivo de datos');
    dat_archivo=strcat(ruta,archivo);
    disp(dat_archivo);
    leadfield = importdata(dat_archivo, 't', 1);
    matrixRange =  MatrixRange(leadfield);
    range = matrixRange.range;
    uiwait(msgbox('Operation Completed','Success','modal'));
    disp(range);
else
    % if the user did't select any file, then the script will search in the current folder all .mat files
    folder = uigetdir;
    
    ruta = strcat(folder,'\');
    count_leadfield = 1;
    ext='.mat'; % extension, si no se desea filtrar por extension poner ext=''
    ar=ls(folder);
    
    for j=1:size(ar,1)
        cn=ar(j,:);
        [~,~,ex]=fileparts(cn);
        
        %isdir(cn)
        if (and(~isfolder(fullfile(path,cn)),or(strcmpi(strtrim(ex),ext),isempty(ext))))
            
            %disp(fullfile(path,cn))
            
            dat_archivo = strcat(ruta,cn);
            disp(dat_archivo);
            leadfield = importdata(dat_archivo, 't', 1);
            
            %%%%%    validate the leadfield   %%%%%%%%%%%
            
            %calculate the matrix range
            
            matrixRange =  MatrixRange();
            range = matrixRange.CalculateRange();
            disp(range);
            %%%% aca iria el programa principal
            %%%% fid = fopen(fullfile(path,cn));
            %%%% etc
            
        end
        
    end
    
end
