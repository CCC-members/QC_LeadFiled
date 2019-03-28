classdef MatrixRange
    %MATRIXRANGE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        leadfield
        range
    end
    
    methods
        function obj = MatrixRange(leadfield)
            %MATRIXRANGE Construct an instance of this class
            %   Detailed explanation goes here
            obj.leadfield = leadfield;
            
            %%%% Lead Field with cell
            %%if()
            obj.range = rank(leadfield);
        end
        function range = CalculateRange(leadfield)
           range = rank(leadfield);
           
        end
        
    end
    methods(Static)
        
    end
end

