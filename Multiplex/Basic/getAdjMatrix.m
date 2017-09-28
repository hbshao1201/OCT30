% function [AdjMatrix,graph_type] = getAdjMatrix(s,N)
% return the adjacency matrix of graph s with N nodes

function [AdjMatrix,graph_type] = getAdjMatrix(s,N)


        if s == 191
            % adjacent matrix - example graph in CDC 14 G1
            AdjMatrix = zeros(N); 
            AdjMatrix(1,2) = 1; 
            AdjMatrix(1,3) = 1; 
            AdjMatrix(2,3) = 1; 
            AdjMatrix(3,4) = 1; 
            AdjMatrix(4,5) = 1; 

            AdjMatrix = AdjMatrix + AdjMatrix';
            
            graph_type = 'CDC14 G1 ';
        end

        
        if s == 192
            % adjacent matrix - example graph in CDC 14 G2
            AdjMatrix = zeros(N); 
            AdjMatrix(1,2) = 1; 
            AdjMatrix(2,3) = 1; 
            AdjMatrix(3,5) = 1; 
            AdjMatrix(2,5) = 1; 
            AdjMatrix(1,3) = 1; 
            AdjMatrix(1,5) = 1; 
            AdjMatrix(1,4) = 1; 
            AdjMatrix(5,4) = 1; 
            
            AdjMatrix = AdjMatrix + AdjMatrix';
            
            graph_type = 'CDC14 G2 ';
        end
        
        if s == 0
            % adjacent matrix - example graph in ACC 14
            AdjMatrix = zeros(N); 
            AdjMatrix(1,2) = 1; 
            AdjMatrix(1,4) = 1;
            AdjMatrix(2,3) = 1; 
            AdjMatrix(2,4) = 1;            
            AdjMatrix(4,5) = 1; 
            AdjMatrix(4,6) = 1;
            AdjMatrix = AdjMatrix + AdjMatrix';
            
            graph_type = 'Example graph';
        end

        if s == 1
            % adjacent matrix - chain graph
            AdjMatrix = diag(ones(N-1,1),1) + diag(ones(N-1,1),-1) ; 
            graph_type = 'chain graph';
        end

        
        if s == 2
            % adjacent matrix - star graph
            AdjMatrix = zeros(N); 
            AdjMatrix(1,2:N) = ones(1,N-1); 
            AdjMatrix(2:N,1) = ones(N-1,1);
            graph_type = 'star graph';
        end

        if s == 3
            % % adjacent matrix - cycle graph
            AdjMatrix = diag(ones(N-1,1),1) + diag(ones(N-1,1),-1) ; 
            AdjMatrix(1,N) = 1; AdjMatrix(N,1) = 1; 
            graph_type = 'cycle graph';
        end

        if s == 4
            % adjacent matrix - completely connected
            AdjMatrix = ones(N) - eye(N);
            graph_type = 'complete graph';
        end
        
        % Example for symmetry and two-layer network
         if s == 5

            graph_type = '8 node two-layer graph';
            AdjMatrix = zeros(9);

            AdjMatrix(1,2) = 1;
            AdjMatrix(1,4) = 1;
            AdjMatrix(2,3) = 1;
            AdjMatrix(3,4) = 1;                        
            AdjMatrix(4,5) = 1;    
            AdjMatrix(5,6) = 1;
            AdjMatrix(5,8) = 1;
            AdjMatrix(6,7) = 1;
            AdjMatrix(7,8) = 1;
            AdjMatrix(9,4) = 1;
            AdjMatrix(9,5) = 1;

            AdjMatrix = AdjMatrix + AdjMatrix';

         end             
        
        
        if s == 9
            
            AdjMatrix(1,2) = 1;  AdjMatrix(2,1) = 1; 
            AdjMatrix(2,3) = 1; AdjMatrix(3,2) = 1; 
            AdjMatrix(3,4) = 1; AdjMatrix(4,3) = 1; 
            AdjMatrix(4,5) = 1; AdjMatrix(5,4) = 1; 
            AdjMatrix(5,6) = 1; AdjMatrix(6,5) = 1; 
            AdjMatrix(6,7) = 1; AdjMatrix(7,6) = 1; 
            AdjMatrix(7,8) = 1; AdjMatrix(8,7) = 1; 
            AdjMatrix(8,9) = 1; AdjMatrix(9,8) = 1; 
            
            AdjMatrix(9,10) = 1;  AdjMatrix(10,9) = 1; 
            AdjMatrix(10,11) = 1; AdjMatrix(11,10) = 1; 
            AdjMatrix(11,12) = 1; AdjMatrix(12,11) = 1; 
            AdjMatrix(12,13) = 1; AdjMatrix(13,12) = 1; 
            
            AdjMatrix(13,14) = 1; AdjMatrix(14,13) = 1; 
            AdjMatrix(14,15) = 1; AdjMatrix(15,14) = 1; 
            AdjMatrix(15,16) = 1; AdjMatrix(16,15) = 1; 
            
            AdjMatrix(1,8) = 1;  AdjMatrix(8,1) = 1;           
            AdjMatrix(2,7) = 1; AdjMatrix(7,2) = 1; 
            AdjMatrix(3,6) = 1; AdjMatrix(6,3) = 1; 
            
            AdjMatrix(5,12) = 1; AdjMatrix(12,5) = 1; 
            AdjMatrix(6,11) = 1; AdjMatrix(11,6) = 1; 
            AdjMatrix(7,10) = 1; AdjMatrix(10,7) = 1; 
            

            AdjMatrix(11,14) = 1; AdjMatrix(14,11) = 1; 
            AdjMatrix(15,10) = 1; AdjMatrix(10,15) = 1;  
            AdjMatrix(16,9) = 1; AdjMatrix(9,16) = 1; 
            
            
            graph_type = 'Lattice - 16 nodes ';

        end
        
        if s == 11
        
            load zachary.txt;
            AdjMatrix = zachary;
        
        end
        
        if s == 112
        
            load zachary-weighted.txt;
            AdjMatrix = zachary_weighted;
        
        end
        
        if s == 12
            AdjMatrix = diag(ones(7-1,1),1) + diag(ones(7-1,1),-1) ; 
            AdjMatrix(6,7) = 0; AdjMatrix(7,6) = 0;
            AdjMatrix(3,7) = 1; AdjMatrix(7,3) = 1;           
            graph_type = ' 7 node graph';
        
        end
        
        if s == 122
            AdjMatrix = diag(ones(8-1,1),1) + diag(ones(8-1,1),-1) ; 
            AdjMatrix(7,8) = 0; AdjMatrix(8,7) = 0;
            AdjMatrix(3,8) = 1; AdjMatrix(8,3) = 1;           
            graph_type = ' 8 node graph';
        
        end        
        
         if s == 13    
            % For state-dependent graph
            r = 0.8;
            x0=rand(N,2); % comment this line if using the x0 of last time
            AdjMatrix  = getAdjMatrixByState(x0,r); 
         end
    
        if s == 91
            AdjMatrix = zeros(9);
            AdjMatrix(1,2) = 1;  
            AdjMatrix(2,3) = 1; 
            AdjMatrix(3,4) = 1; 
            AdjMatrix(4,5) = 1; 
            AdjMatrix(5,6) = 1; 
            AdjMatrix(6,7) = 1; 
            AdjMatrix(7,8) = 1;  
            AdjMatrix(8,9) = 1;  

            AdjMatrix(1,6) = 1; 
            AdjMatrix(2,5) = 1; 
            AdjMatrix(3,4) = 1;  
            
            AdjMatrix(6,7) = 1; 
            AdjMatrix(5,8) = 1; 
            AdjMatrix(4,9) = 1;              
              
            AdjMatrix = AdjMatrix + AdjMatrix';
            
            graph_type = 'Lattice - 9 nodes ';

        end
        
        
       
         if s == 10
            % adjacent matrix - tree graph in Fu Lin's work
            graph_type = 'tree graph ';
            AdjMatrix = zeros(N);
            AdjMatrix(3,1) = 1;
            AdjMatrix(3,2) = 1;
            AdjMatrix(3,8) = 1;
            AdjMatrix(8,9) = 1;
            AdjMatrix(9,10) = 1;
            AdjMatrix(9,11) = 1;
            AdjMatrix(7,8) = 1;
            AdjMatrix(7,4) = 1;
            AdjMatrix(7,5) = 1;
            AdjMatrix(7,6) = 1;
            AdjMatrix(8,13) = 1;
            AdjMatrix(13,12) = 1;
            AdjMatrix(13,14) = 1;
            AdjMatrix(13,15) = 1;
            AdjMatrix(15,16) = 1;
            AdjMatrix(16,17) = 1;
            AdjMatrix(16,18) = 1;
            AdjMatrix(15,19) = 1;
            AdjMatrix(19,20) = 1;
            AdjMatrix(19,21) = 1;
            AdjMatrix(21,25) = 1;
            AdjMatrix(25,22) = 1;
            AdjMatrix(25,23) = 1;
            AdjMatrix(25,24) = 1;                        
            
            AdjMatrix = AdjMatrix + AdjMatrix';

         end  
         
         

            
         