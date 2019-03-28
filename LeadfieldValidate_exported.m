classdef LeadfieldValidate_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        LeadfieldValidationSystem  matlab.ui.Figure
        FileMenu                   matlab.ui.container.Menu
        OpenleadfieldMenu          matlab.ui.container.Menu
        OpenfolderMenu             matlab.ui.container.Menu
        SaveMenu                   matlab.ui.container.Menu
        ExitMenu                   matlab.ui.container.Menu
        ToolsMenu                  matlab.ui.container.Menu
        HelpMenu                   matlab.ui.container.Menu
        ListofLeadFieldPanel       matlab.ui.container.Panel
        UITable                    matlab.ui.control.Table
        AddButton                  matlab.ui.control.Button
        CheckBox                   matlab.ui.control.CheckBox
        DropDownLabel              matlab.ui.control.Label
        DropDown                   matlab.ui.control.DropDown
        Button1                    matlab.ui.control.Button
    end

    methods (Access = private)

        % Code that executes after component creation
        function startupFcn(app)
            app.AddButton.Visible = 'off';
            
           % pos = app.Button1.Position;
            app.Button1 = uibutton(app.LeadfieldValidationSystem, 'push');
            app.Button1.Position = [10 414 100 22];
            app.Button1.ButtonPushedFcn = {@mybuttondown,app};
        end

        % Callback function: ExitMenu, LeadfieldValidationSystem
        function LeadfieldValidationSystemCloseRequest(app, event)
            delete(app)
        end

        % Menu selected function: OpenleadfieldMenu
        function OpenleadfieldMenuSelected(app, event)
            
            app.AddButton.Visible = 'on';
            
            %             [archivo,ruta]=uigetfile('*.mat','Abrir un archivo de datos');
            %
            %             newRow = {false,archivo,ruta,'show'};
            %
            %             oldData = get(app.UITable,'Data');
            %             newData = [oldData; newRow];
            %             set(app.UITable,'Data',newData)
            
            
            
            %app.UITable = table(['ffdgf','dsffddf','fsdfdfsff']);
            
            %             dat_archivo=strcat(ruta,archivo);
            %             disp(dat_archivo);
            %             leadfield = importdata(dat_archivo, 't', 1);
            %             matrixRange = MatrixRange(leadfield);
            %             range = matrixRange.range;
            %             text_message = strcat('The matrix range is: ',sprintf('%.0f',range) );
            %             text_message = strcat(text_message,'. Operaction complete Succefuly!');
            %             uiwait(msgbox(text_message,'Success','modal'));
            
            
        end

        % Menu selected function: OpenfolderMenu
        function OpenfolderMenuSelected(app, event)
            % if the user did't select any file, then the script will search in the current folder all .mat files
            folder = uigetdir;
            
            ruta = strcat(folder,'\');
            
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
                    %leadfield = importdata(dat_archivo, 't', 1);
                    
                    newRow = {false,cn,ruta,'show'};
                    
                    oldData = get(app.UITable,'Data');
                    newData = [oldData; newRow];
                    set(app.UITable,'Data',newData)
                    
                    %%%%%    validate the leadfield   %%%%%%%%%%%
                    
                    %calculate the matrix range
                    
                    % matrixRange =  MatrixRange();
                    % range = matrixRange.CalculateRange();
                    %  disp(range);
                    %%%% aca iria el programa principal
                    %%%% fid = fopen(fullfile(path,cn));
                    %%%% etc
                end
                
            end
        end

        % Button pushed function: AddButton
        function AddButtonPushed(app, event)
            
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create LeadfieldValidationSystem
            app.LeadfieldValidationSystem = uifigure;
            app.LeadfieldValidationSystem.AutoResizeChildren = 'off';
            app.LeadfieldValidationSystem.Position = [100 100 702 444];
            app.LeadfieldValidationSystem.Name = 'LeadField Validation System';
            app.LeadfieldValidationSystem.Resize = 'off';
            app.LeadfieldValidationSystem.CloseRequestFcn = createCallbackFcn(app, @LeadfieldValidationSystemCloseRequest, true);

            % Create FileMenu
            app.FileMenu = uimenu(app.LeadfieldValidationSystem);
            app.FileMenu.Text = 'File';

            % Create OpenleadfieldMenu
            app.OpenleadfieldMenu = uimenu(app.FileMenu);
            app.OpenleadfieldMenu.MenuSelectedFcn = createCallbackFcn(app, @OpenleadfieldMenuSelected, true);
            app.OpenleadfieldMenu.Text = 'Open leadfield';

            % Create OpenfolderMenu
            app.OpenfolderMenu = uimenu(app.FileMenu);
            app.OpenfolderMenu.MenuSelectedFcn = createCallbackFcn(app, @OpenfolderMenuSelected, true);
            app.OpenfolderMenu.Text = 'Open folder';

            % Create SaveMenu
            app.SaveMenu = uimenu(app.FileMenu);
            app.SaveMenu.Text = 'Save';

            % Create ExitMenu
            app.ExitMenu = uimenu(app.FileMenu);
            app.ExitMenu.MenuSelectedFcn = createCallbackFcn(app, @LeadfieldValidationSystemCloseRequest, true);
            app.ExitMenu.Text = 'Exit';

            % Create ToolsMenu
            app.ToolsMenu = uimenu(app.LeadfieldValidationSystem);
            app.ToolsMenu.Text = 'Tools';

            % Create HelpMenu
            app.HelpMenu = uimenu(app.LeadfieldValidationSystem);
            app.HelpMenu.Text = 'Help';

            % Create ListofLeadFieldPanel
            app.ListofLeadFieldPanel = uipanel(app.LeadfieldValidationSystem);
            app.ListofLeadFieldPanel.AutoResizeChildren = 'off';
            app.ListofLeadFieldPanel.Title = 'List of Lead Field';
            app.ListofLeadFieldPanel.HandleVisibility = 'off';
            app.ListofLeadFieldPanel.Position = [32 60 640 326];

            % Create UITable
            app.UITable = uitable(app.ListofLeadFieldPanel);
            app.UITable.ColumnName = {''; 'Name'; 'Path'; 'Action'};
            app.UITable.ColumnWidth = {50, 'auto', 'auto', 50};
            app.UITable.ColumnEditable = [true false false false];
            app.UITable.Position = [8 62 620 236];

            % Create AddButton
            app.AddButton = uibutton(app.LeadfieldValidationSystem, 'push');
            app.AddButton.ButtonPushedFcn = createCallbackFcn(app, @AddButtonPushed, true);
            app.AddButton.Tooltip = {'Add Lead Field'};
            app.AddButton.Position = [158 404 215 22];
            app.AddButton.Text = 'Add';

            % Create CheckBox
            app.CheckBox = uicheckbox(app.LeadfieldValidationSystem);
            app.CheckBox.Position = [413 404 80 22];

            % Create DropDownLabel
            app.DropDownLabel = uilabel(app.LeadfieldValidationSystem);
            app.DropDownLabel.HorizontalAlignment = 'right';
            app.DropDownLabel.Position = [208 16 66 22];
            app.DropDownLabel.Text = 'Drop Down';

            % Create DropDown
            app.DropDown = uidropdown(app.LeadfieldValidationSystem);
            app.DropDown.Position = [289 16 100 22];

            % Create Button1
            app.Button1 = uibutton(app.LeadfieldValidationSystem, 'push');
            app.Button1.Position = [10 414 100 22];
            app.Button1.Text = 'Button1';
        end
    end

    methods (Access = public)

        % Construct app
        function app = LeadfieldValidate_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.LeadfieldValidationSystem)

            % Execute the startup function
            runStartupFcn(app, @startupFcn)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.LeadfieldValidationSystem)
        end
    end
end