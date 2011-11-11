classdef OpenDemoImageAction < imagem.gui.ImagemAction
%OPENDEMOIMAGEACTION Open and display one of the demo images
%
%   Class OpenDemoImageAction
%
%   Example
%   OpenDemoImageAction
%
%   See also
%
%
% ------
% Author: David Legland
% e-mail: david.legland@grignon.inra.fr
% Created: 2011-11-07,    using Matlab 7.9.0.529 (R2009b)
% Copyright 2011 INRA - Cepia Software Platform.


%% Properties
properties
    imageName;
end % end properties


%% Constructor
methods
    function this = OpenDemoImageAction(parent, name, imageName)
    % Constructor for OpenDemoImageAction class
        
        % calls the parent constructor
        this = this@imagem.gui.ImagemAction(parent, name);
        
        % initialize image name
        this.imageName = imageName;
    end

end % end constructors


%% Methods
methods
    function actionPerformed(this, src, event) %#ok<INUSD>
        disp(['Open demo Image: ' this.imageName]);
        
        % get handle to parent figure, and current doc
        viewer = this.parent;
        gui = viewer.gui;
        
        % read the demo image
        img = Image.read(this.imageName);
        
        % add image to application, and create new display
        addImageDocument(gui, img);
    end
end % end methods

end % end classdef
