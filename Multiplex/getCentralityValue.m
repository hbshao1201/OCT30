%
% Return centrality value for all nodes
% Adj - adjacency matrix
% flag_centrality =   1(EoA) 
%                     2(\lambda_1(L+BB')) 
%                     3(Kirchhoff) 
%                     4(Fiedler vector absolute value)
% dependency: getLaplacian.m
%             getV2Measure.m

function CentralityValue = getCentralityValue(Adj,flag_centrality)

N = size(Adj,1);

L = getLaplacian(Adj);
       
for i = 1:N

    M = zeros(N); 
    M(i,i) = 1;

    [a b] = eig(L+M);

    if flag_centrality == 1
        
        CentralityValue(i,1) = abs(a(find(diag(M)==1),1));    % EoA eigenvector entry
        
    elseif flag_centrality == 2       
        
        CentralityValue(i,1) = min(sum(b)); % smallest eigenvalue of L+BB'
        
    elseif flag_centrality == 3
        
        CentralityValue(i,1) = sum(1./sum(b)); % use Kirchhoff Index
               
    end


end


% use Fielder vector entry
if flag_centrality == 4

    [m0 n0] = eig(L);
    k = 2; % using 
    CentralityValue = getV2Measure(N,k,m0,n0); 
        
end



        
