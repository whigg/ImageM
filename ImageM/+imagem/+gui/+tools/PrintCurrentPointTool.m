classdef PrintCurrentPointTool < imagem.gui.ImagemTool
% Print position of current point.
%
%   output = PrintCurrentPointTool(input)
%
%   Example
%   PrintCurrentPointTool
%
%   See also
%

% ------
% Author: David Legland
% e-mail: david.legland@inra.fr
% Created: 2011-11-13,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.


%% Constructor
methods
    function obj = PrintCurrentPointTool(viewer, varargin)
        % Creates a new tool using parent gui and a name
         obj = obj@imagem.gui.ImagemTool(viewer, 'printCurrentPoint');
    end % constructor 

end % construction function

%% General methods
methods
    function select(obj) %#ok<*MANU>
    end
    
    function deselect(obj)
    end
    
    function onMouseButtonPressed(obj, hObject, eventdata) %#ok<INUSD>
        pos = get(obj.Viewer.Handles.ImageAxis, 'CurrentPoint');
        fprintf('%f %f\n', pos(1, 1:2));
    end
    
    function onMouseButtonReleased(obj, hObject, eventdata) %#ok<INUSD>
    end
    
    function onMouseMoved(obj, hObject, eventdata) %#ok<INUSD>
    end
    
end % general methods

end