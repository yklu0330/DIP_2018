function [newImg] = synthesize(img, outputSize, tilesize, overlap)
    img = double(img);

    newImg = zeros(outputSize);
    inputSize = size(img);

    temp = ones([overlap tilesize]);
    errtop = xcorr2(img .^ 2, temp);
    temp = ones([tilesize overlap]);
    errside = xcorr2(img .^ 2, temp);
    temp = ones([tilesize-overlap overlap]);
    errsidesmall = xcorr2(img .^ 2, temp);

    for i = 1:tilesize-overlap:outputSize(1)-tilesize+1
        for j = 1:tilesize-overlap:outputSize(2)-tilesize+1

            if (i > 1) && (j > 1) % overlap at vertical side and horizontal side
                % extract top shared region
                shared = newImg(i:i+overlap-1, j:j+tilesize-1);
                err = errtop - 2 * xcorr2(img, shared) + sum(shared(:) .^ 2);

                % trim invalid data at edges, and off bottom where we don't want
                % tiles to go over the edge
                err = err(overlap:end-tilesize+1, tilesize:end-tilesize+1);

                % extract left shared region, skipping bit already checked
                shared = newImg(i+overlap:i+tilesize-1, j:j+overlap-1);
                err2 = errsidesmall - 2 * xcorr2(img, shared) + sum(shared(:) .^ 2);
                % sum(shared(:).^2); trim invalid data at edges, and where we
                % don't want tiles to go over the edges
                err = err + err2(tilesize:end-tilesize+overlap+1, overlap:end-tilesize+1);

                [ibest, jbest] = find(err <= 1.1 * 1.1 * min(err(:)));
                c = ceil(rand * length(ibest));
                pos = [ibest(c) jbest(c)];

            elseif i > 1 % overlap at vertical side
                shared = newImg(i:i+overlap-1, j:j+tilesize-1);
                err = errtop - 2 * xcorr2(img, shared) + sum(shared(:) .^ 2);

                % trim invalid data at edges
                err = err(overlap:end-tilesize+1, tilesize:end-tilesize+1);

                [ibest, jbest] = find(err <= 1.1 * 1.1 * min(err(:)));
                c = ceil(rand * length(ibest));
                pos = [ibest(c) jbest(c)];
            elseif j > 1 % overlap at horizontal side
                shared = newImg(i:i+tilesize-1, j:j+overlap-1);
                err = errside - 2 * xcorr2(img, shared) + sum(shared(:).^2);

                % trim invalid data at edges
                err = err(tilesize:end-tilesize+1, overlap:end-tilesize+1);

                [ibest, jbest] = find(err <= 1.1 * 1.1 * min(err(:)));
                c = ceil(rand * length(ibest));
                pos = [ibest(c) jbest(c)];
            else
                pos = ceil(rand([1 2]) .* (inputSize-tilesize+1));
            end

            newImg(i:i+tilesize-1, j:j+tilesize-1) = img(pos(1):pos(1)+tilesize-1, pos(2):pos(2)+tilesize-1);
        end
    end