X=imread('16by16.jpg')

RC = X(:,:,1);
RCfc = fft2(single(RC));
RCfcinv = uint8(ifft2(RCfc));
%isequal(RC,RCfcinv)

GC = X(:,:,2);
GCfc = fft2(single(GC));
GCfcinv = uint8(ifft2(GCfc));
%isequal(GC,GCfcinv)

BC = X(:,:,3);
BCfc = fft2(single(BC));
BCfcinv = uint8(ifft2(BCfc));
%isequal(BC,BCfcinv)

Im = cat(3,RC,BC,GC);
Im2 = cat(3,RCfcinv,BCfcinv,GCfcinv);

figure(1)
image(RC);
axis image
axis off

figure(2)
image(BC);
axis image
axis off

figure(3)
image(GC);
axis image
axis off

figure(4)
image(Im);
axis image
axis off

figure(5)
image(RCfcinv);
axis image
axis off

figure(6)
image(BCfcinv);
axis image
axis off

figure(7)
image(GCfcinv);
axis image
axis off

figure(8)
image(Im2);
axis image
axis off
