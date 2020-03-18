img = readraw('sample1.raw');
img2 = readraw('sample2.raw');
img3 = readraw('sample3.raw');

powImg = img2;
pow_c = 7;
gamma = 0.8;
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        x = double(img(i, j));
        temp = x ^ gamma;
        powImg(i, j) = pow_c * temp;
    end
end

logImg = img2;
re_D = reshape(img2, [], 1);
[maxDVal, maxDIdx] = max(re_D);
log_c = 255 / log(double(maxDVal + 1));
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        temp = 1 + img2(i, j);
        temp = double(temp);
        logImg(i, j) = log_c * log(temp);
    end
end


newImg1 = edgeDetect1(powImg, 2, 100);
newImg2 = edgeDetect2(powImg, 100);

cannyImg = CannyEdge(powImg, 140, 90);


subplot(1,3,1);
imshow(newImg1);
subplot(1,3,2);
imshow(newImg2);
subplot(1,3,3);
imshow(cannyImg);



% C = edgeCrispening(img3);
% geoModify(C, 30, 20, 3, 4);
