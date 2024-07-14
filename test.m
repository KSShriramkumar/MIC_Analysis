e2 = shapes(:,:,22);
e1 = shapes(:,:,20);

e1 = translate(e1);
e2 = translate(e2);

figure(3);

scatter(e1(1,:),e1(2,:),10,'red');hold on;
scatter(e2(1,:),e2(2,:),10,'blue');hold off;
% Fit e1 to e2


R = getRotate(e2,e1);
e1 = R*e1;
s = getScale(e2,e1);
e1 = s*e1;
mean_sp= getMeanshape(shapes);
cov_mat = getCovMat(mean_sp,shapes); 


[V,D] = eig(cov_mat);
eigenvalues = diag(D);
[sorted_val,idx] = sort(eigenvalues,'descend');

V_sorted = V(:,idx);


i = 2;
Primary_shape = reshape(V_sorted(:,i),[2,56]);
Primary_val = sorted_val(i)*1;
connections = [1:55;2:56];


mean_sp = mean_sp;
figure(3);
scatter(e1(1,:),e1(2,:),10,'red');hold on;
scatter(e2(1,:),e2(2,:),10,'blue');hold off;

figure(3);

%plot(mean_sp(1,:), mean_sp(2,:), 'o', 'MarkerFaceColor', 'r');  % Plot points
plot(mean_sp(1,connections)', mean_sp(2,connections)', 'r-');  % Plot connections



figure(4);

mean_sp = mean_sp + sqrt(3)*sqrt(Primary_val)*Primary_shape;
%plot(mean_sp(1,:), mean_sp(2,:), 'o', 'MarkerFaceColor', 'b');  % Plot points
plot(mean_sp(1,connections)', mean_sp(2,connections)', 'b-');  % Plot connections



figure(5);

mean_sp = mean_sp - 2*sqrt(3)*sqrt(Primary_val)*Primary_shape;
%plot(mean_sp(1,:), mean_sp(2,:), 'o', 'MarkerFaceColor', 'g');  % Plot points
plot(mean_sp(1,connections)', mean_sp(2,connections)', 'g-');  % Plot connections


%scatter(mean_sp(1,:) + 0.01*Primary_shape(1,:),mean_sp(2,:)+0.01*Primary_shape(1,:),10,'green');hold on;
%scatter(mean_sp(1,:) - 0.01*Primary_shape(1,:),mean_sp(2,:)-0.01*Primary_shape(1,:),10,'blue');hold on;
