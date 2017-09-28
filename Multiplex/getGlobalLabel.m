function  h = getGlobalLabel(k,i,N)

% kth layer
% ith agent in kth layer
% N agents in each layer
for j = 1:length(k)
    h(j) =(k(j)-1)*N+i(j);
end