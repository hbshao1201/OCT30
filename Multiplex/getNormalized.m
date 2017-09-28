function data_normalized = getNormalized(data)

M = size(data,1);

data_max = max(data);
% data_min = min(data);

for i = 1:M
    
%     data_normalized(i,1) = (data(i) - data_min ) / (data_max - data_min );
        data_normalized(i,1) =data(i) / data_max ;
    
end