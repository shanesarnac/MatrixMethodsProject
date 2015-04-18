%% Main file
% Audrey Randall, Antoine Steiblen, Shane Sarnac
% 4/18/2015

test_img = 'flower.jpg';

whos(test_img)
f = @() Compress_RGB_to_YCbCr(test_img); %handle for function\
timeit(f)

test_1 = Compress_RGB_to_YCbCr(test_img);
imwrite(test_1, 'test1.jpg');
test1 = 'test1.jpg';
whos(test1)
