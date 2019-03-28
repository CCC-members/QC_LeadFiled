function text_cell = cell_error_format(cell_text)
%CELL_ERROR_FORMAT Summary of this function goes here
%   Detailed explanation goes here
%# use HTML to style these cells
text_cell = strcat(...
    '<html><span style="color: #FF0000; font-weight: bold;">', ...
   cell_text, ...
    '</span></html>');
end

