img = readraw('sample2.raw');
img = uint8(img);

% part a
D = img / 3;
%imshow(D);

% part b
% imhist(D);

% part c
P = zeros(256, 1);
for i = 1:size(D, 1)
    for j = 1:size(D, 2)
        grayVal = D(i, j) + 1;
        P(grayVal) = P(grayVal) + 1;
    end
end

cdf = zeros(256,1);
cdf(1) = P(1);
cdfMin = 0;
for i = 2:256
    cdf(i) = cdf(i-1) + P(i);
    if (cdfMin == 0 && cdf(i) > 0)
        cdfMin = cdf(i);
    end
end

cdfMin = cdf(1);

cdf_equal = zeros(256, 1);
for i = 1:256
    cdf_equal(i) = round((cdf(i) - cdfMin) / (size(D, 1) * size(D, 2) - cdfMin) * (256 - 2)) + 1;
end

H = D;
for i = 1:size(D, 1)
    for j = 1:size(D, 2)
        H(i,j) = cdf_equal(H(i,j) + 1);
    end
end

%imshow(H);
% imhist(H);


% part d
L = D;
windowSize = 9;
winHalfSize = (windowSize - 1) / 2;
for i = 1:size(D, 1)
    for j = 1:size(D, 2)
        hist = zeros(256, 1);
        for i2 = (i - winHalfSize):(i + winHalfSize)
            for j2 = (j - winHalfSize):(j + winHalfSize)
                if i2 <= 0 || i2 > size(D, 1) || j2 <= 0 || j2 > size(D, 2)
                    continue;
                end
                grayVal = D(i2, j2) + 1;
                hist(grayVal) = hist(grayVal) + 1;
            end
        end
        origGray = D(i, j) + 1;
        newGray = 0;
        for k = 1:origGray
            newGray = newGray + hist(k);
        end
        newGray = newGray * 255 / (windowSize * windowSize);
        L(i, j) = newGray;
    end
end
%imshow(L);
%imhist(L);

% part f - log transform
logImg = D;
re_D = reshape(D, [], 1);
[maxDVal, maxDIdx] = max(re_D);
log_c = 255 / log(double(maxDVal + 1));
for i = 1:size(D, 1)
    for j = 1:size(D, 2)
        temp = 1 + D(i, j);
        temp = double(temp);
        logImg(i, j) = log_c * log(temp);
    end
end
% imshow(logImg);
% imhist(logImg);

% part f - inverse log transform
invLogImg = D;
invLog_c = 255 / (1.02 ^ maxDVal - 1);
% invLog_c = 8;
for i = 1:size(D, 1)
    for j = 1:size(D, 2)
        temp = 1.02 ^ D(i, j) - 1;
        invLogImg(i, j) = invLog_c * temp;
%         temp = D(i, j) / invLog_c;
%         temp = double(temp);
%         invLogImg(i, j) = exp(temp) - 1;
    end
end
% imshow(invLogImg);
% imhist(invLogImg);

% part f - power-law transform
powImg = D;
pow_c = 7;
gamma = 0.8;
for i = 1:size(D, 1)
    for j = 1:size(D, 2)
        x = double(D(i, j));
        temp = x ^ gamma;
        powImg(i, j) = pow_c * temp;
    end
end
% imshow(powImg);
% imhist(powImg);

