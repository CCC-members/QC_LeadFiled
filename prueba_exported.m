classdef prueba_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        SelectfrequenciesPanel          matlab.ui.container.Panel
        From0Hzto4HzdeltaCheckBox       matlab.ui.control.CheckBox
        From4Hzto7HzthetaCheckBox       matlab.ui.control.CheckBox
        From8Hzto12HzalphaCheckBox      matlab.ui.control.CheckBox
        OrwritethefrequencysrangeLabel  matlab.ui.control.Label
        RangeEditFieldLabel             matlab.ui.control.Label
        RangeEditField                  matlab.ui.control.EditField
        AgreeButton                     matlab.ui.control.Button
        CancelButton                    matlab.ui.control.Button
        From12Hzto31HzbethaCheckBox     matlab.ui.control.CheckBox
    end

    
    properties (Access = public)
        frequencies % Description
        Property2 % Description
        
        
        
    end
    
    methods (Access = private)
        
        function results = func(app)
            
        end
    end
    

    methods (Access = private)

        % Button pushed function: AgreeButton
        function AgreeButtonPushed(app, event)
           frequencies = [1 2 3 4];
            
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure
            app.UIFigure = uifigure;
            app.UIFigure.Position = [100 100 302 322];
            app.UIFigure.Name = 'UI Figure';

            % Create SelectfrequenciesPanel
            app.SelectfrequenciesPanel = uipanel(app.UIFigure);
            app.SelectfrequenciesPanel.Title = 'Select frequencies';
            app.SelectfrequenciesPanel.Position = [29 57 241 245];

            % Create From0Hzto4HzdeltaCheckBox
            app.From0Hzto4HzdeltaCheckBox = uicheckbox(app.SelectfrequenciesPanel);
            app.From0Hzto4HzdeltaCheckBox.Text = 'From 0 Hz to 4 Hz (delta)';
            app.From0Hzto4HzdeltaCheckBox.Position = [26 188 157 22];

            % Create From4Hzto7HzthetaCheckBox
            app.From4Hzto7HzthetaCheckBox = uicheckbox(app.SelectfrequenciesPanel);
            app.From4Hzto7HzthetaCheckBox.Text = 'From 4 Hz to 7 Hz (theta)';
            app.From4Hzto7HzthetaCheckBox.Position = [26 155 157 22];

            % Create From8Hzto12HzalphaCheckBox
            app.From8Hzto12HzalphaCheckBox = uicheckbox(app.SelectfrequenciesPanel);
            app.From8Hzto12HzalphaCheckBox.Text = 'From 8 Hz to 12 Hz (alpha)';
            app.From8Hzto12HzalphaCheckBox.Position = [26 118 167 22];

            % Create From12Hzto31HzbethaCheckBox
            app.From12Hzto31HzbethaCheckBox = uicheckbox(app.SelectfrequenciesPanel);
            app.From12Hzto31HzbethaCheckBox.Text = 'From 12 Hz to 31 Hz (betha)';
            app.From12Hzto31HzbethaCheckBox.Position = [26 84 174 22];

            % Create OrwritethefrequencysrangeLabel
            app.OrwritethefrequencysrangeLabel = uilabel(app.SelectfrequenciesPanel);
            app.OrwritethefrequencysrangeLabel.Position = [52 48 166 22];
            app.OrwritethefrequencysrangeLabel.Text = 'Or write the frequency''s range';

            % Create RangeEditFieldLabel
            app.RangeEditFieldLabel = uilabel(app.SelectfrequenciesPanel);
            app.RangeEditFieldLabel.HorizontalAlignment = 'right';
            app.RangeEditFieldLabel.Position = [27 17 41 22];
            app.RangeEditFieldLabel.Text = 'Range';

            % Create RangeEditField
            app.RangeEditField = uieditfield(app.SelectfrequenciesPanel, 'text');
            app.RangeEditField.Position = [83 17 100 22];

            % Create AgreeButton
            app.AgreeButton = uibutton(app.UIFigure, 'push');
            app.AgreeButton.ButtonPushedFcn = createCallbackFcn(app, @AgreeButtonPushed, true);
            app.AgreeButton.Position = [39 18 100 22];
            app.AgreeButton.Text = 'Agree';

            % Create CancelButton
            app.CancelButton = uibutton(app.UIFigure, 'push');
            app.CancelButton.Position = [159 18 100 22];
            app.CancelButton.Text = 'Cancel';
        end
    end

    methods (Access = public)

        % Construct app
        function app = prueba_exported

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end