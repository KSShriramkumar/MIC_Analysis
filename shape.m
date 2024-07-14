disp("Shape Analysis")

shape1 = shapes(:,:,27);
shape2 = shapes(:,:,20);

shape1_norm = normalise(translate(shape1));
shape2_norm = normalise(translate(shape2));

shape1_norm = rot_mat(ideal_rot(shape1_norm,shape2_norm)) * shape1_norm;
figure(1);
scatter(shape1_norm(1,:),shape1_norm(2,:),10,"blue");hold on;
scatter(shape2_norm(1,:),shape2_norm(2,:),10,"red");
hold off;


%cootes minimzation


z1 = translate(shape1);
z2 = translate(shape2);

for i = 1:3
    sc = scale(z2,z1,0);
    z1 = sc*z1;
   % z1 = sc(rot_mat(theta) * z1);
end 



figure(2);
scatter(z1(1,:),z1(2,:),10,"blue");hold on;
scatter(z2(1,:)*s,z2(2,:),10,"red");
hold off;



function rm = rot_mat(theta)
    rm = [cos(theta), -sin(theta);sin(theta),cos(theta)];
end

function n = normalise(matrix)
    n = matrix / sum(vecnorm(matrix));
end
function c = translate(matrix)
    c = matrix - mean(matrix,2);
end
function theta = ideal_rot(ps1, ps2)
    max = inf;
    for i = 0:(pi/360):2*pi
        
        diff = ((rot_mat(i)*ps1 ) - (ps2)); 
        normi = sum(vecnorm(diff));
        %disp(normi);
        if normi < max
            max = normi;
            theta = i;
        end
    end
end

function s = scale(z1,z2,theta)
    disp(vecnorm(z2));
    s = 2*sum((sum(z1 .* (rot_mat(theta) * z2)))/ (vecnorm(z2)));
end

