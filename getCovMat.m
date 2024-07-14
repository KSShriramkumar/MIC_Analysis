function mat = getCovMat(mean_sp,shapes)
    [D,N,M] = size(shapes);
    mean_sp = reshape(mean_sp,[D*N,1]);
    shapes = reshape(shapes,[D*N,M]);
    diff = shapes - mean_sp;
    
    diff = diff/ norm(diff);
    mat = cov(diff');
end