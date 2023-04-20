
prob_dist=[0.1,0.3,0.05,0.09,0.21,0.25];
prob_dist_sorted_descend=sort(prob_dist,'descend');

zero_one = ['0'; '1']; 

M = length(prob_dist_sorted_descend);  

N = M-1; 

prob_dist_sorted_descend =prob_dist_sorted_descend(:); % Making PiHuff a column vector

Huff = {zero_one(1),zero_one(2)};

if M > 2

  Prob(:,1) = prob_dist_sorted_descend;

  for j = 1:N

     % Sorting again in descending order since the order gets changed            

     % before this process

     [Prob(1:M-j+1,j),order(1:M-j+1,j)]=sort(Prob(1:M-j+1,j),1,'descend'); 

     if j == 1 

        ord0 = order; 

     end  % Original descending order

     if M-j>1 

        Prob(1:M-j,j+1) = [Prob(1:M-1-j,j); 

        sum(Prob(M-j:M-j+1,j))]; 

     end

  end

  

  % Sorting the code and assigning 0 and 1

  for j = N:-1:2

      tempVar = N-j+2; 

      oi = order(1:tempVar,j);

     for i = 1:tempVar 

         Huff1{oi(i)}  = Huff{i}; 

     end

     Huff = Huff1;   

     Huff{tempVar+1} = Huff{tempVar};

     Huff{tempVar}   = [Huff{tempVar} zero_one(1)]; 

     Huff{tempVar+1} = [Huff{tempVar+1} zero_one(2)];

  end

  for i = 1:length(ord0)

      Huff1{ord0(i)} = Huff{i}; 

  end

  Huff = Huff1;

end

fprintf('\n');

fprintf('The Huffman Code is: %f\n');

fprintf('\n');

fprintf('\n');

disp(Huff')