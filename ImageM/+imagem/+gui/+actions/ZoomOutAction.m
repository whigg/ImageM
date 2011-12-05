classdef ZoomOutAction < imagem.gui.ImagemAction
%ZOOMINACTION Zoom out the current figure
%
%   output = ZoomOutAction(input)
%
%   Example
%   ZoomOutAction
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2011-12-02,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.

methods
    function this = ZoomOutAction(parent)
        % calls the parent constructor
        this = this@imagem.gui.ImagemAction(parent, 'zoomOut');
    end
end

methods
    function actionPerformed(this, src, event) %#ok<INUSD>
        
        % get handle to parent figure
        viewer = this.parent;
        
        % set up new zoom value
        zoom = getZoom(viewer);
        setZoom(viewer, zoom / 2);
        
        % update display
        updateTitle(viewer);
    end
end

end