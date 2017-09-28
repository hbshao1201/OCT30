function v2 = getV2Measure(N,k,m0,n0)

% [m0 n0] = eig(L)
% k th eigenvalue

n0 = sort(sum(n0));

t2 = [k];

for i = k+1:N
    
    if abs(n0(i)-n0(k))<10e-5
        t2 = [t2 i];
    end
    
end

T = m0(:,t2);

for i =1:N    
    v2(i,1) = norm(T(i,:));    
end