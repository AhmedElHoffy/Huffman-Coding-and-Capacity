function Trace_Tree( S0,LChilds_array,RChilds_array, Parents_array)
%% this function takes 3 inputs arrays:- Lchilds array, Rchlids array and Parents array 
%% Plus taking the desired S(i) prob. value to trace it in the arrays 
%% then printing the codeword of this prob. value
L_array=LChilds_array;   % creating temp array for Lchilds array
 R_array=RChilds_array;  % creating temp array for Rchilds array
 P_array=Parents_array;  % creating temp array for parents array
Code_Words_array=[];     % creating the arrray of codewords of the desired prob. value
X=S0;                    % creating a temp value for the desired traced prob.
index=0;                 % creating an index that will help in the searching process for the codewords

%% briefly what happens in the rest of the code is that we have 3 arrays 
%% Lchild array=[--,--,--,-,--,--] "1's"
%% Rchild array=[--,--,--,-,--,--] "0's"
%% Parent array=[--,--,--,-,--,--]
%% according to the huffman tree the Lchilds arrays carry binary of value 1
%% while the right childs arrays carry binary of value 0 and a parent could be a child as well
%% Lchilds(i)< Rchlid(i)
%% the function takes S0 and look for it in the childs arrays 
%% if it's found the binary value is assigned and the current index makes the searching target is
%% the parent of the found value and this process contine untill the index 
%% reaches the end of the arrays
if(find((L_array)==X) )
     index=find(( L_array)==X);
     binary=1;
    
     Code_Words_array=[binary,Code_Words_array];
     if (index==size( L_array))
       return;
     end
     X=Parents_array(index(1));
     Trace_Tree(X,L_array,R_array,P_array);
elseif (find((R_array)==X) )
    %disp('yes2');
    index=find((R_array)==X);
     binary=0;
  
     Code_Words_array=[binary,Code_Words_array];
      if (index==size(R_array))
       return;
     end
     X=Parents_array(index(1));
     Trace_Tree(X,L_array,R_array, P_array);
end
  fprintf(' %2.f ',Code_Words_array);
end
