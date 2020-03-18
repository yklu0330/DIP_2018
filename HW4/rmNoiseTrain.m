function [noNoiseImg] = rmNoiseTrain(img)
    noNoiseImg = img;
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            if img(i, j) <= 150
                noNoiseImg(i, j) = 255;
            else
                noNoiseImg(i, j) = 0;
            end
        end
    end