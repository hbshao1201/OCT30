% function Adj = getCartesianProductAdj(A1,A2)
% return the Adjacency matrix of graph product 
% to obtain Laplacian matrix, simply use 
% getLaplacian(getCartesianProductAdj(A1,A2))

function Adj = getCartesianProductAdj(A1,A2)

N1 = size(A1,1);
N2 = size(A2,1);
N = N1*N2;  

Adj = kron(A1,eye(N2)) + kron(eye(N1),A2);