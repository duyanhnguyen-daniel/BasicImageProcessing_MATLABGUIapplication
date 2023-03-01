function [img_filtered,img_pad] = median_filter(img, kernel_size)
% Apply median filtering to input image using a square kernel of size kernel_size

% Pad input image with replicated padding
img_pad = padding_replicated(img,kernel_size);
% Initialize filtered image to zeros
img_filtered = zeros(size(img));

% Loop over each pixel in the input image
for i = 1:size(img,1)
    for j = 1:size(img,2)
        % Extract the kernel centered at the current pixel
        kernel = img_pad(i:i+kernel_size-1, j:j+kernel_size-1);
        
        % Sort the elements of the kernel
        sorted_kernel = sort(kernel(:));
        
        % Take the median of the sorted kernel as the filtered value for the current pixel
        img_filtered(i,j) = sorted_kernel(floor(kernel_size*kernel_size/2)+1);
    end
end