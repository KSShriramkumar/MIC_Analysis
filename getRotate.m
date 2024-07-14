
% Funtion to get the rotation for Z with reference to matrix ref.
% Dimensions are D*N where N is number of points in point set
function Rot = getRotate(ref, Z)
    [D, N, ~] = size(ref);

    w = eye(N);

    y = transpose(ref);
    x = Z;
    %disp(size(w));
    %disp(size(x));
    %disp(size(y));
    [U, ~, V] = svd((x * w )* y);

    Rot = V * U';

    if(det(Rot) < 0)
        w(D,D) = -1;
        Rot = V * w * U';
    end

end