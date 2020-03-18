function [newImg] = edgeCrispening(img)
    newImg = img;
    for i = 2:size(img, 1) - 1
        for j = 2:size(img, 2) - 1
            newImg(i, j) = (-1) * img(i, j-1) - img(i-1, j) + 5 * img(i, j) - img(i+1, j) - img(i, j+1);
        end
    end
    newImg = uint8(newImg);
    img = uint8(img);
%     subplot(1,2,1);
%     imshow(img);
%     subplot(1,2,2);
%     imshow(newImg);
