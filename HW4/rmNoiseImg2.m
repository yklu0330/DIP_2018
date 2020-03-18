function [noNoiseImg] = rmNoiseImg2(img)
    img = double(img);
    noNoiseImg = img;
    matWidth = 3;
    matHalfSize = (matWidth - 1) / 2;

    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            temp = [];
            for i2 = (i - matHalfSize):(i + matHalfSize)
                for j2 = (j - matHalfSize):(j + matHalfSize)
                    if i2 <= 0 || i2 > size(img, 1) || j2 <= 0 || j2 > size(img, 2)
                        continue;
                    end
                    temp = [temp, img(i2, j2)];
                end
            end
            noNoiseImg(i, j) = median(temp);
        end
    end
    noNoiseImg = uint8(noNoiseImg);


    for i = 1:size(noNoiseImg, 1)
        for j = 1:size(noNoiseImg, 2)
            if noNoiseImg(i, j) == 65
                noNoiseImg(i, j) = 255;
            else
                noNoiseImg(i, j) = 0;
            end
        end
    end

