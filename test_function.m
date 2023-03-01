clear all
% Read input image
img_input = im2double(imread('Parts.bmp'));
kernel = [1,1,1;1,1,1;1,1,1]/9;
%[img_output,img_pad]=  conv_replicatepad(img_input,kernel,1);   %Test Convolution
img_output = sobel_edge_cal(img_input*255, 128,[0 0 1]);
 img_output_matlab = edge(img_input*255, 'sobel'); 
% Display input image and convolved image
figure;
subplot(1,3,1);
imshow(img_input, 'InitialMagnification', 'fit');
title('Input Image');
subplot(1,3,2);
imshow(img_output,  'InitialMagnification', 'fit');
title('Output Image');
subplot(1,3,3);
imshow(img_output_matlab,  'InitialMagnification', 'fit');
title('Output Image from Matlab');


