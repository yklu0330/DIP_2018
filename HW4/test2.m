function test2(colData, left, right, up, down, whRatio)
    img2 = readraw('sample2.raw', 390, 125);
    newImg2 = rmNoiseImg2(img2);
    
    black22 = zeros([size(newImg2, 2), 1]);
    for j = 1:size(newImg2, 2)
        for i = 1:size(newImg2, 1)
            black22(j, 1) = black22(j, 1) + newImg2(i, j);
        end
    end

    left2 = zeros([6, 1]);
    right2 = zeros([6, 1]);
    left2Idx = 1;
    right2Idx = 1;
    prev = 0;
    for i = 1:size(newImg2, 2)
        if prev == 0 && black22(i) > 0
            left2(left2Idx) = i;
            left2Idx = left2Idx + 1;
        elseif prev > 0 && black22(i) == 0
            right2(right2Idx) = i-1;
            right2Idx = right2Idx + 1;
        end
        prev = black22(i);
    end

    up2 = zeros([6, 1]);
    down2 = zeros([6, 1]);
    up2Idx = 1;
    down2Idx = 1;
    for i = 1:6
        black21 = zeros([size(newImg2, 1), 1]);
        for j = 1:size(newImg2, 1)
            for k = left2(i):right2(i)
                black21(j) = black21(j) + newImg2(j, k);
            end
        end
        prev = 0;
        for j = 1:size(black21, 1)
            if prev == 0 && black21(j) > 0
                up2(up2Idx) = j;
                up2Idx = up2Idx + 1;
            elseif prev > 0 && black21(j) == 0
                down2(down2Idx) = j-1;
                down2Idx = down2Idx + 1;
            end
            prev = black21(j);
        end
    end

    trainChar = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', ...
        'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', ...
        'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', ...
        '@', '#', '$', '%', '^', '&', '*'];

    for i = 1:6
        testImg = imcrop(newImg2, [left2(i), up2(i), right2(i)-left2(i), down2(i)-up2(i)]);
        ratio = (right2(i) - left2(i)) / (down2(i) - up2(i));

        eval = zeros([70, 1]);
        for j = 1:70
            if abs(ratio - whRatio(j)) > 0.2
                continue;
            end

            trainImg = imcrop(colData(:, :, j), [left(j), up(j), right(j) - left(j), down(j) - up(j)]);
            trainImg = imresize(trainImg, size(testImg), 'nearest');

            for m = 1:size(testImg, 1)
                for n = 1:size(testImg, 2)
                    if testImg(m, n) == trainImg(m, n)
                        eval(j) = eval(j) + 3;
                    else
                        eval(j) = eval(j) - 1;
                    end
                end
            end

        end

        [maxVal, maxIdx] = max(eval);
        disp(trainChar(maxIdx));
    end

