function [querySR, databaseSR, D] = sparseCoding(query, database)
%% Find query and database sparse representations
% Input:    query - m*(d*p) matrix     m: number of query images
%                                      d: feature dimension for each part
%                                      p: number of parts (80 in our case)
%           database - n*(d*p) matrix  n: number of database images
% Output:   querySR - m*(k*p)          k: dictionary size
%           databaseSR - n*(k*p)
%           D - d*k*p
%              dictionaries for every parts.

%Reference:
% http://blog.sciencenet.cn/blog-261330-813357.html
% http://spams-devel.gforge.inria.fr/doc/html/index.html

% Some initial values
qPts = size(query,1);
nPts = size(database,1);
nDim = 59;
nPart = 80;
K = 100; %number of basis in dict

parD.lambda = 0.01;
parD.K = K;
parD.posD = 1;
parD.posAlpha = 1;
parD.iter = 50;
parD.verbose = 0;
parD.numThreads = 2;

parS.lambda = 0.01;
parS.K = K;
parS.pos = 1;
parS.verbose = 0;
parS.numThreads = 2;

D = zeros(nDim, K, nPart);
querySR = zeros(qPts, K*nPart);
databaseSR = zeros(nPts, K*nPart);

% Loop through each part
for i = 1:nPart
	% Concatenate the db img's i's part to feed for dictionary training
    X = zeros(nDim, nPts);
    for n=1:nPts
        X(:,n) = transpose(database(n,1+(i-1)*nDim:(i-1)*nDim+nDim));
    end
    
    %Train dictionary by using db img
    D(:,:,i) = mexTrainDL(X,parD);
    
    %Express every query by dict
    querySR(:,1+(i-1)*K:(i-1)*K+K) = transpose(mexLasso(transpose(query(:,1+(i-1)*nDim:(i-1)*nDim+nDim)), D(:,:,i), parS));
    databaseSR(:,1+(i-1)*K:(i-1)*K+K) = transpose(mexLasso(transpose(database(:,1+(i-1)*nDim:(i-1)*nDim+nDim)), D(:,:,i), parS));
end

