% function to take input an translate to centroid

function mat = translate(matrix)
    mat = matrix - mean(matrix,2);
end