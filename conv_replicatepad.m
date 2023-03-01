function [img_conv_out,img_pad]=  conv_replicatepad(img,kernel,Sat_Scale_flag)

% This function takes an image and a kernel as inputs, and performs convolution
% using the "replicate" padding method.
% Sat_Scale_flag = TRUE for Saturated method and FALSE for Scaling method
% if there are negative values or overflow
[m, n] = size(img);
[k1, k2] = size(kernel);

 img_pad = padding_replicated(img,k1);


% Perform convolution by sliding the kernel over the padded image:
for i = 1:m
    for j = 1:n
        % Multiply the kernel with the corresponding section of the padded image,
        % and sum the resulting array to get the convolution value:
        img_conv(i,j) = sum(sum(kernel .* img_pad(i:i+k1-1, j:j+k2-1)));
    end
end

if (Sat_Scale_flag(1)) % Saturated
img_conv_out=uint8(img_conv);
elseif (Sat_Scale_flag(2)) %Scaling
    a=min(img_conv(:));
    b=max(img_conv(:));
img_conv_out= uint8(grayscale_transform(img_conv, a, b));
elseif (Sat_Scale_flag(3)) %Abs_Scaling
img_conv_out=uint8(abs(img_conv));
end
