%%for loop of the trace fn
function [x,exist,L_R]=trace2(Parent,Lchlid_array,Rchild_array)
  exist=0;
    for i=1:length(Lchlid_array)
        if (Parent==Lchlid_array(i))
            exist=1;
            x=i;
            L_R='L';
        elseif(Parent==Rchild_array(i))
            exist=1;
            x=i;
            L_R='R';
        end
        
    end
 
end