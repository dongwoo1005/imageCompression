function [Y, drop] = compress(X, tol)
% Usage: [Y, drop] = compress(X, tol)
% Compute a compressed image 'Y' from an
% original input image 'X' by dropping
% Fourier modes with modulus smaller
% than tolerance parameter 'tol'. The
% drop ratio is also returned via the
% parameter 'drop'.
% **********************************
% Written by Dongwoo Son
%                       on March 25
% **********************************

s=size(X);

offset1 = mod(8-mod(s(1),8),8);
offset2 = mod(8-mod(s(2),8),8);
if offset1 ~= 0 || offset2 ~= 0
  X(s(1)+offset1, s(2)+offset2, 3) = 0;
end

s=size(X);
a=s(1);
b=s(2);
numPixel = a * b * 3;
numDropped = 0;
cols1 = []; cols2 = []; cols3 = [];
rows1 = []; rows2 = []; rows3 = [];
for i=1:8:a-7
    for j=1:8:b-7
        subblock1 = X((i:i+7),(j:j+7),1);
        subblock2 = X((i:i+7),(j:j+7),2);
        subblock3 = X((i:i+7),(j:j+7),3);
        fc1 = fft2(single(subblock1));
        fc2 = fft2(single(subblock2));
        fc3 = fft2(single(subblock3));
        for r=1:8
            for c=1:8
                if abs(fc1(r,c)) < tol
                    fc1(r,c)=0;
                    numDropped = numDropped +1;
                end
                if abs(fc2(r,c)) < tol
                    fc2(r,c)=0;
                    numDropped = numDropped + 1;
                end
                if abs(fc3(r,c)) < tol
                    fc3(r,c)=0;
                    numDropped = numDropped + 1;
                end
            end
        end
        ifc1 = ifft2(fc1);
        ifc2 = ifft2(fc2);
        ifc3 = ifft2(fc3);
        cols1 = [cols1 ifc1];
        cols2 = [cols2 ifc2];
        cols3 = [cols3 ifc3];
    end
    rows1 = [rows1 ; cols1];
    rows2 = [rows2 ; cols2];
    rows3 = [rows3 ; cols3];
    cols1 = []; cols2 = []; cols3 = [];
end
Y = rows1;
Y(:,:,2) = rows2;
Y(:,:,3) = rows3;
Y = uint8(Y);
drop = numDropped / numPixel;
            