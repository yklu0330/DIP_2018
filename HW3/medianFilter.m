function [newImg] = medianFilter(img, wSize)    
    newImg = img;
    wHfSize = (wSize - 1) / 2;

    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            temp = [];
            for i2 = (i - wHfSize):(i + wHfSize)
                for j2 = (j - wHfSize):(j + wHfSize)
                    if i2 <= 0 || i2 > size(img, 1) || j2 <= 0 || j2 > size(img, 2)
                        continue;
                    end
                    temp = [temp, img(i2, j2)];
                end
            end
            newImg(i, j) = median(temp);
        end
    end
