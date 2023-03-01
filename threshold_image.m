function outputImage = threshold_image(inputImage, T, gray_level)
% THRESHOLD_IMAGE applies thresholding to an input grayscale image using the specified threshold value T.
%
% INPUTS:
%   inputImage: input grayscale image to be thresholded
%   T: threshold value
%   gray_level: maximum gray level value
%
% OUTPUTS:
%   outputImage: thresholded image, where pixels above the threshold value are set to gray_level and pixels below are set to 0.
%
% USAGE:
%   outputImage = threshold_image(inputImage, T, gray_level)

% Scale the input image values to the range [0, gray_level]
inputImage = inputImage * gray_level;

% Initialize the output image to be the same size as the input image
outputImage = zeros(size(inputImage));

% Loop over each pixel in the input image
for row = 1:size(inputImage, 1)
    for col = 1:size(inputImage, 2)
        % Check if the pixel value is above the threshold
        if inputImage(row, col) > T
            % Set the output pixel to the maximum value (white)
            outputImage(row, col) = gray_level;
        else
            % Set the output pixel to the minimum value (black)
            outputImage(row, col) = 0;
        end
    end
end