clc;
clear;
Lchild_array=[0.05,0.1,0.21,0.25,0.45]; %1's 
Rchild_array=[0.09,0.14,0.24,0.3,0.55]; %0's
Parent_array=[0.14,0.24,0.45,0.55,1];
x=0.05;
index=1;
count=0;
code_array=[];
while(index~=length(Parent_array))  
   for i=index:length(Lchild_array)
        if(Lchild_array(i)==x)
            %disp('found');
            pt_Ch=find(Lchild_array==x)
             index=pt_Ch;
            binary=1;
            x=Parent_array(index);
            code_array=[binary,code_array];
            count=count+1;
        end
end
     if (any(round(Lchild_array(1:end),2))==x)
         pt_Ch=find(Lchild_array,2)==x;
        
     elseif (any(round(Rchild_array(1:end),2))==x)
       pt_Ch=find(Lchild_array,2)==x;
         index=pt_Ch;
         binary=0;
         x=Parent_array(index);
         code_array=[binary,code_array];
         count=count+1;
     end

end

