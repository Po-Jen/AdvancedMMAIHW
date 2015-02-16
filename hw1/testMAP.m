m = 2;    %120 verified
n = 10; %13113 verified
meanAveragePrecision =0;

queryId = [1 2];
databaseId = [1 1 1 1 1 2 2 2 3 3];
queryResult = [ 1 6 2 7 8 3 9 10 4 5;
                1 6 2 3 7 4 8 5 9 10];

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
  averagePrecision
  meanAveragePrecision = meanAveragePrecision + averagePrecision/m;
end

meanAveragePrecision