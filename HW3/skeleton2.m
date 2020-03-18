function skeleton2(img)
    binImg = zeros(size(img));

    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            if img(i, j) == 0
                binImg(i, j) = 0;
            else
                binImg(i, j) = 1;
            end
        end
    end


    TK4(:, :, 1) = [0, 1, 0; 0, 1, 1; 0, 0, 0];
    TK4(:, :, 2) = [0, 1, 0; 1, 1, 0; 0, 0, 0];
    TK4(:, :, 3) = [0, 0, 0; 1, 1, 0; 0, 1, 0];
    TK4(:, :, 4) = [0, 0, 0; 0, 1, 1; 0, 1, 0];

    STK4(:, :, 1) = [0, 0, 1; 0, 1, 1; 0, 0, 1];
    STK4(:, :, 2) = [1, 1, 1; 0, 1, 0; 0, 0, 0];
    STK4(:, :, 3) = [1, 0, 0; 1, 1, 0; 1, 0, 0];
    STK4(:, :, 4) = [0, 0, 0; 0, 1, 0; 1, 1, 1];

    STK6(:, :, 1) = [1, 1, 1; 0, 1, 1; 0, 0, 0];
    STK6(:, :, 2) = [0, 1, 1; 0, 1, 1; 0, 0, 1];
    STK6(:, :, 3) = [1, 1, 1; 1, 1, 0; 0, 0, 0];
    STK6(:, :, 4) = [1, 1, 0; 1, 1, 0; 1, 0, 0];
    STK6(:, :, 5) = [1, 0, 0; 1, 1, 0; 1, 1, 0];
    STK6(:, :, 6) = [0, 0, 0; 1, 1, 0; 1, 1, 1];
    STK6(:, :, 7) = [0, 0, 0; 0, 1, 1; 1, 1, 1];
    STK6(:, :, 8) = [0, 0, 1; 0, 1, 1; 0, 1, 1];

    STK7(:, :, 1) = [1, 1, 1; 0, 1, 1; 0, 0, 1];
    STK7(:, :, 2) = [1, 1, 1; 1, 1, 0; 1, 0, 0];
    STK7(:, :, 3) = [1, 0, 0; 1, 1, 0; 1, 1, 1];
    STK7(:, :, 4) = [0, 0, 1; 0, 1, 1; 1, 1, 1];

    STK8(:, :, 1) = [0, 1, 1; 0, 1, 1; 0, 1, 1];
    STK8(:, :, 2) = [1, 1, 1; 1, 1, 1; 0, 0, 0];
    STK8(:, :, 3) = [1, 1, 0; 1, 1, 0; 1, 1, 0];
    STK8(:, :, 4) = [0, 0, 0; 1, 1, 1; 1, 1, 1];

    STK9(:, :, 1) = [1, 1, 1; 0, 1, 1; 0, 1, 1];
    STK9(:, :, 2) = [0, 1, 1; 0, 1, 1; 1, 1, 1];
    STK9(:, :, 3) = [1, 1, 1; 1, 1, 1; 1, 0, 0];
    STK9(:, :, 4) = [1, 1, 1; 1, 1, 1; 0, 0, 1];
    STK9(:, :, 5) = [1, 1, 1; 1, 1, 0; 1, 1, 0];
    STK9(:, :, 6) = [1, 1, 0; 1, 1, 0; 1, 1, 1];
    STK9(:, :, 7) = [1, 0, 0; 1, 1, 1; 1, 1, 1];
    STK9(:, :, 8) = [0, 0, 1; 1, 1, 1; 1, 1, 1];

    STK10(:, :, 1) = [1, 1, 1; 0, 1, 1; 1, 1, 1];
    STK10(:, :, 2) = [1, 1, 1; 1, 1, 1; 1, 0, 1];
    STK10(:, :, 3) = [1, 1, 1; 1, 1, 0; 1, 1, 1];
    STK10(:, :, 4) = [1, 0, 1; 1, 1, 1; 1, 1, 1];

    K11(:, :, 1) = [1, 1, 1; 1, 1, 1; 0, 1, 1];
    K11(:, :, 2) = [1, 1, 1; 1, 1, 1; 1, 1, 0];
    K11(:, :, 3) = [1, 1, 0; 1, 1, 1; 1, 1, 1];
    K11(:, :, 4) = [0, 1, 1; 1, 1, 1; 1, 1, 1];

    Spur(:, :, 1) = [0, 0, 0; 0, 1, 0; 0, 0, 1];
    Spur(:, :, 2) = [0, 0, 0; 0, 1, 0; 1, 0, 0];
    Spur(:, :, 3) = [0, 0, 1; 0, 1, 0; 0, 0, 0];
    Spur(:, :, 4) = [1, 0, 0; 0, 1, 0; 0, 0, 0];

    Single(:, :, 1) = [0, 0, 0; 0, 1, 0; 0, 1, 0];
    Single(:, :, 2) = [0, 0, 0; 0, 1, 1; 0, 0, 0];
    Single(:, :, 3) = [0, 0, 0; 1, 1, 0; 0, 0, 0];
    Single(:, :, 4) = [0, 1, 0; 0, 1, 0; 0, 0, 0];

    Lcorner(:, :, 1) = [0, 1, 0; 0, 1, 1; 0, 0, 0];
    Lcorner(:, :, 2) = [0, 1, 0; 1, 1, 0; 0, 0, 0];
    Lcorner(:, :, 3) = [0, 0, 0; 0, 1, 1; 0, 1, 0];
    Lcorner(:, :, 4) = [0, 0, 0; 1, 1, 0; 0, 1, 0];


    flag = 1;
    while flag
        flag = 0;
        M = zeros(size(img));
        P = zeros(size(M));
        for i = 2:size(binImg, 1) - 1
            for j = 2:size(binImg, 2) - 1
                if binImg(i, j) == 1
                    curPixel = [binImg(i-1, j-1), binImg(i-1, j), binImg(i-1, j+1); binImg(i, j-1), binImg(i, j), binImg(i, j+1); binImg(i+1, j-1), binImg(i+1, j), binImg(i+1, j+1)];
                    for k = 1:size(TK4, 3)
                        if curPixel == TK4(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                    for k = 1:size(STK4, 3)
                        if curPixel == STK4(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                    for k = 1:size(STK6, 3)
                        if curPixel == STK6(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                    for k = 1:size(STK7, 3)
                        if curPixel == STK7(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                    for k = 1:size(STK8, 3)
                        if curPixel == STK8(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                    for k = 1:size(STK9, 3)
                        if curPixel == STK9(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                    for k = 1:size(STK10, 3)
                        if curPixel == STK10(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                    for k = 1:size(K11, 3)
                        if curPixel == K11(:, :, k)
                            M(i, j) = 1;
                            break;
                        end
                    end
                end
            end
        end


        for i = 2:size(M, 1) - 1
            for j = 2:size(M, 2) - 1
                curPixel = [M(i-1, j-1), M(i-1, j), M(i-1, j+1); M(i, j-1), M(i, j), M(i, j+1); M(i+1, j-1), M(i+1, j), M(i+1, j+1)];

                if M(i, j) == 0
                    continue;   
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && curPixel(1, 2) && ~curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && curPixel(1, 2) && ~curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && curPixel(1, 2) && ~curPixel(1, 3) && curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && ~curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && ~curPixel(2, 1) && curPixel(2, 2) && curPixel(2, 3) && ~curPixel(3, 1) && curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif ~curPixel(1, 1) && ~curPixel(1, 2) && ~curPixel(1, 3) && curPixel(2, 1) && curPixel(2, 2) && ~curPixel(2, 3) && ~curPixel(3, 1) && curPixel(3, 2) && ~curPixel(3, 3) 
                    continue;
                elseif curPixel(1, 1) && curPixel(1, 2) && curPixel(2, 1) && curPixel(2, 2)
                    continue;
                elseif curPixel(2, 2) && curPixel(2, 3) && curPixel(3, 2) && curPixel(3, 3)
                    continue;
                elseif curPixel(1, 2) && curPixel(2, 1) && curPixel(2, 2) && curPixel(2, 3)
                    continue;
                elseif curPixel(1, 2) && curPixel(2, 1) && curPixel(2, 2) && curPixel(3, 2)
                    continue;
                elseif curPixel(2, 1) && curPixel(2, 2) && curPixel(2, 3) && curPixel(3, 2)
                    continue;
                elseif curPixel(1, 2) && curPixel(2, 2) && curPixel(2, 3) && curPixel(3, 2)
                    continue;
                elseif curPixel(1, 1) && curPixel(1, 3) && curPixel(2, 2) && (curPixel(3, 1) || curPixel(3, 2) || curPixel(3, 3))
                    continue;
                elseif curPixel(1, 1) && curPixel(2, 2) && curPixel(3, 1) && (curPixel(1, 3) || curPixel(2, 3) || curPixel(3, 3))
                    continue;
                elseif curPixel(3, 1) && curPixel(2, 2) && curPixel(3, 3) && (curPixel(1, 1) || curPixel(1, 2) || curPixel(1, 3))
                    continue;
                elseif curPixel(1, 3) && curPixel(2, 2) && curPixel(3, 3) && (curPixel(1, 1) || curPixel(1, 2) || curPixel(1, 3))
                    continue;
                elseif curPixel(1, 2) && curPixel(2, 2) && curPixel(2, 3) && curPixel(3, 1) && ~curPixel(1, 3) && ~curPixel(2, 1) && ~curPixel(3, 2)
                    continue;
                elseif curPixel(1, 2) && curPixel(2, 1) && curPixel(2, 2) && curPixel(3, 3) && ~curPixel(1, 1) && ~curPixel(2, 3) && ~curPixel(3, 2)
                    continue;
                elseif curPixel(1, 3) && curPixel(2, 1) && curPixel(2, 2) && curPixel(3, 2) && ~curPixel(1, 2) && ~curPixel(2, 3) && ~curPixel(3, 1)
                    continue;
                elseif curPixel(1, 1) && curPixel(2, 2) && curPixel(2, 3) && curPixel(3, 2) && ~curPixel(1, 2) && ~curPixel(2, 1) && ~curPixel(3, 3)
                    continue;
                else
                    flag = 1;
                    P(i, j) = 1;
                end
            end
        end

        for i = 1:size(M, 1)
            for j = 1:size(M, 2)
                if P(i, j) == 1
                    binImg(i, j) = 0;
                end
            end
        end


    end

    subplot(1,2,1);
    imshow(img);
    subplot(1,2,2);
    imshow(uint8(binImg * 255));
    imwrite(uint8(binImg * 255), 'skeleton.jpg');