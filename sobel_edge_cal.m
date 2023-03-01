function [edges,gradient_magnitude] = sobel_edge_cal(input_image, threshold,Sat_Scale_flag)
% INPUTS:
% input_image: the grayscale image histogram (0-255)
% threshold: value for threshollding magnitude image
%Sat_Scale_flag: handle type of conv

% OUTPUTS:
%edges:  Edge image
%gradient_magnitude: magnitude image 

% Convert the input image to grayscale

% Define the Sobel operator kernels
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Apply the Sobel operator kernels to the input image
Gx = conv_replicatepad(input_image,sobel_x,Sat_Scale_flag);
Gy = conv_replicatepad(input_image,sobel_y,Sat_Scale_flag);
% Compute the magnitude of the gradient
gradient_magnitude = sqrt(double(Gx).^2 + double(Gy).^2);
histogram(gradient_magnitude)
% Threshold the gradient magnitude to obtain the edges
edges = gradient_magnitude > threshold;
end