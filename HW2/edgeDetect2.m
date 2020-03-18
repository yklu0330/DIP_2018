function [newImg] = edgeDetect2(img, threshold)
    img = double(img);    
    newImg = img;
    G2 = double(zeros([size(img, 1), size(img, 2)]));
    for i = 2:size(img, 1) - 1
        for j = 2:size(img, 2) - 1
            G2(i, j) = (1 / 8) * (-img(i-1, j-1) - img(i-1, j) - img(i-1, j+1) - img(i, j-1) + 8*img(i, j) - img(i, j+1) - img(i+1, j-1) - img(i+1, j) - img(i+1, j+1));
        end
    end
%     histogram(G2);
%     G_new = double(zeros([size(img, 1), size(img, 2)]));
%     for i = 1:size(G2, 1)
%         for j = 1:size(G2, 2)
%             if abs(G2(i, j)) <= threshold
%                 G_new(i, j) = 0;
%             else
%                 G_new(i, j) = G2(i, j);
%             end
%         end
%     end
    
%     for i = 1:size(img, 1)
%         for j = 1:size(img, 2)
%             if G2(i, j) >= threshold
%                 newImg(i, j) = 255;
%             else
%                 newImg(i, j) = 0;
%             end
%         end
%     end
    
    
    
    for i = 2:size(img, 1) - 1
        for j = 2:size(img, 2) - 1
            if G2(i-1, j) * G2(i+1, j) <= 0 && abs(G2(i-1, j) - G2(i+1, j)) >= threshold
                newImg(i, j) = 255;
            elseif G2(i, j-1) * G2(i, j+1) <= 0 && abs(G2(i, j-1) - G2(i, j+1)) >= threshold
                newImg(i, j) = 255;
            else
                newImg(i, j) = 0;
            end
        end
    end
    newImg = uint8(newImg);
%     imshow(newImg);