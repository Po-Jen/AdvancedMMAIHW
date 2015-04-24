function distance = l2Distance(X1, X2)
% Compute pairwise L2 distance between two matrix
% Input: X1 - m*d matrix   m: number of images in query
%                          d: feature dimension
%        X2 - n*d matrix   n: number of images in database
% Output: distance - m*n matrix

distance = zeros(size(X1,1), size(X2,1));

% Your code here

for q_row=1:size(X1,1)
	for d_row=1:size(X2,1)
		inner_product = 0;
		%q_norm = 0;
		%d_norm = 0;

		for dim=1:size(X1,2)
			inner_product = inner_product + (X1(q_row, dim)-X2(d_row, dim))^2;
		end
		
		distance(q_row, d_row) = sqrt(inner_product);
	end
end
