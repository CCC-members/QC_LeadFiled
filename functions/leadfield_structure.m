function result = leadfield_structure(leadfield_path)
%LEADFIELD_STRUCTURE Summary of this function goes here
%   Detailed explanation goes here
result = string([]);
file =  importdata(leadfield_path, 't', 1);
%initialization of result
count = 1;

if (iscell(file))
    leadfield = file{1,1};
    result(count) = 'The lead field file is a Cell';
    count = count + 1;
elseif(ismatrix(file) && ~isstruct(file))
    leadfield = file;
    result(count) = 'The lead field file is a Matrix';
    count = count + 1;
else
    result(count) = 'The leadfield file not is a correct type';
    count = count + 1;
    result(count) = 'Failed';
    count = count + 1;
    disp('The leadfield file not is a correct type');
end

if(result(count-1)~="Failed")
    
    %go to check the range
    range_checked = 1;
    leadfield_range = matrix_range(leadfield);
    if(leadfield_range ~= size( leadfield , 1 ) )
        result(count) =strcat( 'The lead field''s range (',leadfield_range ,...
            ') does not match with the number of sensors (', size( leadfield , 1 ),' )');
        count = count + 1;
        
        answer = questdlg( 'The LeadField range is wrong. This can be caused by the reference channel. Do you want to suppress the error automatically? Press -Yes- For automaticaly process, -No- For manual Process or -Cancel- To stop the validation', ...
            'Lead Field''s range. ',...
            'Yes','No','Cancel');
        % Handle response
        switch answer
            case 'Yes'
                %remove the reference channel, the last singular value of the leadfield
                [U,S,V] = svd(leadfield);
                
                result(count) ='The system has eliminated the reference channel.';
                count = count + 1;
            case 'No'
                fig_selesct_channel = figure;
                h = spinner('Parent',fig_selesct_channel,...
                    'Position',[100 100 60 40],...
                    'Min',1,...
                    'Max',size( leadfield , 1 ),...
                    'StartValue',1,...
                    'Step',1);
            case 'Cancel'
                result(count) ='The user has canceled the validation.';
                count = count + 1;
                result(count) ='Failed';
                count = count + 1;
        end
        
    else
        
        nro_cond =  cond( leadfield);
        
        disp(nro_cond_est);
        disp(nro_cond);
    end
end
end

