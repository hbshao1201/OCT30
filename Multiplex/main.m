% control performance of multiplex consensus networks
% we show the smallest eigenvalue of L_B depends only on
% the proportion of leaders in the consensus network 
% - HOMOGENEOUS -


%% initialization 

clear; clc; close;

M = 2; % number of layers - FIXED TWO-LAYERS

N = 50; % number of nodes in each layer

S = 33; % number of sampling network

type_intra_network = 1; % 1 - random; 2 - scale-free.

% set of proportion %# can be more dense 0.1:0.05:1
q_set = [0.1:0.01:1];


%% do stochastics
for n_q =1: length(q_set)
    
    % sampling
    for n_s = 1:S
    
        
    %% edge occurrence probability p

    % homogeneous p in random graph
    p = rand*ones(1,M);
    while min(p)<0.1
        p = rand*ones(1,M);
    end
    % heterogeneous p in random graph
%     p = rand(1,M);
%     while min(p)<0.1
%     p = rand*ones(1,M);
%     end


    %% intra-layer networks
    for i = 1:M

        % random networks
        if type_intra_network == 1    
            Adj{i} = randomGraph(N,p(i));
            while ~isConnected(Adj{i})
                Adj{i} = randomGraph(N,p);
            end
        end

        %%
        % scale-free   networks
        if type_intra_network == 2              
            seed =[0 1 0 0 1;1 0 0 1 0;0 0 0 1 0;0 1 1 0 0;1 0 0 0 0];
            Adj{i} = SFNG(N, 1, seed);            
            while ~isConnected(Adj{i}) 
                Adj{i} = SFNG(N, 1, seed);           
            end
        end

        L{i} = laplacianMatrix(Adj{i});


    end


    %% intra-layer Adjacency (fixed in this work)

    if M == 2
         Adj_intra = diagmx(Adj{1},Adj{2});
    else
        Adj_intra = diagmx(Adj{1},Adj{2});
        for i = 3:M
            Adj_intra = diagmx(Adj_intra,Adj{i});
        end
    end

    % intra-layer Laplacian

    if M == 2
        L_intra = diagmx(L{1},L{2});
    else
        L_intra = diagmx(L{1},L{2});
        for i = 3:M
            L_intra = diagmx(L_intra,L{i});
        end
    end



    % weight for inter-layer interaction 
    Dx = 1;

    % inter-layer Adjacency
    Adj_inter = Dx*getAdjMatrix(1,M);

    % p = 0.3;
    % Adj = randomGraph(M,p);
    % while ~isConnected(Adj)
    %     Adj = randomGraph(M,p);
    % end
    % Adj_inter = Dx*Adj;

    % inter-layer Laplacian
    L_inter = kron(laplacianMatrix(Adj_inter),eye(N));

    % supra Adjacency
    Adj_supra = kron(Adj_inter,eye(N)) + Adj_intra;

    % supra Laplacian
    L_supra = L_intra + L_inter;


    %% leader set 
    % proportion of number of leaders
    
    q = q_set(n_q);
    
    N_q = round(N*q);
    leader_layer = [1*ones(1,N_q)];
    leader_agent  = [1:(N_q)];
    l_set = getGlobalLabel(leader_layer,leader_agent,N);


    %% influncing matrix
    B = getInputMatrix(M*N,l_set);
    L_supra = laplacianMatrix(Adj_supra);

    % perturbed Laplacian
    LB = (L_supra+B);    


    %% recod results 
    q_versus_lambda1(n_s,n_q) = min(eig(LB));
    
    end
        
end


%% generate figure
figure
plot(1:length(q_set),q_versus_lambda1)
mean_data = mean(q_versus_lambda1)
min_data = min(q_versus_lambda1)
max_data = max(q_versus_lambda1)
errorbar(q_set ,mean_data, mean_data - min_data, max_data - mean_data,'-s'); hold on
xlabel('$q$','interpreter','Latex','FontSize',15)
ylabel('$\lambda_1$','interpreter','Latex','FontSize',15)
x_axis_ricks = [0.1:0.1:1];
xticks(x_axis_ricks);
xticklabels(string(x_axis_ricks));
