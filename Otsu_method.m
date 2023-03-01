function [wgz,wgz_min,thresh] = Otsu_method(x_his)
% Otsu_method applies Otsu's thresholding method to a grayscale image histogram
% to determine the optimal threshold value that separates the image into
% foreground and background regions.
% INPUTS:
% x_his: the grayscale image histogram
% OUTPUTS:
% wgz: an array of weighted variances for each possible threshold value
% wgz_min: the minimum value in the wgz array
% thresh: the optimal threshold value

n=sum(x_his);
L=length(x_his);
wgz=zeros(L,1);
wgz_min= 100000000;
thresh=128;

% Loop over each possible threshold value
for T=1:256
    BX2=0;
    BX=0;
    BN=0;
    WX2=0;
    WX=0;
    WN=0;

    % Calculate the mean, variance, and probability of each pixel value group
    % with respect to the threshold value T
    for I=1:253
        p=x_his(I);
        if I<=T
            BX=BX+p*(I-1);
            BX2=BX2+p*(I-1)^2;
            BN=BN+p;
        else
            WX=WX+p*(I-1);
            WX2=WX2+p*(I-1)^2;
            WN=WN+p;
        end
    end

    % Calculate the weighted variance and store the minimum value and optimal
    % threshold value
    if (BN>1) && (WN>1)
        mean1= BX/BN;
        var1= BX2/BN - mean1^2 ;
        prob1=BN/n;

        mean2= WX/WN;
        var2= WX2/WN -mean2^2;
        prob2=WN/n;
        wgz(T)=prob1*var1+prob2*var2;
        if wgz(T)<=wgz_min
            wgz_min=wgz(T);
            thresh=T;
        end
    end
end
end