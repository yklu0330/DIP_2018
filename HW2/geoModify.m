function geoModify(img, ax, ay, tx, ty)
    newImg = double(zeros([size(img, 1), size(img, 2)]));
    for i = 1:size(newImg, 1)
        for j = 1:size(newImg, 2)
            newX = int16(i + ax * sin(2 * pi * j / tx * pi / 180) + 10);
            newY = int16(j + ay * sin(2 * pi * i / ty * pi / 180) + 10);
            if newX < 0 || newX > size(newImg, 1) - 1 || newY < 0 || newY > size(newImg, 1) - 1
                newImg(i, j) = 0;
            else
                newImg(i, j) = img(newX + 1, newY + 1);
            end
        end
    end
    imshow(uint8(newImg));
