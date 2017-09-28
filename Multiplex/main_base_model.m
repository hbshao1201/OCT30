clear; clc; close all;


% control performance of multiplex consensus networks
M = 2; % number of layers - FIXED TWO-LAYERS

N = 50; % number of nodes in each layer


type_intra_network = 1; % 1 - random; 2 - scale-free.



%%  edge occurrence probability p

% homogeneous p in random graph
p = rand*ones(1,M);
while min(p)<0.2
    p = rand*ones(1,M);
end
% heterogeneous p in random graph
%p = rand(1,M);

for i = 1:M
 
    
%% Intra-layer networks


% random networks
if type_intra_network == 1    
    Adj{i} = randomGraph(N,p(i));
    while ~isConnected(Adj{i})
        Adj{i} = randomGraph(N,p);
    end
end


% scale-free   networks
% if type_intra_network == 2              
%     seed =[0 1 0 0 1;1 0 0 1 0;0 0 0 1 0;0 1 1 0 0;1 0 0 0 0];
%     Adj{i} = SFNG(N, 1, seed);            
%     while ~isConnected(Adj{i}) 
%         Adj{i} = SFNG(N, 1, seed);           
%     end
% end
    
    
    
L{i} = laplacianMatrix(Adj{i});
 

end

% intra-layer Adjacency

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

L_intra;

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
q = 0.1;
N_q = round(N*q)
leader_layer = [1*ones(1,N_q)]
leader_agent  = [1:(N_q)]
l_set = getGlobalLabel(leader_layer,leader_agent,N)

% leader_layer = []
% leader_agent  = []
% l_set = [];


% intialize input vector
u0 = 0.95;
u = zeros(M*N,1);
u(l_set,1) = u0*ones(length(l_set),1);
u

% influnce matrix
B = getInputMatrix(M*N,l_set);

L_supra = laplacianMatrix(Adj_supra);

% perturbed Laplacian
LB = (L_supra+B);


sort(eig(LB),'descend');

% disp('connectivity  of intra-layer networks')
% isConnected(Adj{1})
% isConnected(Adj{2})


% B1 = getInputMatrix(M,leader_layer)
% A1 = -(laplacianMatrix(Adj_inter) + B1)
% u1 = zeros(M,1);
% u1(leader_layer,1) = u0*ones(length(leader_layer),1);
% TV1= getTempoVector(-A1)


%% 
% close all
% figure;
% set(gcf,'Position',[0 620 600 550]);
% 
% subplot(2,2,1)
% G_1 = graph(Adj{1});
% plot(G_1,'Layout','force')
% title('G_1')
% 
% subplot(2,2,2)
% 
% G_2 = graph(Adj{2});
% plot(G_2,'Layout','force')
% title('G_2')
% 
% subplot(2,2,3)
% G_inter = graph(Adj_inter);
% plot(G_inter,'Layout','force')
% title('inter-layer')
% 
% subplot(2,2,4)
% G = graph(Adj_supra);
% 
% % xdata_layer1 = [0 0.5 2 3 3.5];
% % ydata_layer1 = [0 1.5 -2 1 3];
% % nLabels = {'1','2','3','4','5','1^{2}','2^{2}','3^{2}','4^{2}','5^{2}'};
% 
% xdata_layer1 = rand(1,N);
% ydata_layer1 = rand(1,N);
% 
% layer_offset = 3;
% 
% xdata_layer2 = xdata_layer1;
% ydata_layer2 = ydata_layer1 + layer_offset ;
% 
% xdata = [xdata_layer1 xdata_layer2];
% ydata = [ydata_layer1 ydata_layer2];
% 
% 
% % g = plot(G,'XData',xdata,'YData',ydata,'NodeLabel',nLabels);
% g = plot(G,'XData',xdata,'YData',ydata);
% 
% hold on; plot(xdata_layer1, ydata_layer1, 'r.','MarkerSize',20)
% hold on; plot(xdata_layer2, ydata_layer2, 'b.','MarkerSize',20)
% 
% title('multiplex')



%% display

p
q
min(eig(LB))


