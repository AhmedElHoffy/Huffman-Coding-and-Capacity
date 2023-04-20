function C=counter(val,LChilds_array,RChilds_array,Parents_array,count)
R_array=RChilds_array;
L_array=LChilds_array;
P_array=Parents_array;
%Code_Words_array=[];
temp=val;
X=count; 
%index=0;
if(find((L_array)==temp) )
    %disp('yes');
     index=find(( L_array)==temp);
     %binary=1;
      X=X+1;
     %Code_Words_array=[binary,Code_Words_array];
     if (index==length( L_array))
       return;
     end
     temp=Parents_array(index);
    counter(temp,L_array,R_array,P_array,X);
elseif (find((R_array)==temp) )
    %disp('yes2');
    index=find((R_array)==temp);
     %binary=0;
     X=X+1;
     %Code_Words_array=[binary,Code_Words_array];
      if (index==length(R_array))
       return;
     end
     temp=Parents_array(index);
     counter(temp,L_array,R_array,P_array,X);
    % Trace_Tree(X,L_array,R_array, P_array);
end
   C=X; 
end