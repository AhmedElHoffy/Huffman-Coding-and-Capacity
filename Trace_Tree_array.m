function Trace_Tree_array( Prob_array,LChilds_array,RChilds_array, Parents_array)
%format bank; 
for i=1:length(Prob_array)
L_array=LChilds_array;
 R_array=RChilds_array;
 P_array=Parents_array;
Code_Words_array=[];
X=Prob_array(i); 
stop_bit=0;
index=0;
if(find(( L_array)==X) )
    %disp('yes');
     index=find(( L_array)==X);
     binary=1;
     Code_Words_array=[binary,Code_Words_array];
     if (index==size( L_array))
       return;
     end
     X=Parents_array(index);
     Trace_Tree_array(X,L_array,R_array,P_array);
elseif (find((R_array)==X) )
    %disp('yes2');
    index=find((R_array)==X);
     binary=0;
     Code_Words_array=[binary,Code_Words_array];
      if (index==size(R_array))
          stop_bit=1;
       return;
     end
     X=Parents_array(index);
     Trace_Tree_array(X,L_array,R_array, P_array);
end
  fprintf(' %2.f ',Code_Words_array);
  if (stop_bit==1)
      %fprintf(' %2.f ',Code_Words_array);
      fprintf('--');
  end
end
end
