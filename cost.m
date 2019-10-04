%This is the cost function. Modify this to have a desired cost function.
%We have used Mean Squared Error function here.

%Variables:
  % Theta =  Approximations of the output values as a matrix
  % y_val = Output array
  % cost = Mean Squared Error 
  
%------------------------------------------------------------------------------%

function [cost] = cost(Theta,y_val)
  
  temp=0;
  
  len=length(Theta);
  
  for i=1:len
    dif=Theta(i)-y_val(i);
    dif=dif^2;
    temp=temp+dif;
  endfor
  temp=temp/len;
  cost=temp;
endfunction
