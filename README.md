imageCompression
=================

Screenshot:
-----------------
![alt text](http://dongwoo1005.github.io/image/imageCompression.PNG "FloodIt")

Description:
-----------------
It takes an input of the original image, *X*, and the drop tolerance parameter, *tol*, and produces a compressed image *Y*.<br>
<br>
Specifically, it follows these steps:
- Compute the 2D Fourier coefficients for every 8 X 8 subblock for each colour.
- For each subblock, set those Fourier coefficients having modulus less than tol to 0.
- Record the number of coefficients dropped.
- Reconstruct the compressed 8 X8 image array by using the inverse 2D Fourier trans-
form.
- After all the 8 X 8 subblocks for all the colour components have been processed, return
the entire compressed image as Y and the drop ratio as drop.