% Function to get the optimal scale given a reference image. Ref is of
% dimenstion [D,N]

function s = getScale(ref,Z)
    s = sum((ref .* Z)/((vecnorm(Z)).^2));
end
