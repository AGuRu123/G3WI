# Gradient-Based Multi-Label Feature Selection Considering Three-Way Variable Interaction 

# Abstract
  Nowadays, Multi-Label Feature Selection (MLFS) attracts more and more attention to tackle the high-dimensional problem in multi-label data. A key characteristic of existing gradient-based MLFS methods is that they typically consider two-way variable correlations between features and labels, including feature-feature and label-label correlations. However, two-way correlations are not sufficient to steer feature selection since such correlations vary given different additional variables in practical scenarios, which leads to the selected features with relatively-poor classification performance. Motivated by this, we capture three-way variable interactions including feature-feature-label and feature-label-label interactions to further characterize the fluctuating correlations in the context of another variable, and propose a new gradient-based MLFS approach incorporating the above three-way variable interactions into a global optimization objective. Specifically, based on information theory, we develop second-order regularization penalty terms to regard three-way interactions while jointly combining with the main loss term in regard to feature relevance. Then the objective function can be efficiently optimized via a block-coordinate gradient descent schema. Meanwhile, we provide a theoretical analysis demonstrating the effectiveness of the regularization terms in exploiting three-way interaction. In addition, experiments conducted on a series of benchmark data sets also verify the validity of the proposed method on multiple evaluation metrics.


# Description of data sets
The data set "IT_corel15k" stores the original training and testing data, additionally a struct called "para" stores the calculated Information-theory-based criteria, the following are the useful details: 

para.MIxy: A matrix whose $(i,j)_{th}$ element stores the mutual information between $f_i$ and $l_j$. para.IGxxy: A cell contains $a_$


$q$ matrices, $q$ is the number of labels. The $(i,j)_{th}$ element in the $k_{th}$ matrix stores the information gain $IG$.

para.IGxyy: A cell contains $d$ matrices, $d$ is the number of features.




# Main contributions
1. As a gradient-based method, we first investigate the problem of changing variable correlations in MLFS and propose a numerical optimization framework by considering such three-way interactions.           

2. On the basis of information theory, two second-order regularization penalty terms are developed to model three-way interactions for MLFS, and the effectiveness of the regularization terms in exploring three-way interactions is demonstrated based on theoretical analysis.

3. We optimize the objective function via iterative coordinate descent for each block of the feature importance matrix, and the closed-form solution of each block is easily obtained as the stationary point of a quadratic function.
 
# Publication
 The paper has been accepted by Pattern Recognition.2023

