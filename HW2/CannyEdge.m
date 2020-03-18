function [newImg] = CannyEdge(img, highThreshold, lowThreshold)
    img = double(meanFilter(img));
    newImg = zeros([size(img, 1), size(img, 2)]);
    Gx = double(zeros([size(img, 1), size(img, 2)]));
    Gy = double(zeros([size(img, 1), size(img, 2)]));
    G = double(zeros([size(img, 1), size(img, 2)]));
    angle = double(zeros([size(img, 1), size(img, 2)]));

    for i = 2:size(img, 1)-1
        for j = 2:size(img, 2)-1
            Gx(i, j) = -img(i-1, j-1) - 2*img(i, j-1) - img(i+1, j-1) + img(i-1, j+1) + 2*img(i, j+1) + img(i+1, j+1);
            Gy(i, j) = -img(i-1, j-1) + img(i+1, j-1) - 2*img(i-1, j) + 2*img(i+1, j) - img(i-1, j+1) + img(i+1, j+1);
            G(i, j) = sqrt(Gx(i, j) ^ 2 + Gy(i, j) ^ 2);
            temp = mod((atan(Gy(i, j) / Gx(i, j)) * 180 / pi), 180);
            if (temp >= 0 && temp < 22.5) || (temp >= 157.5 && temp <= 180)
                angle(i, j) = 0;
            elseif temp >= 22.5 && temp < 67.5
                angle(i, j) = 45;
            elseif temp >= 67.5 && temp < 112.5
                angle(i, j) = 90;
            elseif temp >= 112.5 && temp < 157.5
                angle(i, j) = 135;
            else
%                 disp('a')
                angle(i, j) = 0;
            end
        end
    end

    for i = 2:size(img, 1)-1
        for j = 2:size(img, 2)-1
            dTemp1 = 0;
            dTemp2 = 0;
            edgePoint = 0;
            if G(i, j) ~= 0 && abs(Gy(i, j)) > abs(Gx(i, j)) && Gx(i, j) * Gy(i, j) > 0
                W = abs(Gx(i, j) / Gy(i, j));
                dTemp1 = W * G(i-1, j-1) + (1 - W) * G(i-1, j);
                dTemp2 = W * G(i+1, j+1) + (1 - W) * G(i+1, j);
                if G(i, j) ~= 0 && G(i, j) > dTemp1 && G(i, j) > dTemp2
                    edgePoint = 1;
                end
            elseif G(i, j) ~= 0 && abs(Gy(i, j)) > abs(Gx(i, j)) && Gx(i, j) * Gy(i, j) < 0
                W = abs(Gx(i, j) / Gy(i, j));
                dTemp1 = W * G(i-1, j+1) + (1 - W) * G(i-1, j);
                dTemp2 = W * G(i+1, j-1) + (1 - W) * G(i+1, j);
                if G(i, j) ~= 0 && G(i, j) > dTemp1 && G(i, j) > dTemp2
                    edgePoint = 1;
                end
            elseif G(i, j) ~= 0 && abs(Gx(i, j)) > abs(Gy(i, j)) && Gx(i, j) * Gy(i, j) > 0
                W = abs(Gy(i, j) / Gx(i, j));
                dTemp1 = W * G(i-1, j-1) + (1 - W) * G(i, j-1);
                dTemp2 = W * G(i+1, j+1) + (1 - W) * G(i, j+1);
                if G(i, j) ~= 0 && G(i, j) > dTemp1 && G(i, j) > dTemp2
                    edgePoint = 1;
                end
            elseif G(i, j) ~= 0 && abs(Gy(i, j)) > abs(Gx(i, j)) && Gx(i, j) * Gy(i, j) < 0
                W = abs(Gy(i, j) / Gx(i, j));
                dTemp1 = W * G(i+1, j-1) + (1 - W) * G(i, j-1);
                dTemp2 = W * G(i-1, j+1) + (1 - W) * G(i, j+1);
                if G(i, j) ~= 0 && G(i, j) > dTemp1 && G(i, j) > dTemp2
                    edgePoint = 1;
                end
            else
                edgePoint = 0;
            end

            if edgePoint == 1
                if G(i, j) > highThreshold
                    newImg(i, j) = 255;
                elseif G(i, j) < lowThreshold
                    newImg(i, j) = 0;
                elseif G(i-1, j-1) > highThreshold || G(i, j-1) > highThreshold || G(i+1, j-1) > highThreshold ...
                        || G(i-1, j) > highThreshold || G(i+1, j) > highThreshold || G(i-1, j+1) > highThreshold ...
                         || G(i, j+1) > highThreshold || G(i+1, j+1) > highThreshold
                    newImg(i, j) = 255;
                else
                    newImg(i, j) = 0;
                end
            end
        end
    end
    newImg = uint8(newImg);
%     imshow(newImg);