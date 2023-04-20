function C=counter2(val,LChilds_array,RChilds_array,Parents_array)
%% this function takes 3 inputs arrays:- Lchilds array, Rchlids array and Parents array 
%% Plus taking the desired S(i) prob. value to count the bts of the codeword of the val
%% then returning the number of bits as an integer
%% this function uses the same dearching method as Trace_tree function with the difference 
%% of counting the bits not printing the codewords as the Trace_tree function functionallity
temp=val;
count=0;
index=0;
    while (index(1)<length(LChilds_array) || index(1)<length(RChilds_array))
        if(find(LChilds_array==temp))
          index=find(LChilds_array==temp);
          count=count+1;
          temp=Parents_array(index(1));
        
        elseif(find(RChilds_array==temp))
          index=find(RChilds_array==temp);
          count=count+1;
          temp=Parents_array(index(1)); 
        end 
    end
    
    C=count;
end