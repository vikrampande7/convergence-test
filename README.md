# convergence-test
Part of NCSU coursework ECE 514 - Random Processes

- Understanding the probability distributions, transformations of RVs, convergences, Central Limit Theorem and LLN (Law of Large Numbers) is very important while solving communications/Machine Learning/Deep Learning Problems.
- Central Limit Theorem is the most important concept in Statistics and makes us understand why Normal (Gaussian) distribution is popular while solving problems. As we increase the samples/data points, every distribution with finite mean and variance follows Normal distribution. This is what is proved in a part of this project.
- Another most important aspect in probability is convergence, all the four types of convergence are proved in another part of this project.
- Lastly, it is very important to understand the correlation between to  variables. It is important to know the dependency between vatiables on one another which could be known with correlation. The verification of correlation is also implemented in this project.

- The project is divided into two parts.
- Part I
  - Simulation of Random Vairables using both Matlab routine and Rejection Method for three types of distributions such as Normal, Uniform and Exponential with different numbers of samples such as 100, 1000 and 10000.
  - Transformation of Random Variables. Random Variables are transformed using g(f(x)) to get a transformed RV for all three distributions.
  - Convergence Test for Random Variables. Followed a paper to test the convergence in probability, convergence in distribution, convergence in power i.e. mean squared convergence, almost sure convergence for three distributions. Made a GUI with MATLAB.
  
- Part II
  - Verification of Theoretical values of Covarriance Matrix and Covarriance matrix obtained by Cholesky Method in Matlab.
  
- Part I Problem 1: Generation of distributions using MATLAB routine and REJECTION method files:
  - p1_normal_routine_rejection.m, p1_uniform_routine_rejection.m, p1_exponential_routine_rejection.m
- Part I Problem 2: Transformation of Random Variables files:
  - p2_transform_normal.m, p2_transform_uniform.m, p2_transform_exponential.m
- Part I Problem 3: Convergence Testing and GUI files:
  - p3_convergence_GUI.mlapp, p3_convergence_normal.m, p3_convergence_uniform.m, transformation_variable.m
- Part II: Verification of Covarriance Matrix files:
  - part2.m
