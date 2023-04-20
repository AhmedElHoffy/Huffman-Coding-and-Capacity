clc;
clear;
format short;
prob_dist=[0.1,0.3,0.05,0.09,0.21,0.25];
prob_dist_sorted=sort(prob_dist,'ascend');
prob_dist_sorted_descend=sort(prob_dist,'descend');
Root=1; %Total Probability of occurences = 1
parent=libpointer; LChild=libpointer; RChild=libpointer;
LChilds_array=[]; LChilds_Counts=0;
RChilds_array=[]; RChilds_Counts=0;
Parents_array=[]; parents_Counts=0;
Huffman_Tree= zeros(6,5);
Huffman_Tree(:,1)= sort(prob_dist_sorted','descend');
col=1;
for i=1:length(prob_dist_sorted)-1
  Lchild=prob_dist_sorted(1);  
  LChilds_array(LChilds_Counts+1)=Lchild; LChilds_Counts=LChilds_Counts+1;
  prob_dist_sorted=prob_dist_sorted(2:end);
  
  Rchild=prob_dist_sorted(1);
  RChilds_array(RChilds_Counts+1)=Rchild; RChilds_Counts=RChilds_Counts+1;
  prob_dist_sorted=prob_dist_sorted(2:end);
  
  Parent=Lchild+Rchild;
  Parents_array(parents_Counts+1)=Parent; parents_Counts=parents_Counts+1;
  % tree diagram algorithm
  prob_dist_sorted=[Parent,prob_dist_sorted];
  
  if any(prob_dist_sorted(1:end)<=Parent)
   prob_dist_sorted=sort(prob_dist_sorted,'ascend');
  end
  
  %%huffmanu tree
  weight=size( prob_dist_sorted,2) ;
  temp_array=prob_dist_sorted';
  temp_array=sort(temp_array,'descend');
   for j=1:weight 
     Huffman_Tree(j,col+1)=temp_array(j);
   end
  col=col+1;
end
%pt=libpointer;
for i=1:length(prob_dist_sorted_descend)
    fprintf (' { %d }',i);
    Trace_Tree(prob_dist_sorted_descend(i),LChilds_array,RChilds_array,Parents_array);
    fprintf('\n');
end

%Trace_Tree_array(prob_dist_sorted_descend,LChilds_array,RChilds_array,Parents_array);




