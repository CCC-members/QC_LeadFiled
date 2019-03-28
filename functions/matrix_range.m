function range = matrix_range(leadfield)
%RANGE Summary of this function goes here
%   Detailed explanation goes here

% leadfield = importdata(path, 't', 1);

%%%%%    validate the leadfield   %%%%%%%%%%%
%calculate the matrix range
matrixRange =  MatrixRange(leadfield);
range = matrixRange.range;


end

