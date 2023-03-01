function x_his= histogram_cal(img,gray_level)
% histogram calculates the histogram of a grayscale image 0 -255
% INPUTS:
% img: grayscale input image
% gray_level: number of gray levels in the image
% OUTPUTS:
% x_his: histogram of the input image
img = uint8(img);
[H,W]=size(img);
x_his=zeros(1,gray_level+1);
for I=1:W
for J=1:H
x_his (img(J,I)+1)=x_his(img(J,I)+1)+1;
end
end