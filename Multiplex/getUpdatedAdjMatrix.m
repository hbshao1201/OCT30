function Au= getUpdatedAdjMatrix(TV,Adj,flag)

% Au - core structure deduced from H matrix

N = length(TV);
Au = Adj;

for i = 1:N
    for j=1:N
        if flag == 1            
            
           if  TV(i)/TV(j) >= 1
               Au(i,j) = Adj(i,j);
           else
               Au(i,j) = 0;
           end      
           
        elseif flag == 2
            
            if  TV(i)/TV(j) <= 1
               Au(i,j) = Adj(i,j);
           else
               Au(i,j) = 0;
           end
        end

    end 
end
