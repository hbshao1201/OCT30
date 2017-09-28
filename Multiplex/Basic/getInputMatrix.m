% function B = getInputMatrix(N,l)
% the dimension of input is q = length(l)
% return a N*q input matrix
% to calculate the diagonal matrix, simply uses B*B'

function B = getInputMatrix(N,l)

B = zeros(N,length(l));

for i = 1:length(l)
    B(l(i),i) = 1;
end