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

% Retrieved number |A| = n (all should be considered as retrieved)
% Relevant |R| should be calculated by myself, use databaseId

% Sort the m*n distance matrix one row in a time

% Generate queryResult (m*n matrix), but the content is databaseId

% Calculate AP
averagePrecision = 0;
correctNum=0;

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
  meanAveragePrecision = meanAveragePrecision + averagePrecision;
end

meanAveragePrecision = meanAveragePrecision/m;
