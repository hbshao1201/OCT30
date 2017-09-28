function TV= getTempoVector(LB)

LB;

N = size(LB,1);
[a,b] = eig(LB);

b1 = sum(b);
b2 = sort(real(b1));
TV = a(:,find(b1==b2(1)));

if TV(1)<0
    TV = - TV;
end


