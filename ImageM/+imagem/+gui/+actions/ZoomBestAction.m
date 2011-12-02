classdef ZoomBestAction < imagem.gui.ImagemAction
%ZOOMBESTACTION Set zoom of current image viewer to the best possible one
%
%   output = ZoomBestAction(input)
%
%   Example
%   ZoomBestAction
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
    function this = ZoomBestAction(parent)
        % calls the parent constructor
        this = this@imagem.gui.ImagemAction(parent, 'zoomBest');
    end
end

methods
    function actionPerformed(this, src, event) %#ok<INUSD>
        
        % get handle to parent figure
        viewer = this.parent;
        
        % set up new zoom value
        zoom = findBestZoom(viewer);
        setZoom(viewer, zoom);
        
        % update display
        updateTitle(viewer);
    end
end

end