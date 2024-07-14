function z = getMeanshape(shapes)
    [~,~,M] = size(shapes);
    shapes = shapes - mean(shapes,2);
    for i = 1:M
        shapes(:,:,i) = shapes(:,:,i) / sum(vecnorm(shapes(:,:,i)));
    end
    z = mean(shapes,3);
    z = z/sum(vecnorm(z));
    scatter(z(1,:),z(2,:),10,"red");
    prev_z = z;
    k = 0;
    while true
        k = k+1;
        for i = 1:M
            rot_opt = getRotate(z,shapes(:,:,i));
            shapes(:,:,i) = rot_opt * shapes(:,:,i);
            sc = getScale(z,shapes(:,:,i));
            shapes(:,:,i) =  sc * shapes(:,:,i);
        end
        prev_z = z;
        z = mean(shapes,3);
        disp(sum(vecnorm(z - prev_z)));
        if sum(vecnorm(z - prev_z)) < 0.1 || k > 100
            break;
        end
        z = z / sum(vecnorm(z));
    end
end