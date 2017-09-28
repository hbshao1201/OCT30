% Return a N*q input matrix
% the dimension of input is q = length(l)
% to calculate the diagonal matrix, simply uses B*B'

function B = getInputMatrix(N,l_set)

B = zeros(N);
 

if length(l_set) ~= 0
    
    for i = 1:length(l_set)
        B(l_set(i),l_set(i)) = 1;
    end
    
end