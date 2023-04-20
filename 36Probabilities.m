%% the 36 probabilities part
clc;
clear;
prob_dist=[0.1,0.3,0.05,0.09,0.21,0.25];
Prob_new=zeros(36,1);
count=0;
%% Probability of each source of the 36 elements

for i=1:length(prob_dist)
    
    for j=1:length(prob_dist)
      X1=prob_dist(i)*prob_dist(j);
        count=count+1;
       Prob_new(count)=X1;
    end
end

format short;
%prob_dist=[0.1,0.3,0.05,0.09,0.21,0.25];   % probabilites of the sources
prob_dist_sorted=sort(Prob_new,'ascend'); % arranging the probabilities in ascending order 
prob_dist_sorted_descend=sort(Prob_new,'descend'); %arranging the probabilities in descending order
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


%% c)- Codewords
%printing the codeword of each source information
% by calling the Trace_Tree function which trace each source inf. and figure out it's codewords
for i=1:length(prob_dist_sorted_descend)
    fprintf (' { %d }',i);
    Trace_Tree(prob_dist_sorted_descend(i),LChilds_array,RChilds_array,Parents_array);
    fprintf('\n');
end