# Training an Artificial Neural Network using Differential Evolution

[octave-5.1.0]

In this Repository, the ANN_Using_Differential_Evolution.m file is used to train a simple Artificial Neural Network of 1 hidden layer using Differential Evolution optimization algorithm instead of the widely used backpropagation algorithm. To use the backpropagation algorithm the activation function and the cost function should be non-linear (to avoid the vanishing gradient problem). But, if differential evolution is used, the activation and cost functions can be linear as well. 

The training examples are generated using an adjustable function.
This algorithm evolves a population of weights and biases over several generations to find the optimum weights and biases.
NOTE:
Here a customized mutation function is used which modifies the existing player by
taking the best player from the previous generation into consideration. This
mutation function is different from the genetic mutation function used more often. (Player refers to a single weight/bias vector from one generation )


All the variables including the population count, number of neurons in the hidden layer, number of input features, number of training examples, evolution parameters can be adjusted. 

For demonstration purposes, a neural network of the architecture 3-8-1 was trained using 400 training examples and 100 test examples. The function used was to simply multiply all the 3 input features together. The cost was estimated using the Mean Square Method. After training for 25 generations the final cost for the test examples (examples which the Network had no prior knowledge of) came out to be as low as  0.003971. The Generation vs Cost plot for the above example is attached in this repository. 



<br/>
<br/>
<br/>
<br/>

Ranitha Mataraarachchi, <br/>
Room No: 2234, <br/>
Akbar-Nell Hall, <br/>
Faculty of Engineering, <br/>
University of Peradeniya, <br/>
Peradeniya, Sri Lanka.

(+94)777722662 </br>
ranitha@ieee.org <br/>
[Facebook](https://www.facebook.com/1994ranitha) | [LinkedIn](https://www.linkedin.com/in/ranitha/)
