clear;clc;
name = 'IT_emotions';
Apara = Initialization;
load([name '.mat']);

Num=10; %Parameters of MLKNN
Smooth = 1;

ResultG3WI = [];

[rank_G3WI,time_G3WI] = G3WI(para,Apara);

k = 1;%number of selected features
f=rank_G3WI(1:k);
[Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
[Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 

ResultG3WI  = EvaluationAll(Pre_Labels,Outputs,test_target);
