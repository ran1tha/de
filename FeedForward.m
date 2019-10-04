%This Function calculates the cost of each example in the training set and stores 
%them in an array.

%CAUTION: This function is to be used only if the architecture of the ANN is n-nodes-1

%Variables:
  % W1,W2 = Weight matrices
  % B1,B2 = Bias matrices
  % NP = population count
  % nodes = nodes in the hidden layer 
  % n = features
  % tr = training examples
  % train_in = input matrix of the training examples
  % train_out = output array of the training examples 

  
%------------------------------------------------------------------------------%

function [cost_array] = FeedForward (W1,W2,B1,B2,NP,nodes,n,tr,train_in,train_out,f)

cost_array_a = zeros(1,NP);

  
  for i = 1:NP
W1_a=W1(1:nodes,1:n,i);
W2_a=W2(1,1:nodes,i);
B1_a=B1(1:nodes,1:tr,i);
B2_a=B2(1,1:tr,i);

%Estimation. We use the ReLU function
Theta = W2_a*relu(W1_a*train_in+B1_a)+B2_a;

%Cost Calculation
cost_array_a(i) = cost(Theta , train_out);
i++;

printf('Feed %i on player: %i/%i \n',f,i-1,NP);
endfor

cost_array = cost_array_a;
  
endfunction
