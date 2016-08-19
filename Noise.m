% Noise uses a given size, and smoothing factor, and produces randomly
% generated terrain, storing it in a 2D array called "noise". The noise
% array acts as a heightmap.
% 
% Inputs:   terrainSize = the size of the 2D heightmap array
%           smoothingFactor = howidthmany times the terrain will be smoothed
% 
% Outputs:  noise = a 2D array of the height values at each point of the
%                   terrain.

function heightMap = Noise (terrainSize, smoothingFactor)
    % Fills the 2D array with zeroes. Saves a bit of processing time.
    heightMap = zeros(terrainSize);                                  
    width = terrainSize;                                                                            
  
    while width > 2
        smoothingFactor = smoothingFactor + 1;
        
        % These 2 lines do the grunt of the whole terrain generation.
        % randn(width) fills the noise array with random values.
        % we then use cubic spline interpolation to interpolate between
        % these values.
        smoothedValue = interp2(randn(width), smoothingFactor - 1, 'spline');
        
        % This is where combine our smoothed layer with our previously
        % smoothed layer.
        heightMap = heightMap + smoothingFactor * smoothedValue(1 : terrainSize, 1 : terrainSize);
        
        % Keep smoothing the noise out until width is less than 2
        width = width - floor(width / 2);
    end
end
