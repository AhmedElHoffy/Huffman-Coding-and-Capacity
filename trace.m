function trace(so)
 if (so>2)
     x=input('enter your number');
      if(x==2)
      return;
      end
      trace(x);
 elseif(so<2)
       disp('s0<2');
   xx=input('enter your 2nd number');
      if(xx==2)
      return;
      end
      trace(xx);
 end

end