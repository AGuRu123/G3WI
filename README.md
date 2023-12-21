# G3WI
Gradient-based multi-label feature selection considering three-way variable interaction 

# Abstract
  Nowadays, Multi-Label Feature Selection (MLFS) attracts more and more attention to tackle the high-dimensional problem in multi-label data. A key characteristic of existing gradient-based MLFS methods is that they typically consider two-way variable correlations between features and labels, including feature-feature and label-label correlations. However, two-way correlations are not sufficient to steer feature selection since such correlations vary given different additional variables in practical scenarios, which leads to the selected features with relatively-poor classification performance. Motivated by this, we capture three-way variable interactions including feature-feature-label and feature-label-label interactions to further characterize the fluctuating correlations in the context of another variable, and propose a new gradient-based MLFS approach incorporating the above three-way variable interactions into a global optimization objective. Specifically, based on information theory, we develop second-order regularization penalty terms to regard three-way interactions while jointly combining with the main loss term in regard to feature relevance. Then the objective function can be efficiently optimized via a block-coordinate gradient descent schema. Meanwhile, we provide a theoretical analysis demonstrating the effectiveness of the regularization terms in exploiting three-way interaction. In addition, experiments conducted on a series of benchmark data sets also verify the validity of the proposed method on multiple evaluation metrics.


# Description of data sets
The data set "IT_emotions" stores the original training and testing data, additionally a struct called "para" stores the calculated Information-theory-based criteria, the following are the useful details: 

`para.MIxy`: A matrix whose $(i,j)_{th}$ element stores the mutual information $I(f\_i;l\_j)$;

`para.IGxxy`: A cell contains $q$ matrices, $q$ is the number of labels. The $(i,j)\_{th}$ element in the $k\_{th}$ matrix stores the information gain $IG(f\_i;f\_j;l\_k)$;

`para.IGxyy`: A cell contains $d$ matrices, $d$ is the number of features. The $(k,j)\_{th}$ element in the $i\_{th}$ matrix stores the information gain $IG(f\_i;l\_k;l\_j)$.

# Calculations of information-theory based criteria
On the same homepage, another repository namely "https://github.com/AGuRu123/LOFS/tree/master/LOFS_Matlab/correlation_measure/mi" has two functions "mi" and "cmi" calculating mutual information and conditional mutual information, where information gain (IG) used in G3WI can be calculated as the difference between them. For more details, see our paper: "Gradient-based multi-label feature selection considering three-way variable interaction".

# Main contributions
1. As a gradient-based method, we first investigate the problem of changing variable correlations in MLFS and propose a numerical optimization framework by considering such three-way interactions.           

2. On the basis of information theory, two second-order regularization penalty terms are developed to model three-way interactions for MLFS, and the effectiveness of the regularization terms in exploring three-way interactions is demonstrated based on theoretical analysis.

3. We optimize the objective function via iterative coordinate descent for each block of the feature importance matrix, and the closed-form solution of each block is easily obtained as the stationary point of a quadratic function.
 
# Reference
 Zou Y, Hu X, Li P. Gradient-based multi-label feature selection considering three-way variable interaction[J]. Pattern Recognition, 2024, 145: 109900.

