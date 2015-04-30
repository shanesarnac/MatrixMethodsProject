%% Reducer.m: The Quantization Matrix, Discrete Cosine Transform, and Inverse Discrete Cosine Transform
% Author: Shane Sarnac and Antoine Steiblen

function [color,z1,z2,z3] = Reducer(color)

 % Normalization matrix (8 X 8) used to Normalize the DCT Matrix (Luminance
 % specific)
y_q50=[16 11 10 16 24 40 51 61      
          12 12 14 19 26 58 60 55
          14 13 16 24 40 57 69 56
          14 17 22 29 51 87 80 62
          18 22 37 56 68 109 103 77
          24 35 55 64 81 104 113 92
          49 64 78 87 103 121 120 101
          72 92 95 98 112 100 103 99];

% Quantization matrix for quality level 90 (luminance)
% y_q90 = [3 2 2 3 5 8 10 12
%         2 2 4 5 6 12 12 11
%         3 3 3 5 8 11 14 11
%         3 3 4 6 10 17 16 12
%         4 4 7 11 14 22 21 15
%         5 7 11 13 16 12 23 18
%         10 13 16 17 21 24 24 21
%         14 18 19 20 22 20 20 20];

% Quantization matrix for quality level 10 (luminance)
% y_q10 = [80 60 50 80 120 200 255 255
%          55 60 70 95 130 255 155 155
%          70 65 80 120 200 255 255 255
%          70 85 110 145 255 255 255 255
%          90 110 185 255 255 255 255 255
%          120 175 255 255 255 255 255 255
%          245 255 255 255 255 255 255 255
%          255 255 255 255 255 255 255 255];

% Quantization matrix for quality level 50 (chrominance) 
% c_q50 = [17 18 24 47 99 99 99 99
%          18 21 26 66 99 99 99 99
%          24 26 56 99 99 99 99 99
%          47 66 99 99 99 99 99 99
%          99 99 99 99 99 99 99 99
%          99 99 99 99 99 99 99 99
%          99 99 99 99 99 99 99 99
%          99 99 99 99 99 99 99 99];
      
% Discrete cosine transform and quantization matrix multiplication on
% element one values: i.e. luminance for YCbCr or red for RGB. 
A_1 = dct2(color(:,:,1));
A_1 = round(A_1./y_q50);
%A_1 = round(A_1./y_q90);
%A_1 = round(A_1./y_q10);
z1 = zigzag(A_1);
A_1 = A_1.*y_q50;
%A_1 = A_1.*y_q90;
%A_1 = A_1.*y_q10;

% Discrete cosine transform and quantization matrix multiplication on
% element two values: i.e. blue chrominance for YCbCr or green for RGB. 
A_2 = dct2(color(:,:,2));
%A_2 = round(A_2./c_q50);
A_2 = round(A_2./y_q50);
z2 = zigzag(A_2);
%A_2 = A_2.*c_q50;
A_2 = A_2.*y_q50;

% Discrete cosine transform and quantization matrix multiplication on element
% three values: i.e. red chrominance for YCbCr or blue for RGB
A_3 = dct2(color(:,:,3));
%A_3 = round(A_3./c_q50);
A_3 = round(A_3./y_q50);
z3 = zigzag(A_3);
%A_3 = A_3.*c_q50;
A_3 = A_3.*y_q50;

% Applying the inverse discrete cosine transform and recombining the
% appropriate values to the appropriate color space. 
color(:,:,1) = idct2(A_1);
color(:,:,2) = idct2(A_2);
color(:,:,3) = idct2(A_3);


end