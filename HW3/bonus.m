function bonus(img)
    newImg = minFilter(img, 9);
    newImg2 = maxFilter(newImg, 11);
    newImg3 = medianFilter(newImg2, 7);
    % newImg4 = maxFilter(newImg3, 3);
    newImg4 = minFilter(newImg3, 3);
    newImg5 = medianFilter(newImg4, 11);
    
    imwrite(uint8(newImg), 'bonus_1.jpg');
    imwrite(uint8(newImg2), 'bonus_2.jpg');
    imwrite(uint8(newImg3), 'bonus_3.jpg');
    imwrite(uint8(newImg4), 'bonus_4.jpg');
    imwrite(uint8(newImg5), 'bonus_5.jpg');
    imwrite(uint8(img), 'img3.jpg');

    subplot(1, 2, 1);
    imshow(uint8(img));
    subplot(1, 2, 2);
    imshow(uint8(newImg5));