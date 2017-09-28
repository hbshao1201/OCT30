function r = getRelativeTempoData(x,v1,v2,norm_flag) 

% x - m rows n columns 
%  length(x) = MAX(SIZE(X))

for i=1:length(x)-1
    r(i) = norm(x(i+1,v1)-x(i,v1),norm_flag)/norm(x(i+1,v2)-x(i,v2),norm_flag);
end