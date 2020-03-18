img = readrawRGB('sample1.raw');

%invert to gray scale
grayImg = zeros(size(img, 1), size(img, 2));
grayImg(:,:) = 0.2989 * img(:,:,1) + 0.5870 * img(:,:,2) + 0.1140 * img(:,:,3);
grayImg = uint8(grayImg);
%imshow(grayImg);

%diagonal flipping
flipImg = zeros(size(img, 1), size(img, 2));
for i = 1:size(img, 1)
    flipImg(i,:) = grayImg(:,i);
end
flipImg = uint8(flipImg);
imshow(flipImg);
