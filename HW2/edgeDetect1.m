function [newImg] = edgeDetect1(img, k, threshold) 
    newImg = zeros([size(img, 1), size(img, 2)]);
    Gr = zeros([size(img, 1), size(img, 2)]);
    Gc = zeros([size(img, 1), size(img, 2)]);
    G = zeros([size(img, 1), size(img, 2)]);
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            if i - 1 <= 0 || i + 1 > size(img, 1) || j - 1 <= 0 || j + 1 > size(img, 2)
                continue;
            end
            Gr(i, j) = (1 / (k + 2)) * (img(i-1, j+1) + k * img(i, j+1) + img(i+1, j+1) - img(i-1, j-1) - k * img(i, j-1) - img(i+1, j-1));
            Gc(i, j) = (1 / (k + 2)) * (img(i-1, j-1) + k * img(i-1, j) + img(i-1, j+1) - img(i+1, j-1) - k * img(i+1, j) - img(i+1, j+1));
            G(i, j) = sqrt(Gr(i, j) ^ 2 + Gc(i, j) ^ 2);
            if G(i, j) > threshold
                newImg(i, j) = 255;
            else
                newImg(i, j) = 0;
            end
        end
    end
    newImg = uint8(newImg);
%     imshow(newImg);