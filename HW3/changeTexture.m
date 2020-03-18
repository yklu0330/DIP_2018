function changeTexture(img, textMap)
    origText1 = imread('text1.jpg');
    texture1 = imcrop(origText1, [300, 0, 212, 212]);
    imwrite(texture1, 'test1.jpg');

    origText2 = imread('text2.jpg');
    texture2 = imcrop(origText2, [220, 336, 200, 200]);
    imwrite(texture2, 'test2.jpg');

    origText3 = imread('text3.jpg');
    texture3 = imcrop(origText3, [0, 0, 200, 200]);
    imwrite(texture3, 'test3.jpg');

    textSynth1 = synthesize(texture1, size(img), 21, 5);
    imwrite(uint8(textSynth1), 'textSynth1.jpg');
    textSynth2 = synthesize(texture2, size(img), 31, 11);
    imwrite(uint8(textSynth2), 'textSynth2.jpg');
    textSynth3 = synthesize(texture3, size(img), 31, 21);
    imwrite(uint8(textSynth3), 'textSynth3.jpg');

    textSynth1 = synthesize(texture1, size(img), 7, 5);
    imwrite(uint8(textSynth1), 'textSynth1-2.jpg');
%     textSynth1 = synthesize(texture1, size(img), 21, 11);
%     imwrite(uint8(textSynth1), 'textSynth1-3.jpg');
    
    

    changeText = img;
    for i = 1:size(textMap, 1)
        for j = 1:size(textMap, 2)
            if textMap(i, j) == 0
                changeText(i, j) = textSynth2(i, j);
            elseif textMap(i, j) == 128
                changeText(i, j) = textSynth3(i, j);
            else
                changeText(i, j) = textSynth1(i, j);
            end
        end
    end
    imwrite(uint8(changeText), 'changeText.jpg');
    imshow(uint8(changeText));