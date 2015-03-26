% *************************
% Written by Dongwoo Son
%              on March 25
% *************************

X=imread('image1.jpg');

tol0 = 10e-325;
tol40 = 10;
tol85 = 181;
tol95 = 498;

[Y0,drop0] = compress(X,tol0);
[Y40,drop40] = compress(X,tol40);
[Y85,drop85] = compress(X,tol85);
[Y95,drop95] = compress(X,tol95);

figure(1)

subplot(2,2,1);
image(Y0);
title('tol = 10e-325; droprate = 0');
axis image
axis off

subplot(2,2,2);
image(Y40);
title('tol = 10; droprate = 40');
axis image
axis off

subplot(2,2,3);
image(Y85);
title('tol = 181; droprate = 85');
axis image
axis off

subplot(2,2,4);
image(Y95);
title('tol = 498; droprate = 95');
axis image
axis off