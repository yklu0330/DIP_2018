function test1(colData, left, right, up, down, whRatio)
    img1 = readraw('sample1.raw', 390, 125);
    newImg1 = rmNoiseImg1(img1);

    black12 = zeros([size(newImg1, 2), 1]);
    for j = 1:size(newImg1, 2)
        for i = 1:size(newImg1, 1)
            black12(j, 1) = black12(j, 1) + newImg1(i, j);
        end
    end

    left1 = zeros([5, 1]);
    right1 = zeros([5, 1]);
    left1Idx = 1;
    right1Idx = 1;
    prev = 0;
    for i = 1:size(newImg1, 2)
        if prev == 0 && black12(i) > 0
            left1(left1Idx) = i;
            left1Idx = left1Idx + 1;
        elseif prev > 0 && black12(i) == 0
            right1(right1Idx) = i-1;
            right1Idx = right1Idx + 1;
        end
        prev = black12(i);
    end

    up1 = zeros([6, 1]);
    down1 = zeros([6, 1]);
    up1Idx = 1;
    down1Idx = 1;
    for i = 1:5
        black21 = zeros([size(newImg1, 1), 1]);
        for j = 1:size(newImg1, 1)
            for k = left1(i):right1(i)
                black21(j) = black21(j) + newImg1(j, k);
            end
        end
        prev = 0;
        for j = 1:size(black21, 1)
            if prev == 0 && black21(j) > 0
                up1(up1Idx) = j;
                up1Idx = up1Idx + 1;
            elseif prev > 0 && black21(j) == 0
                down1(down1Idx) = j-1;
                down1Idx = down1Idx + 1;
            end
            prev = black21(j);
        end
    end

    for i = 4:6
        up1(i-1) = up1(i);
    end
    for i = 3:6
        down1(i-1) = down1(i);
    end
    up1(6) = [];
    down1(6) = [];

    right1(5) = right1(5) - 1;

    trainChar = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', ...
        'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', ...
        'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', ...
        '@', '#', '$', '%', '^', '&', '*'];


    for i = 1:5
        testImg = imcrop(newImg1, [left1(i), up1(i), right1(i)-left1(i), down1(i)-up1(i)]);
        ratio = (right1(i) - left1(i)) / (down1(i) - up1(i));

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