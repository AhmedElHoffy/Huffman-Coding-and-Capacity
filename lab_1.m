%% Ahmed Ismail El Hoofy 016152095
% lab #1
% Problem #1
clc;
clear;
I=zeros(1,6); % Information Array of 6 elements
P=[0.1,0.3,0.05,0.09,0.21,0.25]; % Probabilities array 

H=0;
%% Information values
for i=1:6
 I(i)=log2(1/P(i)); %Information From Ith Message
end
%% a)-Entropy
for i=1:6
H=H+(P(i)*I(i)); %Total Entropy of all messages which is sum the multiplication of the
                 % msgs probabillities with the info.
end

%% b)- Huffman code and code tree
format short;
prob_dist=[0.1,0.3,0.05,0.09,0.21,0.25];   % probabilites of the sources
prob_dist_sorted=sort(prob_dist,'ascend'); % arranging the probabilities in ascending order 
prob_dist_sorted_descend=sort(prob_dist,'descend'); %arranging the probabilities in descending order
Root=1; %Total Probability of occurences = 1 
parent=libpointer; LChild=libpointer; RChild=libpointer; % Assigning pointers for parents, Lchilds and Rchilds of the tree
LChilds_array=[]; LChilds_Counts=0; % Array of Lchilds Elements  Note:- LChilds < Rchilds
RChilds_array=[]; RChilds_Counts=0; % Array of Rchilds Elements  
Parents_array=[]; parents_Counts=0; % Array of Parents Elements
Huffman_Tree= zeros(6,5);           % Creating the Huffman Tree
Huffman_Tree(:,1)= sort(prob_dist_sorted','descend');  % plugging the sources probs'  in the Huffman array 1st coloumn
col=1;
for i=1:length(prob_dist_sorted)-1  % redoing the process by n-1 times which n: number of elements in the prob arreay
  Lchild=prob_dist_sorted(1);  % plugging the smallest prob in the Lchild array
  LChilds_array(LChilds_Counts+1)=Lchild; LChilds_Counts=LChilds_Counts+1; % increasing the size of the dynamic Lchild array
  prob_dist_sorted=prob_dist_sorted(2:end); % deleting the 1st element of the prob. array which is the smallest that is plugged in Lchild array
  
  Rchild=prob_dist_sorted(1);   % Repeating the same steps but this time plugging the newest small prob in Rchil array which has values > lchild array
  RChilds_array(RChilds_Counts+1)=Rchild; RChilds_Counts=RChilds_Counts+1; % increasing the size of the dynamic Rchild array
  prob_dist_sorted=prob_dist_sorted(2:end);  % deleting the 1st element of the new prob. array which is the smallest that is plugged in Rchild array
  
  Parent=Lchild+Rchild;  % inititalizng a new parent which is the summation of the past two values plugged in Lchild array and Rchild array respectively
  Parents_array(parents_Counts+1)=Parent; parents_Counts=parents_Counts+1; % increasing the size of the dynamic Parent array
  
  % tree diagram algorithm
  prob_dist_sorted=[Parent,prob_dist_sorted]; %plugging the new value "Parent" in the prob array
  
  if (any(prob_dist_sorted(1:end)<=Parent) )   % resorting the prob array in case of the new value is higher than any previous ones in the prob array
   prob_dist_sorted=sort(prob_dist_sorted,'ascend');
  end
  
  %%huffmanu tree
  weight=size( prob_dist_sorted,2) ;  % plugging the edited prob array in the huffman_tree matrix 
  temp_array=prob_dist_sorted';       % by transposing the array values each counter time and plugging them into the current matrix's coloumn
  temp_array=sort(temp_array,'descend'); 
   for j=1:weight 
     Huffman_Tree(j,col+1)=temp_array(j);
   end
  col=col+1;
end

disp(Huffman_Tree);



%% d)- Efficiency
 % creationg an array for for the number of bits of each source information
no_bits=zeros(1,length(prob_dist_sorted_descend));

for i=1:length(prob_dist_sorted_descend) %calculating the number of bits of each source information
                                         % by calling the counter2 function                                   
    no_bits(i)=counter2(prob_dist_sorted_descend(i),LChilds_array,RChilds_array,Parents_array);
end
  %calculating the L_average of the source information array by
  %multiplying each source prob. * no. of bits of that source
  L_avg=sum(prob_dist_sorted_descend.*no_bits);
  % calculating the efficiency of the source information array 

  Efficiency= H/L_avg;
  
  fprintf('\n Efficiency = %f \n',Efficiency);

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%%  check by Matlab built-in huffman function


Symbols=(1:6); %Alphapet vector
[CodeWords2,L2_avg]=huffmandict(Symbols,prob_dist_sorted_descend);
CodeWords2(:, 2) = cellfun(@num2str, CodeWords2(:, 2), 'UniformOutput', false);
  

Efficiency2=H/L2_avg;

%% c)- Codewords
%printing the codeword of each source information
% by calling the Trace_Tree function which trace each source inf. and figure out it's codewords
fprintf('\n CodeWord \n');
for i=1:length(prob_dist_sorted_descend)
    fprintf (' { %d }',i);
    Trace_Tree(prob_dist_sorted_descend(i),LChilds_array,RChilds_array,Parents_array);
    fprintf('\n');
end

fprintf('\n Huffman_Tree \n');
disp(Huffman_Tree);
fprintf('\n Calculated --> Efficiency = %f \n',Efficiency);
 fprintf('\n by matlab check --> Efficiency2 = %f \n',Efficiency2);




 


