function [textMap] = LawsMethod(img, wSize)
    m1 = zeros(size(img));
    m2 = zeros(size(img));
    m3 = zeros(size(img));
    m4 = zeros(size(img));
    m5 = zeros(size(img));
    m6 = zeros(size(img));
    m7 = zeros(size(img));
    m8 = zeros(size(img));
    m9 = zeros(size(img));
    h1 = [1, 2, 1; 2, 4, 2; 1, 2, 1];
    h2 = [1, 0, -1; 2, 0, -2; 1, 0, -1];
    h3 = [-1, 2, -1; -2, 4, -2; -1, 2, -1];
    h4 = [-1, -2, -1; 0, 0, 0; 1, 2, 1];
    h5 = [1, 0, -1; 0, 0, 0; -1, 0, 1];
    h6 = [-1, 2, -1; 0, 0, 0; 1, -2, 1];
    h7 = [-1, -2, -1; 2, 4, 2; -1, -2, -1];
    h8 = [-1, 0, 1; 2, 0, -2; -1, 0, 1];
    h9 = [1, -2, 1; -2, 4, -2; 1, -2, 1];
    for i = 2:size(img, 1) - 1
        for j = 2:size(img, 2) - 1
            for k = 1:3
                for p = 1:3
                    m1(i, j) = m1(i, j) + h1(k, p) * img(i-2+k, j-2+p);
                    m2(i, j) = m2(i, j) + h2(k, p) * img(i-2+k, j-2+p);
                    m3(i, j) = m3(i, j) + h3(k, p) * img(i-2+k, j-2+p);
                    m4(i, j) = m4(i, j) + h4(k, p) * img(i-2+k, j-2+p);
                    m5(i, j) = m5(i, j) + h5(k, p) * img(i-2+k, j-2+p);
                    m6(i, j) = m6(i, j) + h6(k, p) * img(i-2+k, j-2+p);
                    m7(i, j) = m7(i, j) + h7(k, p) * img(i-2+k, j-2+p);
                    m8(i, j) = m8(i, j) + h8(k, p) * img(i-2+k, j-2+p);
                    m9(i, j) = m9(i, j) + h9(k, p) * img(i-2+k, j-2+p);
                end
            end
        end
    end
    m1 = m1 / 36;
    m2 = m2 / 12;
    m3 = m3 / 12;
    m4 = m4 / 12;
    m5 = m5 / 4;
    m6 = m6 / 4;
    m7 = m7 / 12;
    m8 = m8 / 4;
    m9 = m9 / 4;

    m1(1, :) = m1(2, :);
    m1(:, 1) = m1(:, 2);
    m1(size(img), :) = m1(size(img) - 1, :);
    m1(:, size(img)) = m1(:, size(img) - 1);

    m2(1, :) = m2(2, :);
    m2(:, 1) = m2(:, 2);
    m2(size(img), :) = m2(size(img) - 1, :);
    m2(:, size(img)) = m2(:, size(img) - 1);

    m3(1, :) = m3(2, :);
    m3(:, 1) = m3(:, 2);
    m3(size(img), :) = m3(size(img) - 1, :);
    m3(:, size(img)) = m3(:, size(img) - 1);

    m4(1, :) = m4(2, :);
    m4(:, 1) = m4(:, 2);
    m4(size(img), :) = m4(size(img) - 1, :);
    m4(:, size(img)) = m4(:, size(img) - 1);

    m5(1, :) = m5(2, :);
    m5(:, 1) = m5(:, 2);
    m5(size(img), :) = m5(size(img) - 1, :);
    m5(:, size(img)) = m5(:, size(img) - 1);

    m6(1, :) = m6(2, :);
    m6(:, 1) = m6(:, 2);
    m6(size(img), :) = m6(size(img) - 1, :);
    m6(:, size(img)) = m6(:, size(img) - 1);

    m7(1, :) = m7(2, :);
    m7(:, 1) = m7(:, 2);
    m7(size(img), :) = m7(size(img) - 1, :);
    m7(:, size(img)) = m7(:, size(img) - 1);

    m8(1, :) = m8(2, :);
    m8(:, 1) = m8(:, 2);
    m8(size(img), :) = m8(size(img) - 1, :);
    m8(:, size(img)) = m8(:, size(img) - 1);

    m9(1, :) = m9(2, :);
    m9(:, 1) = m9(:, 2);
    m9(size(img), :) = m9(size(img) - 1, :);
    m9(:, size(img)) = m9(:, size(img) - 1);
    
    imwrite(uint8(m1), 'feature1.jpg');
    imwrite(uint8(m2), 'feature2.jpg');
    imwrite(uint8(m3), 'feature3.jpg');
    imwrite(uint8(m4), 'feature4.jpg');
    imwrite(uint8(m5), 'feature5.jpg');
    imwrite(uint8(m6), 'feature6.jpg');
    imwrite(uint8(m7), 'feature7.jpg');
    imwrite(uint8(m8), 'feature8.jpg');
    imwrite(uint8(m9), 'feature9.jpg');
    

    t1 = zeros(size(img));
    t2 = zeros(size(img));
    t3 = zeros(size(img));
    t4 = zeros(size(img));
    t5 = zeros(size(img));
    t6 = zeros(size(img));
    t7 = zeros(size(img));
    t8 = zeros(size(img));
    t9 = zeros(size(img));

    wHfSize = (wSize - 1) / 2;

    for i = (1 + wHfSize):(size(img, 1) - wHfSize)
        for j = (1 + wHfSize):(size(img, 2) - wHfSize)
            for k = -wHfSize:wHfSize
                for p = -wHfSize:wHfSize
                    t1(i, j) = t1(i, j) + m1(i + k, j + p) ^ 2;
                    t2(i, j) = t2(i, j) + m2(i + k, j + p) ^ 2;
                    t3(i, j) = t3(i, j) + m3(i + k, j + p) ^ 2;
                    t4(i, j) = t4(i, j) + m4(i + k, j + p) ^ 2;
                    t5(i, j) = t5(i, j) + m5(i + k, j + p) ^ 2;
                    t6(i, j) = t6(i, j) + m6(i + k, j + p) ^ 2;
                    t7(i, j) = t7(i, j) + m7(i + k, j + p) ^ 2;
                    t8(i, j) = t8(i, j) + m8(i + k, j + p) ^ 2;
                    t9(i, j) = t9(i, j) + m9(i + k, j + p) ^ 2;
                end
            end
            t1(i, j) = sqrt(t1(i, j));
            t2(i, j) = sqrt(t2(i, j));
            t3(i, j) = sqrt(t3(i, j));
            t4(i, j) = sqrt(t4(i, j));
            t5(i, j) = sqrt(t5(i, j));
            t6(i, j) = sqrt(t6(i, j));
            t7(i, j) = sqrt(t7(i, j));
            t8(i, j) = sqrt(t8(i, j));
            t9(i, j) = sqrt(t9(i, j));
        end
    end

    for i = 1:wHfSize
        t1(i, :) = t1(wHfSize + 1, :);
        t1(:, i) = t1(:, wHfSize + 1);
        t1(size(img, 1) - (i-1), :) = t1(size(img, 1) - wHfSize, :);
        t1(:, size(img, 1) - (i-1)) = t1(:, size(img, 1) - wHfSize);

        t2(i, :) = t2(wHfSize + 1, :);
        t2(:, i) = t2(:, wHfSize + 1);
        t2(size(img, 1) - (i-1), :) = t2(size(img, 1) - wHfSize, :);
        t2(:, size(img, 1) - (i-1)) = t2(:, size(img, 1) - wHfSize);

        t3(i, :) = t3(wHfSize + 1, :);
        t3(:, i) = t3(:, wHfSize + 1);
        t3(size(img, 1) - (i-1), :) = t3(size(img, 1) - wHfSize, :);
        t3(:, size(img, 1) - (i-1)) = t3(:, size(img, 1) - wHfSize);

        t4(i, :) = t4(wHfSize + 1, :);
        t4(:, i) = t4(:, wHfSize + 1);
        t4(size(img, 1) - (i-1), :) = t4(size(img, 1) - wHfSize, :);
        t4(:, size(img, 1) - (i-1)) = t4(:, size(img, 1) - wHfSize);

        t5(i, :) = t5(wHfSize + 1, :);
        t5(:, i) = t5(:, wHfSize + 1);
        t5(size(img, 1) - (i-1), :) = t5(size(img, 1) - wHfSize, :);
        t5(:, size(img, 1) - (i-1)) = t5(:, size(img, 1) - wHfSize);

        t6(i, :) = t6(wHfSize + 1, :);
        t6(:, i) = t6(:, wHfSize + 1);
        t6(size(img, 1) - (i-1), :) = t6(size(img, 1) - wHfSize, :);
        t6(:, size(img, 1) - (i-1)) = t6(:, size(img, 1) - wHfSize);

        t7(i, :) = t7(wHfSize + 1, :);
        t7(:, i) = t7(:, wHfSize + 1);
        t7(size(img, 1) - (i-1), :) = t7(size(img, 1) - wHfSize, :);
        t7(:, size(img, 1) - (i-1)) = t7(:, size(img, 1) - wHfSize);

        t8(i, :) = t8(wHfSize + 1, :);
        t8(:, i) = t8(:, wHfSize + 1);
        t8(size(img, 1) - (i-1), :) = t8(size(img, 1) - wHfSize, :);
        t8(:, size(img, 1) - (i-1)) = t8(:, size(img, 1) - wHfSize);

        t9(i, :) = t9(wHfSize + 1, :);
        t9(:, i) = t9(:, wHfSize + 1);
        t9(size(img, 1) - (i-1), :) = t9(size(img, 1) - wHfSize, :);
        t9(:, size(img, 1) - (i-1)) = t9(:, size(img, 1) - wHfSize);
    end
    
    imwrite(uint8(t1), 'energy1.jpg');
    imwrite(uint8(t2), 'energy2.jpg');
    imwrite(uint8(t3), 'energy3.jpg');
    imwrite(uint8(t4), 'energy4.jpg');
    imwrite(uint8(t5), 'energy5.jpg');
    imwrite(uint8(t6), 'energy6.jpg');
    imwrite(uint8(t7), 'energy7.jpg');
    imwrite(uint8(t8), 'energy8.jpg');
    imwrite(uint8(t9), 'energy9.jpg');
    

    T = zeros([512, 512, 9]);
    for i = 1:512
        for j = 1:512
            T(i, j, 1) = t1(i, j);
            T(i, j, 2) = t2(i, j);
            T(i, j, 3) = t3(i, j);
            T(i, j, 4) = t4(i, j);
            T(i, j, 5) = t5(i, j);
            T(i, j, 6) = t6(i, j);
            T(i, j, 7) = t7(i, j);
            T(i, j, 8) = t8(i, j);
            T(i, j, 9) = t9(i, j);
        end
    end

    dimension = 9;

    randIdx = randi([1, 512], 3, 2);
    means = zeros([3, dimension]);
    for i = 1:3
        means(i) = T(randIdx(i, 1), randIdx(i, 2));
    end
    means = sortrows(means, 1);
    
    lastCluster = zeros([size(img, 1), size(img, 2)]);
    iter = 1;

    while 1
        cluster = zeros([size(img, 1), size(img, 2)]);

        for i = 1:size(img, 1)
            for j = 1:size(img, 2)
                distance = zeros([3, 1]);
                for p = 1:3
                    temp = 0;
                    for k = 1:dimension
                        temp = temp + (T(i, j, k) - means(p, k)) ^ 2;
                    end
                    distance(p) = temp;
                end
                [minValue, minIdx] = min(distance);
                cluster(i, j) = minIdx;
            end
        end

        if cluster == lastCluster
            break;
        end


        for i = 1:3
            [u, v] = find(cluster == i);
            newMean = zeros([dimension, 1]);
            for j = 1:size(u, 1)
                for p = 1:dimension
                    newMean(p, 1) = newMean(p, 1) + T(u(j), v(j), p) / size(u, 1);
                end
            end
            means(i, :) = newMean;
        end
        means = sortrows(means, 1);

        lastCluster = cluster;

        disp(iter);
        iter = iter + 1;
    end

    textMap = zeros([size(img, 1), size(img, 2)]);
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            if cluster(i, j) == 1
                textMap(i, j) = 0;
            elseif cluster(i, j) == 2
                textMap(i, j) = 128;
            else
                textMap(i, j) = 255;
            end
        end
    end

%     subplot(1,2,1);
%     imshow(uint8(img));
%     subplot(1,2,2);
%     imshow(uint8(textMap));


    text1 = zeros(size(img));
    text2 = zeros(size(img));
    text3 = zeros(size(img));
    for i = 1:size(textMap, 1)
        for j = 1:size(textMap, 2)
            if textMap(i, j) == 0
                text1(i, j) = img(i, j);
            elseif textMap(i, j) == 128
                text2(i, j) = img(i, j);
            else
                text3(i, j) = img(i, j);
            end
        end
    end
    imwrite(uint8(text1), 'text1.jpg');
    imwrite(uint8(text2), 'text2.jpg');
    imwrite(uint8(text3), 'text3.jpg');