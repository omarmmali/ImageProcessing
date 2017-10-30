function [end_points, short_ridges] = ExtractLandmarks(input_image, ridge_length)
    
    [H, W] = size(input_image);
    input_image = ~imbinarize(input_image);
    BW = bwmorph(input_image, 'thin', inf);
    end_points = [1; 1];
    short_ridges = [1; 1];
    pic = ones(H, W, 3);
    
    for y = 1:H
        for x = 1:W
            
            color = BW(y, x);
            if color == 1
                number_of_black_neighbors = 0;
                for j = -1 : 1
                    if (1 <= y + j) && (y + j <= H)
                        for i = -1 : 1
                            if (i == 0 && j == 0)
                                continue;
                            elseif (1 <= x + i) && (x + i <= W)
                                current_neighbor_color = BW(y + j, x + i);
                                if current_neighbor_color == 1
                                    number_of_black_neighbors = number_of_black_neighbors + 1;
                                end
                            end
                        end
                    end
                end
                if (number_of_black_neighbors == 1)
                    end_points = [end_points, [y; x]];
                    pic(y, x, :) = [255, 0, 0];
                else
                    pic(y, x, :) = ~(input_image(y, x));
                end
            end
            
        end
    end
    
    [Q, N] = size(end_points);
    end_points = end_points(:, 2:N, :);
    
    for p = 1 : N - 1
        vis = zeros(H,W);
        queue = [];
        queue = [end_points(:,p) queue];
        found_bifurication = 0;
        path = [];
        while(~isempty(queue))
            cur_point = queue(:,1);
            vis(cur_point(1), cur_point(2)) = 1;
            queue = queue(:,2:end);
            path = [path [cur_point(1); cur_point(2)]];
            number_of_black_neighbors = 0;
            for j = -1 : 1
                if (1 <= cur_point(1) + j) && (cur_point(1) + j <= H)
                    for i = -1 : 1
                        if (i == 0 && j == 0)
                            continue;
                        elseif (1 <= cur_point(2) + i) && (cur_point(2) + i <= W)
                            current_neighbor_color = BW(cur_point(1) + j, cur_point(2) + i);
                            if current_neighbor_color == 1 && ~vis(cur_point(1) + j, cur_point(2) + i) == 0
                                number_of_black_neighbors = number_of_black_neighbors + 1;
                            end
                        end
                    end
                end
            end
            if number_of_black_neighbors <= 1
                for j = -1 : 1
                    if (1 <= cur_point(1) + j) && (cur_point(1) + j <= H)
                        for i = -1 : 1
                            if (i == 0 && j == 0)
                                continue;
                            elseif (1 <= cur_point(2) + i) && (cur_point(2) + i <= W)
                                current_neighbor_color = BW(cur_point(1) + j, cur_point(2) + i);
                                if current_neighbor_color == 1 && vis(cur_point(1) + j, cur_point(2) + i) == 0
                                    queue = [queue [cur_point(1) + j; cur_point(2) + i]];
                                end
                            end
                        end
                    end
                end
            else 
                found_bifurication = 1;
                break;
            end
        end
        [Q, M] = size(path);
        if M <= ridge_length && ~found_bifurication
            for i = 1 : M
                tmp = path(:,i);
                pic(tmp(1), tmp(2), :) = [0, 0, 255];
                short_ridges = [short_ridges tmp];
            end
        end
    end
    imshow(pic);
end