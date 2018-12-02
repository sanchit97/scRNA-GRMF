function y3 = grmf(Y,Sd,St)
%alg_grmf predicts DTIs based on the algorithm described in the following paper: 
% Ali Ezzat, Peilin Zhao, Min Wu, Xiao-Li Li and Chee-Keong Kwoh
% (2016) Drug-target interaction prediction with graph-regularized matrix factorization
%
% INPUT:
%  Y:           interaction matrix
%  Sd:          pairwise row similarities matrix
%  St:          pairwise column similarities matrix
%  test_ind:    indices of test set instances
%
% OUTPUT:
%  y3:          prediction matrix
%
    
    num_iter=500;
    p = 2;
    k=100;
    lambda_l = 0.5;
    lambda_d = 0.25;
    lambda_t = 0.15;
    K=5;
    eta=0.7;
                                  

    % preprocessing Sd & St
    % (Sparsification of matrices via p-nearest-neighbor graphs)
    Sd = preprocess_PNN(Sd,p);
    St = preprocess_PNN(St,p);
    
   
    
    disp("Preprocessing Done");

    % Laplacian Matrices
    Dd = diag(sum(Sd));
    Ld = Dd - Sd;
    Ld = (Dd^(-0.5))*Ld*(Dd^(-0.5));
    Dt = diag(sum(St));
    Lt = Dt - St;
    Lt = (Dt^(-0.5))*Lt*(Dt^(-0.5));
    disp("Lplc calculated");
    
%     Ld=load('../Data/Laplacian/Quake/Ld.');
    
    % (W)GRMF
    [A,B] = initializer(Y,k);	% initialize A & B
    disp("Initialized");
    W = ones(size(Y));          % weight matrix W
%     W(test_ind) = 0;            % set W=0 for test instances
    [A,B] = grmf_predict(Y,A,B,Ld,Lt,lambda_l,lambda_d,lambda_t,num_iter,W);    % update A & B

    % compute prediction matrix
    y3 = A*B';
    disp("Finished");

end
