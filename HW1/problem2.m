img = readraw('sample3.raw');
img = uint8(img);
w = size(img, 2);
h = size(img, 1);

% part 1(a)
mean = 0;
var = 15;
a = randn(size(img));
gau = mean + var * randn(size(img));
G1 = img;
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        noise = G1(i, j) + gau(i, j);
        if noise < 0
            noise = 0;
        elseif noise > 255
            noise = 255;
        end
        G1(i, j) = noise;
    end
end
% imshow(G1);

% part 1(b)
uniform = rand(size(img));
threshold = 0.01;
S1 = img;
for i = 1:size(img, 1)
    for j = 1:size(img, 2)
        if uniform(i, j) < threshold
            S1(i, j) = 0;
        elseif uniform(i, j) > 1 - threshold
            S1(i, j) = 255;
        else
            S1(i, j) = img(i, j);
        end
    end
end
S1 = uint8(S1);
%imshow(S1);

% part 1(c)
% mean filter
db_G1 = double(G1);
Rg = db_G1;
mat = [1, 1, 1; 1, 1, 1; 1, 1, 1];
n = sum(sum(mat));
matWidth = size(mat, 1);
matHalfSize = (matWidth - 1) / 2;

for i = 1:size(G1, 1)
    for j = 1:size(G1, 2)
        grayVal = 0;
        grayVal = double(grayVal);
        for i2 = (i - matHalfSize):(i + matHalfSize)
            for j2 = (j - matHalfSize):(j + matHalfSize)
                if i2 <= 0 || i2 > size(G1, 1) || j2 <= 0 || j2 > size(G1, 2)
                    continue;
                end
                grayVal = grayVal + db_G1(i2, j2) * mat((i2 - i + 2), (j2 - j + 2));
            end
        end
        grayVal = grayVal / n;
        Rg(i, j) = grayVal;
    end
end
Rg = uint8(Rg);
% imshow(Rg);



% median filter
db_S1 = double(S1);
Rs = db_S1;
matWidth = 3;
matHalfSize = (matWidth - 1) / 2;

for i = 1:size(S1, 1)
    for j = 1:size(S1, 2)
        temp = [];
        for i2 = (i - matHalfSize):(i + matHalfSize)
            for j2 = (j - matHalfSize):(j + matHalfSize)
                if i2 <= 0 || i2 > size(S1, 1) || j2 <= 0 || j2 > size(S1, 2)
                    continue;
                end
                temp = [temp, db_S1(i2, j2)];
            end
        end
        Rs(i, j) = median(temp);
    end
end
Rs = uint8(Rs);
% imshow(Rs);
                
% part 1(d)
dif = double(Rs) - double(img);
MSE = sum(dif(:) .^ 2) / numel(Rg);
PSNR = 10 * log10(255 ^ 2 / MSE);
% disp(PSNR);

% part 2
img2 = readraw('sample4.raw');
img2 = uint8(img2);

db_img2 = double(img2);
newImg2 = db_img2;
matWidth = 9;
mat = ones([matWidth, matWidth]);
n = sum(sum(mat));
matHalfSize = (matWidth - 1) / 2;

for i = (1 + matHalfSize):(size(img2, 1) - matHalfSize)
    for j = (1 + matHalfSize):(size(img2, 2) - matHalfSize)
        grayVal = 0;
        grayVal = double(grayVal);
        for i2 = (i - matHalfSize):(i + matHalfSize)
            for j2 = (j - matHalfSize):(j + matHalfSize)
                grayVal = grayVal + db_img2(i2, j2) * mat((i2 - i + matHalfSize + 1), (j2 - j + matHalfSize + 1));
            end
        end
        grayVal = grayVal / n;
        newImg2(i, j) = grayVal;
    end
end

% subplot(1,2,1);
% imshow(img2);
% subplot(1,2,2);
% imshow(uint8(newImg2));

