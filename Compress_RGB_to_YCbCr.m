function final_img = Compress_RGB_to_YCbCr(img)
rgb = imread(img);
ycbcr = rgb2ycbcr(rgb);
A_1 = dct2(ycbcr(:,:,1));
A_1(abs(A_1) < 10) = 0;

A_2 = dct2(ycbcr(:,:,2));
A_2(abs(A_2) < 100) = 0;

A_3 = dct2(ycbcr(:,:,3));
A_3(abs(A_3) < 100) = 0;

ycbcr(:,:,1) = idct2(A_1);
ycbcr(:,:,2) = idct2(A_2);
ycbcr(:,:,3) = idct2(A_3);

final_img = ycbcr2rgb(ycbcr);
% imshow(rgb2)
end