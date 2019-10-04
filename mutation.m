%This function mutates and cross-overs our population

%NOTE:
%We have used a mutation function which modifies the existing player with
%taking the best player from the previous generation into consideration. This
% mutation function is different from the genetic mutation function used more often

%Variables:
  % mat = Matrix to be mutated and crossed over. It is assumed that the 
  %       magnitude of the 3rd dimension is the population count 
  % best = Best player from the previous generation
  % mu = Mutation constant
  % cr = Cross-Over Probability
  
  
%------------------------------------------------------------------------------%
  
  
function [crossed_over] = mutation(mat,best)
  
  %Adjust these as desired.
  %Mutation constant
  mu = 0.5;
  %Cross-Over Probability
  cr = 0.5;
  
  
  s = size(mat);
  NP = s(3);
  r = s(1);
  c = s(2);
  B = mat;
  x=0;
  y=0;
  temp=0;
  
  
  for i = 1:NP
 

    x = randi(NP);

    y = randi(NP);
 
  
  
    B(1:r,1:c,i) = B(1:r,1:c,i)+ mu* (B(1:r,1:c,best)-B(1:r,1:c,i))+ mu* (B(1:r,1:c,x)-B(1:r,1:c,y));
  endfor
  
  for j = 1:NP
    temp=rand;
    if temp>cr
      mat(1:r,1:c,j)=B(1:r,1:c,j);
    endif
    
  endfor
  
  crossed_over = mat;
  
  
endfunction
