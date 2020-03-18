img = readraw('TrainingSet.raw', 450, 248);
newImg = rmNoiseTrain(img);

colData = zeros([49, 32, 70]);
for i = 0:4
    for j = 0:13
        for k = 1:49
            for p = 1:32
                colData(k, p, 14 * i + j + 1) = newImg(49 * i + k, 32 * j + p);
            end
        end
    end
end

up = zeros([70, 1]);
down = zeros([70, 1]);
left = zeros([70, 1]);
right = zeros([70, 1]);

for i = 1:70
    black1 = zeros([49, 1]);
    for j = 1:49
        for k = 1:32
            black1(j) = black1(j) + colData(j, k, i);
        end
    end
    for j = 1:49
        if black1(j) ~= 0
            break;
        end
    end
    up(i) = j;
    for j = 49:-1:1
        if black1(j) ~= 0
            break;
        end
    end
    down(i) = j-1;

    black2 = zeros([32, 1]);
    for j = 1:32
        for k = 1:49
            black2(j) = black2(j) + colData(k, j, i);
        end
    end
    for j = 1:32
        if black2(j) ~= 0
            break;
        end
    end
    left(i) = j;
    for j = 32:-1:1
        if black2(j) ~= 0
            break;
        end
    end
    right(i) = j-1;
end

width = zeros([70, 1]);
height = zeros([70, 1]);
whRatio = zeros([70, 1]);
for i = 1:70
    width(i) = right(i) - left(i);
    height(i) = down(i) - up(i);
    whRatio(i) = width(i) / height(i);
end

left(35) = left(35) + 5;
left(61) = left(61) + 1;
left(63) = left(63) + 1;
right(19) = right(19) + 1;




% test1(colData, left, right, up, down, whRatio);
test2(colData, left, right, up, down, whRatio);


