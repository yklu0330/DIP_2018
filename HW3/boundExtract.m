function [B] = boundExtract(img)
%     B = img;
%     for i = 2:size(img, 1) - 1
%         for j = 2:size(img, 1) - 1
%            if img(i, j) == 255 && img(i-1, j) == 255 && img(i+1, j) == 255 ...
%                    && img(i, j-1) == 255 && img(i, j+1) == 255 ...
%                    && img(i-1, j-1) == 255 && img(i-1, j+1) == 255 ...
%                    && img(i+1, j-1) == 255 && img(i+1, j+1) == 255
%                 B(i, j) = 0;
%            end
%         end
%     end
    B = img - minFilter(img, 3);
    imshow(B);
    imwrite(B, 'B.jpg');
