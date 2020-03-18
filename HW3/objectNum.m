function objectNum(img)
    label = zeros(size(img));
    nextLabel = 1;
    linked = zeros(200, 200);
    linkedIdx = 1;
    for i = 1:size(label, 1)
        for j = 1:size(label, 2)
            label(i, j) = 99;
        end
    end

    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            if img(i, j) == 255
                if label(i-1, j-1) == 99 && label(i-1, j) == 99 && label(i-1, j+1) == 99 ...
                    && label(i, j-1) == 99
                    linked(linkedIdx, 1) = nextLabel;
                    label(i, j) = nextLabel;
                    nextLabel = nextLabel + 1;
                    linkedIdx = linkedIdx + 1;
                else
                    neighbor = [label(i-1, j-1), label(i-1, j), label(i-1, j+1), label(i, j-1)];
                    smallest = min(neighbor);
                    label(i, j) = smallest;
                    [x, y] = find(linked == smallest);
                    for k = neighbor
                        if k == 99 || k == smallest
                            continue;
                        end
                        [x1, y1] = find(linked == k);
                        if y1(1) == 1
                            temp = union(linked(x, :), linked(x1, :));
                            idx = 1;
                            for p = 1:length(temp)
                                if temp(p) ~= 0
                                    linked(x, idx) = temp(p);
                                    idx = idx + 1;
                                end
                            end
                            linked(x1, :) = 0;
                        end
                    end
                end
            end
        end
    end
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            if img(i, j) == 255
                [x, y] = find(linked == label(i, j));
                label(i, j) = linked(x, 1);
            end
        end
    end
    num = length(find(linked(:, 1) ~= 0));
    disp(num);
