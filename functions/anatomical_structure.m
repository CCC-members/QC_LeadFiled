function result = anatomical_structure(anatomical_path)
%ANATOMICAL_STRUCTURE Summary of this function goes here
%   Detailed explanation goes here
result = [];
file =  importdata(anatomical_path, 't', 1);
count = 1;
result{count} = true;
if (~isstruct(file))
    result{count} = 'The anatomical file is not a struct type';
    count = count + 1;
else
    if ( ~isfield( file,'Vertices'))
        result{count} = 'The anatomical file no contain the Vertices data';
        count = count +1;
    end
    if (~isfield( file,'Atlas'))
        result{count} = 'The anatomical file no contain the Atlas data';
        count = count +1;
    end
    if (~isfield( file,'Faces'))
        result{count} = 'The anatomical file no contain the Atlas data';
        count = count +1;
    end
end

