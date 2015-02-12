function [meanAveragePrecision] = calculateMAP(dist, queryId, databaseId)
% Calculate mean average precision using parwise distance matrix
% Input:    dist - m*n matrix  m: number of query images
%                           n: number of database images
%           queryId - m*1 vector
%              query identity, same value means same identity
%           databaseId - n*1 vector
%              database identity, same value means same identity
% Output:   meanAveragePrecsion - scalar, result MAP

meanAveragePrecision = 0;

% Your code here
