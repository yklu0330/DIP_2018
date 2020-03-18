function [newImg] = minFilter(img, wSize)
    wHfSize = (wSize - 1) / 2;
    newImg = img;
    for i = (1 + wHfSize):(size(img, 1) - wHfSize)
        for j = (1 + wHfSize):(size(img, 2) - wHfSize)
            pixVal = zeros([wSize * wSize, 1]);
            idx = 1;
            for k = -wHfSize:wHfSize
                for p = -wHfSize:wHfSize
                    pixVal(idx) = img(i + k, j + p);
                    idx = idx + 1;
                end
            end
            [minValue, minIdx] = min(pixVal);
            newImg(i, j) = minValue;
        end
    end
    
    for i = 1:wHfSize
        newImg(i, :) = newImg(wHfSize + 1, :);
        newImg(:, i) = newImg(:, wHfSize + 1);
        newImg(size(img, 1) - (i-1), :) = newImg(size(img, 1) - wHfSize, :);
        newImg(:, size(img, 1) - (i-1)) = newImg(:, size(img, 1) - wHfSize);
    end
    
            
    