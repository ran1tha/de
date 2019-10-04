%------------------------------------------------------------------------------%
%%%%%% Training an Artificial Neural Network using Differential Evolution %%%%%%
%------------------------------------------------------------------------------%

%%% Author: Ranitha Mataraarachchi
%%% Date: 03.10.2019

%------------------------------------------------------------------------------%


%In this Matlab file we have used differential evolution optimization to train an
%Artificial Neural Network with the architecture (3-16-1). We have trained a simple
%regression problem and we have artificially manipulated train/test data using 
%a function (This function can be changed at any time) and a set of randomly 
%generated input values. 



clc 
clear all
close all
%------------------------------------------------------------------------------%
%%%Generate Train/Test Data%%%

%This is the number of examples
m = 500;

%Number of features
n = 3;

%Randomly generate input matrix
inputs = rand(n,m);

%Generate the output array. Here we have simply used the product of all three
%features. But this can be changed to any function of choice. Output array should 
%be strictly a 1 by m array.

outputs = ones(1,m);
for q = 1:n
outputs = outputs.*inputs(q,1:m);
endfor

%Seperate train/test input/output matrices
%split the data in any ratio. Here we have splitted 0.8 for train and 0.2 for test
tr = round(0.8*m);
ts = m-tr;

train_in = inputs(1:n,1:tr);
test_in = inputs(1:n,(tr+1):m);
train_out = outputs(1:tr);
test_out = outputs((tr+1):m);


%------------------------------------------------------------------------------%
%%%Randomly Initialize Weights and Biases Population%%%


%The network is a 1-10-1 NN with ReLU as the Activation
%Random Initiation of weights and biases
%There are two weight matrices W1 and W2 and two biase matrices B1 and B2

%Initialize a population of NP players ready to be optimized. Here the
% weight/bias matrices are considered as players and they get updated each generation.
%We have initialized the NP to be 2 times the number of all the weights and biases
NP = 100;

%Number of nodes in the hidden layer
nodes = 8;

%Randomly initialize W1,W2,W3,W4 as 3D matrices as the 3rd dimension represents 
%the player identity.
W1 = rand(nodes,n,NP);

W2 = rand(1,nodes,NP);

B1_col = rand(nodes,1,NP);
B1 = B1_col;
for j = 1:(tr-1)
  B1 = [B1,B1_col];
endfor

B2_col = rand(1,1,NP);
B2 = B2_col;
for j = 1:(tr-1)
  B2 = [B2,B2_col];
endfor


%------------------------------------------------------------------------------%
%%%Evolution Process%%%

%Number of generations to pass
gen = 25;

%store cost and substitution data for analysis
avg_cost = zeros(1,gen);
tot_sub = zeros(1,gen);

%The main loop
for g = 1:gen


%Initial Feed Forward
%Initial cost array
initial_cost=zeros(1,NP);

%Pass to Feed Forward function specially designed to this architecture
initial_cost = FeedForward(W1,W2,B1,B2,NP,nodes,n,tr,train_in,train_out,1); 

%Retrieve the best player in that generation
[M,Index] = min(initial_cost);

%Calculate Mutation Matrices and check cross over
W1_mut = mutation(W1,Index);
W2_mut = mutation(W2,Index);
B1_mut = mutation(B1,Index);
B2_mut = mutation(B2,Index);


%Secondary Feed Forward
%Secondary cost array
second_cost=zeros(1,NP);

%Pass to Feed Forward function specially designed to this architecture
second_cost = FeedForward(W1_mut,W2_mut,B1_mut,B2_mut,NP,nodes,n,tr,train_in,train_out,2); 


%Selection into next generation

sub=0;

for r = 1:NP
  if second_cost(r)<initial_cost(r)
    
    
    W1(1:nodes,1:n,r)=W1_mut(1:nodes,1:n,r);
    W2(1,1:nodes,r)=W2_mut(1,1:nodes,r);
    B1(1:nodes,1:tr,r)=B1_mut(1:nodes,1:tr,r);
    B2(1,1:tr,r)=B2_mut(1,1:tr,r);
    
    sub=sub+1;
  endif
endfor

% Print Summary of the current generation
printf('Generation: %i \n',g);
printf('Avg cost: %f \n',mean(initial_cost));
printf('Substituted players: %i \n',sub);

%Plots
avg_cost(g) = mean(initial_cost);
tot_sub(g) = sub;

avg_cost_temp = zeros(1,g);

for s = 1:g
  avg_cost_temp = avg_cost(1,1:g);
endfor

plot(avg_cost_temp);
title('Generation vs Cost')
xlabel('Generation') 
ylabel('Cost')
grid on

 
g++;
endfor

%------------------------------------------------------------------------------%
%%%Testing Process%%%

%We find the Accuracy of the Neural Network by feeding the test data which the
%network has never seen before

%We use the same cost function as above
%We make predictions with the best player in the last generation
[minimum,best_player] = min(second_cost);

%Final weights and biases
W1_final=W1(1:nodes,1:n,best_player);
W2_final=W2(1,1:nodes,best_player);
B1_final=B1(1:nodes,1:ts,best_player);
B2_final=B2(1,1:ts,best_player);

%Estimation. We use the ReLU function
Estimation = W2_final*relu(W1_final*test_in+B1_final)+B2_final;

%Cost Calculation and display
final_cost = cost(Estimation , test_out);
printf('Final cost for %i test examples after %i generations: %f ',ts,g,final_cost);


