function [newImg] = meanFilter(img)
    db_G1 = double(img);
    newImg = db_G1;
    mat = [1, 1, 1; 1, 1, 1; 1, 1, 1];
    n = sum(sum(mat));
    matWidth = size(mat, 1);
    matHalfSize = (matWidth - 1) / 2;

    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            grayVal = 0;
            grayVal = double(grayVal);
            for i2 = (i - matHalfSize):(i + matHalfSize)
                for j2 = (j - matHalfSize):(j + matHalfSize)
                    if i2 <= 0 || i2 > size(img, 1) || j2 <= 0 || j2 > size(img, 2)
                        continue;
                    end
                    grayVal = grayVal + db_G1(i2, j2) * mat((i2 - i + 2), (j2 - j + 2));
                end
            end
            grayVal = grayVal / n;
            newImg(i, j) = grayVal;
        end
    end
    newImg = uint8(newImg);
    % imshow(Rg);