%This function evaluates and outputs a ReLU activated matrix for any given
%2-D input matrix 

%Variables:
  % mat = input matrix
  % activated = relu activated matrix
 
%------------------------------------------------------------------------------% 
  
function [activated] = relu(mat)

  s = size(mat);
  r = s(1);
  c = s(2);
  out = zeros(r,c);
  
  for i = 1:r
    for j = 1:c
      if mat(i,j)>=0
        out(i,j)=mat(i,j);
      else
        out(i,j)=0;
      endif
      j++;
    endfor
    i++;
  endfor

  activated = out;
endfunction
