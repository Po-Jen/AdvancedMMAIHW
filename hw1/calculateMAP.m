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

% Retrieved number |A| = n (all should be considered as retrieved)
% Relevant |R| should be calculated by myself, use databaseId

% Sort the m*n distance matrix one row in a time
% Generate queryResult (m*n matrix), but the content is databaseId

%Array A (original array):
%11   9   13   10
%12   4   1    6  
%13   5   12   12 

%Array B (rearranged array):
%9   10   11   13
%1   4    6    12
%5   12   12   13

%Array C (tracking index from array A):
%2   4    1    3
%3   2    4    1
%2   3    4    1    

% [B,C] = sort(A,2);
[sortedDist, queryResult] = sort(dist,2);

% Calculate AP
m = size(queryId,1);    %120 verified
n = size(databaseId,1); %13113 verified



for queryNum=1:m
  averagePrecision=0;
  correctNum=0;  
  
  for resultNum=1:n
      if(queryId(queryNum) == databaseId(queryResult(queryNum, resultNum)))
        correctNum = correctNum+1;
        averagePrecision = averagePrecision + correctNum/resultNum;
      end
  end
  
  averagePrecision = averagePrecision/correctNum;
  meanAveragePrecision = meanAveragePrecision + averagePrecision/m;
end