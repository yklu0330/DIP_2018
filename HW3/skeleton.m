function skeleton(img)
    binImg = img / 255;
    delPoint = zeros(size(img));
    stop = 0;

    while stop == 0
        stop = 1;
        for i = 2:size(binImg, 1) - 1
            for j = 2:size(binImg, 2) - 1
                if binImg(i, j) == 1
                    condition = zeros([4, 1]);

                    P = zeros([9, 1]);
                    P(1) = binImg(i, j);
                    P(2) = binImg(i-1, j);
                    P(3) = binImg(i-1, j+1);
                    P(4) = binImg(i, j+1);
                    P(5) = binImg(i+1, j+1);
                    P(6) = binImg(i+1, j);
                    P(7) = binImg(i+1, j-1);
                    P(8) = binImg(i, j-1);
                    P(9) = binImg(i-1, j-1);

                    N = 0;
                    for k = 2:9
                        N = N + P(k);
                    end
                    if N >= 2 && N <= 6
                        condition(1) = 1;
                    end

                    prev = P(9);
                    S = 0;
                    for k = 2:9
                        if prev == 0 && P(k) == 1
                            S = S + 1;
                        end
                        prev = P(k);
                    end
                    if S == 1
                        condition(2) = 1;
                    end

                    if P(2) * P(4) * P(6) == 0
                        condition(3) = 1;
                    end

                    if P(4) * P(6) * P(8) == 0
                        condition(4) = 1;
                    end

                    if condition(1) && condition(2) && condition(3) && condition(4)
                        delPoint(i, j) = 1;
                        stop = 0;
                    end
                end
            end
        end

        for i = 1:size(binImg, 1)
            for j = 1:size(binImg, 2)
                if delPoint(i, j) == 1
                    binImg(i, j) = 0;
                end
            end
        end

        for i = 2:size(binImg, 1) - 1
            for j = 2:size(binImg, 2) - 1
                if binImg(i, j) == 1
                    condition = zeros([4, 1]);

                    P = zeros([9, 1]);
                    P(1) = binImg(i, j);
                    P(2) = binImg(i-1, j);
                    P(3) = binImg(i-1, j+1);
                    P(4) = binImg(i, j+1);
                    P(5) = binImg(i+1, j+1);
                    P(6) = binImg(i+1, j);
                    P(7) = binImg(i+1, j-1);
                    P(8) = binImg(i, j-1);
                    P(9) = binImg(i-1, j-1);

                    N = 0;
                    for k = 2:9
                        N = N + P(k);
                    end
                    if N >= 2 && N <= 6
                        condition(1) = 1;
                    end

                    prev = P(9);
                    S = 0;
                    for k = 2:9
                        if prev == 0 && P(k) == 1
                            S = S + 1;
                        end
                        prev = P(k);
                    end
                    if S == 1
                        condition(2) = 1;
                    end

                    if P(2) * P(4) * P(8) == 0
                        condition(3) = 1;
                    end

                    if P(2) * P(6) * P(8) == 0
                        condition(4) = 1;
                    end

                    if condition(1) && condition(2) && condition(3) && condition(4)
                        delPoint(i, j) = 1;
                        stop = 0;
                    end
                end
            end
        end

        for i = 1:size(binImg, 1)
            for j = 1:size(binImg, 2)
                if delPoint(i, j) == 1
                    binImg(i, j) = 0;
                end
            end
        end
    end

    binImg = binImg * 255;

    subplot(1,2,1);
    imshow(img);
    subplot(1,2,2);
    imshow(uint8(binImg));