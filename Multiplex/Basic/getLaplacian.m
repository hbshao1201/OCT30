% function L = getlaplacian(A)
% return the Laplacian matrix of adjacency matrix A


function L = getLaplacian(A)

D = diag(sum(A,2)); 

L= D-A;

%
% sum(a,2) sums up all columns
% 
% a =
% 
%     0.8147    0.9134
%     0.9058    0.6324
%     0.1270    0.0975
%     
% sum(a,2)
% 
% ans =
% 
%     1.7281
%     1.5382
%     0.2245
    
    

