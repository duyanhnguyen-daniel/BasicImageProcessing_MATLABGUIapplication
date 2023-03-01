function transformed_image = grayscale_transform(image, a, b)
% grayscale_transform applies a linear grayscale transformation to a given input grayscale image 
% with the specified output range from a to b.
%
% INPUTS:
%   image: input grayscale image
%   a: lower bound of the output range (0 to 255)
%   b: upper bound of the output range (0 to 255)
%
% OUTPUT:
%   transformed_image: grayscale image after applying the transformation, with pixel values scaled to the range [a, b]

A=0;
B=255;
% Scale pixel values to the range [a, b]
transformed_image = (image - a) * (B - A) / (b-a) + A;

end