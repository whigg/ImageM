classdef ImageMathematicAction < imagem.gui.actions.ScalarImageAction
% Open a dialog to apply mathematical operation on two images.
%
%   Class ImageMathematicAction
%
%   Example
%   ImageMathematicAction
%
%   See also
%

% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2012-11-04,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.


%% Properties
properties
    Handles;
    
    OpList = {@plus, @minus, @times, @rdivide, @power, @min, @max};
    OpNames = {'Plus', 'Minus', 'Times', 'Divides', 'power', 'min', 'max'};
    
end % end properties


%% Constructor
methods
    function obj = ImageMathematicAction(viewer)
    % Constructor for ImageMathematicAction class
        obj = obj@imagem.gui.actions.ScalarImageAction(viewer, 'imageMathematic');
    end

end % end constructors

methods
    function actionPerformed(obj, src, event) %#ok<INUSD>
        disp('image mathematic');
        
        createFigure(obj);
    end
    
    function hf = createFigure(obj)
        
        % action figure
        hf = figure(...
            'Name', 'Image Mathematic', ...
            'NumberTitle', 'off', ...
            'MenuBar', 'none', 'Toolbar', 'none');
        set(hf, 'units', 'pixels');
        pos = get(hf, 'Position');
        pos(3:4) = 200;
        set(hf, 'Position', pos);
        
        obj.Handles.Figure = hf;
        
        % vertical layout
        vb  = uiextras.VBox('Parent', hf, ...
            'Spacing', 5, 'Padding', 5);
        
        gui = obj.Viewer.Gui;
        
        % one panel for value text input
        mainPanel = uix.VBox('Parent', vb);

        % combo box for the operation name
        obj.Handles.OperationList = addComboBoxLine(gui, mainPanel, ...
            'Operation:', obj.OpNames);
        
        % combo box for the second image
        obj.Handles.OperandInput = addInputTextLine(gui, mainPanel, ...
            'Value', '10');
        
        % button for control panel
        buttonsPanel = uix.HButtonBox( 'Parent', vb, 'Padding', 5);
        uicontrol( 'Parent', buttonsPanel, ...
            'String', 'OK', ...
            'Callback', @obj.onButtonOK);
        uicontrol( 'Parent', buttonsPanel, ...
            'String', 'Cancel', ...
            'Callback', @obj.onButtonCancel);
        
        set(vb, 'Heights', [-1 40] );
    end
    

    function closeFigure(obj)
        % clean up viewer figure
        
        % close the current fig
        close(obj.Handles.Figure);
    end
    
end

%% GUI Items Callback
methods
    function onButtonOK(obj, varargin)        
        
        % get handle to current doc
        doc = currentDoc(obj);
        
        % get operation as function handle
        opIndex = get(obj.Handles.OperationList, 'Value');
        op = obj.OpList{opIndex};
        opName = char(op);
        
        strValue = get(obj.Handles.OperandInput, 'String');
        value = str2double(strValue);
        if isnan(value)
            error(['Could not parse input value: ' strValue]);
        end
        
        % compute result image
        res = op(doc.Image, value);
        
        % add image to application, and create new display
        newDoc = addImageDocument(obj, res);
        
        % add history
        string = sprintf('%s = %s(%s, %s));\n', ...
            newDoc.Tag, opName, doc.Tag, strValue);
        addToHistory(obj, string);

        closeFigure(obj);
    end
    
    function onButtonCancel(obj, varargin)
        closeFigure(obj);
    end
    
end

end % end classdef

