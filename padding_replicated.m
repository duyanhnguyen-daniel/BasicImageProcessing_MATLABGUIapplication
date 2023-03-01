function img_pad = padding_replicated(img, kernel_size)
% PADDING_REPLICATED pads the input image with the 'replicated' method
% to avoid edge artifacts when convolving with a kernel.
%INPUTS
% img: input image to be padded
% kernel_size: size of the kernel used for convolution
% OUTPUTS:
% img_pad: padded image

[m, n] = size(img);
% Calculate the amount of padding required for each dimension of the image:
pad_size = floor((kernel_size - 1) / 2);
% Create a new array with dimensions that include the padding:
img_pad = zeros(m + pad_size*2, n + pad_size*2);
% Copy the original image into the padded image, leaving the padding elements as 0:
img_pad(pad_size+1:end-pad_size, pad_size+1:end-pad_size) = img;
% Pad the top row, bottom row, left column, right column with replicate:
img_pad(1:pad_size, pad_size+1:end-pad_size) = repmat(img(1,:), pad_size, 1);
img_pad(end-pad_size+1:end, pad_size+1:end-pad_size) = repmat(img(end,:), pad_size, 1);
img_pad(:, 1:pad_size) = repmat(img_pad(:, pad_size+1), 1, pad_size);
img_pad(:, end-pad_size+1:end) = repmat(img_pad(:, end-pad_size), 1, pad_size);
end